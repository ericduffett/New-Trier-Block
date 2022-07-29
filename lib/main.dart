import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_widgetkit/flutter_widgetkit.dart';
import 'package:new_version/new_version.dart';
import 'package:nt_block_android/bell_schedule.dart';
import 'package:nt_block_android/new_trier_colors.dart';
import 'package:nt_block_android/new_trier_dates.dart';
import 'package:nt_block_android/schedule_entry_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as timezones;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:external_app_launcher/external_app_launcher.dart';

import 'calendar.dart';
import 'loading.dart';
import 'plds.dart';
import 'profile_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NT Block',
      theme: ThemeData(
          fontFamily: 'Poppins',
          primaryColor: NewTrierColors.blue,
          appBarTheme: const AppBarTheme(
              color: NewTrierColors.blue,
              titleTextStyle: TextStyle(
                color: Colors.white,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
              )
          ),
          textTheme: const TextTheme(
            headline1: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 32,
            ),
            headline2: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            headline3: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w200,
              fontSize: 20,
            ),
            headline4: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          textButtonTheme: TextButtonThemeData(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(NewTrierColors.blue),
              )
          ),
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          inputDecorationTheme: const InputDecorationTheme(
              focusColor: NewTrierColors.blue,
              floatingLabelStyle: TextStyle(
                color: NewTrierColors.blue,
              ),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: NewTrierColors.blue,
                  )
              )
          ),
          textSelectionTheme: const TextSelectionThemeData(
            cursorColor: NewTrierColors.blue,
          )
      ),
      home: const LoadingWidget(),
    );
  }
}

class BellScheduleHome extends StatefulWidget {
  const BellScheduleHome({Key? key, required this.savedCampus}) : super(key: key);

  final Campus savedCampus;

  @override
  State<BellScheduleHome> createState() => _BellScheduleHomeState();
}

class _BellScheduleHomeState extends State<BellScheduleHome> with WidgetsBindingObserver {

  Timer? timer; //Countdown timer to track amount of time until next bell.
  Campus campus = Campus.northfield; //Campus user has selected bell times for.
  var scheduleType = ScheduleType.regular; //Schedule type used to change bell times depending the day.

  var dayColor = NewTrierColors.green;
  var currentPeriod = ''; //Current periood in two column countdown timer.
  var nextBellTime = ''; //Time until next bell in two column countdown timer.
  var timeMessageText = ''; //Text above time remaining that shows either "period ends in" or "period starts in"
  var imageAsset = 'images/winnetka-block.png'; //Schedule image.
  var studentSupportDayText = ''; //Detailed message about which classes are canceled.
  var centeredText = 'No School Today'; //Centered text is used to display a single, short message in the middle of the screen (as opposed to the countdown arrangement that's in two columns).
  bool pltToday = false; //Used to determine which widgets are visible at top of screen.


  //Action connected to the change campus button in the AppBar that changes the campus. Changes what's stored in Shared Preferences and reloads the widget timeline.
  void changeCampus(String newCampus) async {
    final prefs = await SharedPreferences.getInstance();
    if (newCampus == 'Winnetka') {
      setState(() {
        campus = Campus.winnetka;
        setBellSchedule(campus, scheduleType);
        determineDayColor();
      });

    } else if (newCampus == 'Northfield') {
      setState(() {
        campus = Campus.northfield;
        setBellSchedule(campus, scheduleType);
        determineDayColor();
      });
    }
    if (Platform.isIOS) {
      await WidgetKit.setItem('campus', newCampus, 'group.com.newTrieriOSAppDev.NewTrierBlockSchedule');
      WidgetKit.reloadAllTimelines();
    }

    prefs.setString('campus', newCampus);
  }


  //Pop up that explains how to use the app. Shown one time when they first open/download the app.
  void showHowToPopUp() async {
    final prefs = await SharedPreferences.getInstance();
    final firstOpen = prefs.getBool('firstOpen') ?? false;
    if (!firstOpen) {
      await Future.delayed(const Duration(seconds: 1));
      showGeneralDialog(
        context: context, pageBuilder: (context, animation1, animation2) {
        return const Text('');
      },
        transitionDuration: const Duration(milliseconds: 300),
        transitionBuilder: (context, animation1, animation2, child) {
          return Transform(
            transform: Matrix4.translationValues(
                0.0, (animation1.value - 1.0) * 200, 0.0),
            child: Opacity(
              opacity: animation1.value,
              child: AlertDialog(
                title: const Text('How to Use NT Block',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: NewTrierColors.blue,
                    fontWeight: FontWeight.bold,
                  ),),
                content: const Text(
                    'This app\'s background color changes colors to show whether it is a blue day, green day, or anchor day (yellow).\n\nThe buttons across the top row allow you to switch campuses, access Canvas, view/update your schedule, and see a Calendar view.'),
                actions: [
                  TextButton(
                    child: const Text('OK'),
                    onPressed: () {
                      prefs.setBool('firstOpen', true);
                      Navigator.of(context).pop();
                      promptScheduleEntry();
                    },
                  )
                ],
              ),
            ),
          );
        },
      );
    } else { //If first open has been completed, prompt schedule entry.
      promptScheduleEntry();
    }
  }


  //Pop up to prompt user to navigate to the profile screen and enter their schedule. Is shown on app download and update from version 1.
  void promptScheduleEntry() async {
    final prefs = await SharedPreferences.getInstance();
    final promptedScheduleEntry = prefs.getBool('promptedScheduleEntry') ?? false;
    if (!promptedScheduleEntry) {
      await Future.delayed(const Duration(seconds: 3));
      showGeneralDialog(
        context: context, pageBuilder: (context, animation1, animation2) {
        return const Text('');
      },
        transitionDuration: const Duration(milliseconds: 300),
        transitionBuilder: (context, animation1, animation2, child) {
          return Transform(
            transform: Matrix4.translationValues(
                0.0, (animation1.value - 1.0) * 200, 0.0),
            child: Opacity(
              opacity: animation1.value,
              child: AlertDialog(
                title: const Text('Would You Like to Enter Your Schedule?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: NewTrierColors.blue,
                    fontWeight: FontWeight.bold,
                  ),),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text('Enter your class name and room number for each period so NT Block can display personalized schedule information.'),
                    SizedBox(
                      height: 4.0,
                    ),
                    Text('You can always completed this step later by tapping the profile icon at the top of the page.',
                      style: TextStyle(
                        fontSize: 12.0,
                        fontStyle: FontStyle.italic,
                      ),
                    )
                  ],
                ),
                actions: [
                  TextButton(
                    child: const Text('Not Now'),
                    onPressed: () {
                      prefs.setBool('promptedScheduleEntry', true);
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: const Text('Yes, Enter Schedule'),
                    onPressed: () {
                      prefs.setBool('promptedScheduleEntry', true);
                      Navigator.of(context).pop();
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ScheduleEntryScreen()));
                    },
                  ),
                ],
              ),
            ),
          );
        },
      );
    }
  }

  //Function automatically called each time they open the app to see if a newer version is available. If so, it requires them to download before moving on.
  void checkForNewVersion() async {
    final newVersion = NewVersion(
      iOSId: 'com.newTrieriOSAppDev.NewTrierBlockSchedule',
      androidId: 'com.newTrieriOSAppDevelopment.nt_block_android',
    );

    final status = await newVersion.getVersionStatus();

    if (status != null && status.canUpdate) {
      newVersion.showUpdateDialog(context: context, versionStatus: status, dialogTitle: 'Schedule Info Outdated', dialogText: 'Please update your app immediately to avoid following an incorrect schedule.', allowDismissal: false);
    }


    //TODO: Test on Android

  }

  void determineDayColor() {
    final today = DateTime.now();

    //Defaults to green day with regular schedule.
    setState(() {
      dayColor = NewTrierColors.green;
      scheduleType = ScheduleType.regular;
    });

  //Define first and last day of school for use below to make background gray.
    final firstDayOfSchool = DateTime(2022, 7, 22); //TODO: Change to 8/22
    final lastDayOfSchool = DateTime(2023, 6, 9);


    //Before or after the school yaer.
    if (today.isBefore(firstDayOfSchool) || today.isAfter(lastDayOfSchool)) {
      setState(() {
        dayColor = NewTrierColors.gray;
        centeredText = 'Enjoy your summer!';
        return;
      });
    }

    //Weekends
    if (today.weekday == 6 || today.weekday == 7) {
      setState(() {
        dayColor = NewTrierColors.gray;
        centeredText = 'No School Today';
        return;
      });
    }

    //Blue Days
    for (var day in blueDays) {
      if (day.year == today.year && day.month == today.month && day.day == today.day) {
        //Matched day, month, year
        setState(() {
          dayColor = NewTrierColors.blue;
        });
      }
    }

    //Anchor Days
    for (var day in anchorDays) {
      if (day.year == today.year && day.month == today.month && day.day == today.day) {
        setState(() {
          dayColor = NewTrierColors.yellow;
        });
      }
    }

    //Holiday
    for (var day in holidays) {
      if (day.year == today.year && day.month == today.month && day.day == today.day) {
        setState(() {
          dayColor = NewTrierColors.gray;
          centeredText = 'No School Today';
        });
      }
    }

    //TODO: Final Exam Schedule Picture

    for (var day in finals) {
      if (day.year == today.year && day.month == today.month && day.day == today.day) {
        //Matched day, month, year
        setState(() {
          scheduleType = ScheduleType.finals; //TODO: Change main widget to display text and check to make sure it's not looking for orange.
          imageAsset = 'images/no-graphic.png'; //TODO:Update image
          dayColor = NewTrierColors.brown;
          centeredText = 'Final Exams Today\nCheck the New Trier website for details.';
        });
      }
    }

    //Testing at Winnetka
    if (campus == Campus.winnetka) {
      if (today.day == winnetkaTesting.day && today.month == winnetkaTesting.month && today.year == winnetkaTesting.year) {
        setState(() {
          scheduleType = ScheduleType.testing; //TODO: Make home screen displays correct info
          imageAsset = 'images/no-graphic.png'; //TODO: Update image? Might never be available.
          dayColor = NewTrierColors.orange;
          centeredText = 'State Testing Today\nSee New Trier website for details.';
        });

      }
    }

    //Testing at Northfield
    if (campus == Campus.northfield) {
      if (today.day == northfieldTesting.day && today.month == northfieldTesting.month && today.year == northfieldTesting.year) {
        setState(() {
          dayColor = NewTrierColors.orange;
          centeredText = 'State Testing Today\nSee New Trier website for details.';
          scheduleType = ScheduleType.testing; //TODO: Make home screen displays correct info
          imageAsset = 'images/no-graphic.png'; //TODO: Update image? Might never be available.
        });

      }

    }


    determineScheduleType();
  }

  //Function that fires each time the app is opened to make sure that the day color & bell schedule is correct.
  void determineScheduleType() {
    final today = DateTime.now();

    setState((){
      scheduleType = ScheduleType.regular;
    });


    if (campus == Campus.winnetka) {


      //Normal Block Schedule
      setState(() {
        if (dayColor == NewTrierColors.blue) {
          imageAsset = 'images/winnetka-blue.png';
        } else {
          imageAsset = 'images/winnetka-green.png';
        }
      });


    }
    else {
      //Northfield campus images & schedules

      setState(() {
        studentSupportDayText = '';
      });

      //Normal schedule
      setState(() {
        if (dayColor == NewTrierColors.blue) {
          imageAsset = 'images/northfield-blue.png';
        } else {
          imageAsset = 'images/northfield-green.png';
        }
      });


      if (today.year == 2022 && today.month == 10 && today.day == 12) {
        scheduleType = ScheduleType.freshmanGTSN;
        //TODO: Add Freshman Go to School Night Info and Graphic
        setState((){
          imageAsset = 'images/no-graphic.png';
        });

        //imageAsset = FreshmanGoToSchool Image //TODO: Add
      }

    }

    //First day of school
    //TODO: Change back to 8/22
    if (today.year == 2022 && today.month == 7 && today.day == 26) {

      setState(() {
        dayColor = NewTrierColors.yellow;
        scheduleType = ScheduleType.openingDay;
        if (campus == Campus.winnetka) {
          imageAsset = 'images/winnetka-opening.png';
        } else {
          imageAsset = 'images/northfield-opening.png';
        }
      });
    }

    for (var day in anchorDays) {
      if (day.year == today.year && day.month == today.month && day.day == today.day) {
        setState(() {
          scheduleType = ScheduleType.anchor;
          if (campus == Campus.winnetka) {
            imageAsset = 'images/winnetka-anchor.png';
          } else {
            imageAsset = 'images/northfield-anchor.png';
          }

        });
      }
    }

    for (var day in earlyDismissals) {
      if (day.year == today.year && day.month == today.month &&
          day.day == today.day) {
        setState(() {
          scheduleType = ScheduleType.earlyDismissal;
          if (campus == Campus.winnetka) {
            imageAsset = 'images/winnetka-early.png'; //TODO: Update with new
          } else {
            imageAsset = 'images/northfield-early.png'; //TODO: Update with new
          }

        });
      }
    }

    //Anchor day early dismissal dates on 1/9 and 6/9 2023
    if ((today.year == 2023 && ((today.month == 1 && today.day == 9) || (today.month == 6 && today.day == 9)))){
      setState((){
        dayColor = NewTrierColors.yellow;
        scheduleType = ScheduleType.anchorEarlyDismissal;
        if (campus == Campus.winnetka) {
          imageAsset = 'images/no-graphic.png'; //TODO: Change image
        } else {
          imageAsset = 'images/no-graphic.png';//TODO: Change image
        }
      });
    }

    for (var day in lateStarts) {
      if (day.year == today.year && day.month == today.month &&
          day.day == today.day) {
        setState(() {
          scheduleType = ScheduleType.lateStart;
          if (campus == Campus.winnetka) {
            imageAsset = 'images/winnetka-late.png'; //TODO: Update with new
          } else {
            imageAsset = 'images/northfield-late.png'; //TODO: Update with new
          }
        });
      }
    }

    for (var day in extendedAdviseries) {
      if (day.year == today.year && day.month == today.month &&
          day.day == today.day) {
        setState(() {
          scheduleType = ScheduleType.extendedAdv;
          if (campus == Campus.winnetka) {
            imageAsset = 'images/winnetka-extended-adv.png'; //TODO:Update with new
          } else {
            imageAsset = 'images/northfield-extended-adv.png'; //TODO: Update with new
          }
        });
      }
    }

    //Anchor Day PLT Logic
    if (scheduleType == ScheduleType.anchor) {
      //Anchor day logic for department cancellation messages.
      setState(() {
        studentSupportDayText = 'All classes meet today.';
      });

      for (var pltDay in allPLTs) {
        if (today.day == pltDay.day && today.month == pltDay.month &&
            today.year == pltDay.year) {
          pltToday = true;
          studentSupportDayText =
          'The following departments do not have class today due to Professional Development:\n';
        } else {
          pltToday = false;
        }
      }

      for (var pld in aaPLTs) {
        if (today.day == pld.day && today.month == pld.month &&
            today.year == pld.year) {
          studentSupportDayText += '\nApplied Arts';
        }
      }

      for (var pld in artPLTs) {
        if (today.day == pld.day && today.month == pld.month &&
            today.year == pld.year) {
          studentSupportDayText += '\nArt';
        }
      }

      for (var pld in businessPLTs) {
        if (today.day == pld.day && today.month == pld.month &&
            today.year == pld.year) {
          studentSupportDayText += '\nBusiness Education';
        }
      }

      for (var pld in musicPLTs) {
        if (today.day == pld.day && today.month == pld.month &&
            today.year == pld.year) {
          studentSupportDayText += '\nMusic & Theatre';
        }
      }

      for (var pld in englishPLTs) {
        if (today.day == pld.day && today.month == pld.month &&
            today.year == pld.year) {
          studentSupportDayText += '\nEnglish';
        }
      }

      for (var pld in kwPLTs) {
        if (today.day == pld.day && today.month == pld.month &&
            today.year == pld.year) {
          studentSupportDayText += '\nKinetic Wellness';
        }
      }

      for (var pld in mathPLTs) {
        if (today.day == pld.day && today.month == pld.month &&
            today.year == pld.year) {
          studentSupportDayText += '\nMath';
        }
      }

      for (var pld in mclPLTs) {
        if (today.day == pld.day && today.month == pld.month &&
            today.year == pld.year) {
          studentSupportDayText += '\nModern & Classical Languages';
        }
      }

      for (var pld in sciencePLDs) {
        if (today.day == pld.day && today.month == pld.month &&
            today.year == pld.year) {
          studentSupportDayText += '\nScience';
        }
      }

      for (var pld in ssPLTs) {
        if (today.day == pld.day && today.month == pld.month &&
            today.year == pld.year) {
          studentSupportDayText += '\nSocial Studies';
        }
      }

      for (var pld in specialEdPLTs) {
        if (today.day == pld.day && today.month == pld.month &&
            today.year == pld.year) {
          studentSupportDayText += '\nSpecial Education';
        }
      }
    }
    else {
      setState(() {
        studentSupportDayText = '';
      });
    }

    //Once schedule type has been set, we call a function to update the start/end times of each period.
    setState(() {
      setBellSchedule(campus, scheduleType);
    });

  }


  //Function that fires every second to show what period it is and the time until the next bell.
  void determineCurrentPeriod() {
    final now = DateTime.now();
    setState(() {
      if (campus == Campus.winnetka) {
        if (scheduleType == ScheduleType.regular || scheduleType == ScheduleType.earlyDismissal || scheduleType == ScheduleType.lateStart) {
          if (now.isBefore(startOfAdvisery)) {
            currentPeriod = 'Before Advisery';
            timeMessageText = 'Advisery Starts In';
            timeUntilNextBell(startOfAdvisery);
          } else
          if (now.isAfter(startOfAdvisery) && now.isBefore(endOfAdvisery)) {
            currentPeriod = 'Advisery';
            timeMessageText = 'Advisery Ends In';
            timeUntilNextBell(endOfAdvisery);
          } else if (now.isAfter(endOfAdvisery) && now.isBefore(start1A)) {
            currentPeriod = 'Passing Period';
            timeMessageText =
            dayColor == NewTrierColors.blue ? '1A Starts In' : '5A Starts In';
            timeUntilNextBell(start1A);
          } else if (now.isAfter(start1A) && now.isBefore(end1A)) {
            currentPeriod = dayColor == NewTrierColors.blue ? '1A' : '5A';
            timeMessageText = 'Period Ends In';
            timeUntilNextBell(end1A);
          } else if (now.isAfter(end1A) && now.isBefore(start1B)) {
            currentPeriod = 'Passing Period';
            timeMessageText =
            dayColor == NewTrierColors.blue ? '1B Starts In' : '5B Starts In';
            timeUntilNextBell(start1B);
          } else if (now.isAfter(start1B) && now.isBefore(end1B)) {
            currentPeriod = dayColor == NewTrierColors.blue ? '1B' : '5B';
            timeMessageText = 'Period Ends In';
            timeUntilNextBell(end1B);
          } else if (now.isAfter(end1B) && now.isBefore(start2A)) {
            currentPeriod = 'Passing Period';
            timeMessageText =
            dayColor == NewTrierColors.blue ? '2A Starts In' : '6A Starts In';
            timeUntilNextBell(start2A);
          } else if (now.isAfter(start2A) && now.isBefore(end2A)) {
            currentPeriod = dayColor == NewTrierColors.blue ? '2A' : '6A';
            timeMessageText = 'Period Ends In';
            timeUntilNextBell(end2A);
          } else if (now.isAfter(end2A) && now.isBefore(start2B)) {
            currentPeriod = 'Passing Period';
            timeMessageText =
            dayColor == NewTrierColors.blue ? '2B Starts In' : '6B Starts In';
            timeUntilNextBell(start2B);
          } else if (now.isAfter(start2B) && now.isBefore(end2B)) {
            currentPeriod = dayColor == NewTrierColors.blue ? '2B' : '6B';
            timeMessageText = 'Period Ends In';
            timeUntilNextBell(end2B);
          } else if (now.isAfter(end2B) && now.isBefore(start2C)) {
            timeMessageText =
            dayColor == NewTrierColors.blue ? '2C Starts In' : '6C Starts In';
            currentPeriod = 'Passing Period';
            timeUntilNextBell(start2C);
          } else if (now.isAfter(start2C) && now.isBefore(end2C)) {
            currentPeriod = dayColor == NewTrierColors.blue ? '2C' : '6C';
            timeMessageText = 'Period Ends In';
            timeUntilNextBell(end2C);
          } else if (now.isAfter(end2C) && now.isBefore(start3A)) {
            timeMessageText =
            dayColor == NewTrierColors.blue ? '3A Starts In' : '7A Starts In';
            currentPeriod = 'Passing Period';
            timeUntilNextBell(start3A);
          } else if (now.isAfter(start3A) && now.isBefore(end3A)) {
            currentPeriod = dayColor == NewTrierColors.blue ? '3A' : '7A';
            timeMessageText = 'Period Ends In';
            timeUntilNextBell(end3A);
          } else if (now.isAfter(end3A) && now.isBefore(start3B)) {
            timeMessageText =
            dayColor == NewTrierColors.blue ? '3B Starts In' : '7B Starts In';
            currentPeriod = 'Passing Period';
            timeUntilNextBell(start3B);
          } else if (now.isAfter(start3B) && now.isBefore(end3B)) {
            currentPeriod = dayColor == NewTrierColors.blue ? '3B' : '7B';
            timeMessageText = 'Period Ends In';
            timeUntilNextBell(end3B);
          } else if (now.isAfter(end3B) && now.isBefore(start4A)) {
            timeMessageText =
            dayColor == NewTrierColors.blue ? '4A Starts In' : '8A Starts In';
            currentPeriod = 'Passing Period';
            timeUntilNextBell(start4A);
          } else if (now.isAfter(start4A) && now.isBefore(end4A)) {
            currentPeriod = dayColor == NewTrierColors.blue ? '4A' : '8A';
            timeMessageText = 'Period Ends In';
            timeUntilNextBell(end4A);
          } else if (now.isAfter(end4A) && now.isBefore(start4B)) {
            timeMessageText =
            dayColor == NewTrierColors.blue ? '4B Starts In' : '8B Starts In';
            currentPeriod = 'Passing Period';
            timeUntilNextBell(start4B);
          } else if (now.isAfter(start4B) && now.isBefore(end4B)) {
            currentPeriod = dayColor == NewTrierColors.blue ? '4B' : '8B';
            timeMessageText = 'Period Ends In';
            timeUntilNextBell(end4B);
          } else {
            currentPeriod = 'School Day Over';
            if (dayColor == NewTrierColors.blue ||
                dayColor == NewTrierColors.green || dayColor == NewTrierColors.yellow) {
              centeredText = 'School Day Over';
            }
          }
        }
        else if (scheduleType == ScheduleType.anchor || scheduleType == ScheduleType.anchorEarlyDismissal) {
          if (now.isBefore(startOfAdvisery)) {
            currentPeriod = 'Before Advisery';
            timeMessageText = 'Advisery Starts In';
            timeUntilNextBell(startOfAdvisery);
          } else if (now.isAfter(startOfAdvisery) && now.isBefore(endOfAdvisery)) {
            currentPeriod = 'Advisery';
            timeMessageText = 'Advisery Ends In';
            timeUntilNextBell(endOfAdvisery);
          } else if (now.isAfter(endOfAdvisery) && now.isBefore(start1A)) {
            currentPeriod = 'Passing Period';
            timeMessageText = '1st Starts In';
            timeUntilNextBell(start1A);
          } else if (now.isAfter(start1A) && now.isBefore(end1A)) {
            currentPeriod = '1st';
            timeMessageText = 'Period Ends In';
            timeUntilNextBell(end1A);
          } else if (now.isAfter(end1A) && now.isBefore(start1B)) {
            currentPeriod = 'Passing Period';
            timeMessageText = '2nd Starts In';
            timeUntilNextBell(start1B);
          } else if (now.isAfter(start1B) && now.isBefore(end1B)) {
            currentPeriod = '2nd';
            timeMessageText = 'Period Ends In';
            timeUntilNextBell(end1B);
          } else if (now.isAfter(end1B) && now.isBefore(start2A)) {
            currentPeriod = 'Passing Period';
            timeMessageText = '3rd Starts In';
            timeUntilNextBell(start2A);
          } else if (now.isAfter(start2A) && now.isBefore(end2A)) {
            currentPeriod = '3rd';
            timeMessageText = 'Period Ends In';
            timeUntilNextBell(end2A);
          } else if (now.isAfter(end2A) && now.isBefore(start2B)) {
            currentPeriod = 'Passing Period';
            timeMessageText = '4A Starts In';
            timeUntilNextBell(start2B);
          } else if (now.isAfter(start2B) && now.isBefore(end2B)) {
            currentPeriod = '4A';
            timeMessageText = 'Period Ends In';
            timeUntilNextBell(end2B);
          } else if (now.isAfter(end2B) && now.isBefore(start2C)) {
            timeMessageText = '4B Starts In';
            currentPeriod = 'Passing Period';
            timeUntilNextBell(start2C);
          } else if (now.isAfter(start2C) && now.isBefore(end2C)) {
            currentPeriod = '4B';
            timeMessageText = 'Period Ends In';
            timeUntilNextBell(end2C);
          } else if (now.isAfter(end2C) && now.isBefore(start3A)) {
            timeMessageText = '4C Starts In';
            currentPeriod = 'Passing Period';
            timeUntilNextBell(start3A);
          } else if (now.isAfter(start3A) && now.isBefore(end3A)) {
            currentPeriod = '4C';
            timeMessageText = 'Period Ends In';
            timeUntilNextBell(end3A);
          } else if (now.isAfter(end3A) && now.isBefore(start3B)) {
            timeMessageText = '5th Starts In';
            currentPeriod = 'Passing Period';
            timeUntilNextBell(start3B);
          } else if (now.isAfter(start3B) && now.isBefore(end3B)) {
            currentPeriod = '5th';
            timeMessageText = 'Period Ends In';
            timeUntilNextBell(end3B);
          } else if (now.isAfter(end3B) && now.isBefore(start4A)) {
            timeMessageText = '6th Starts In';
            currentPeriod = 'Passing Period';
            timeUntilNextBell(start4A);
          } else if (now.isAfter(start4A) && now.isBefore(end4A)) {
            currentPeriod = '6th';
            timeMessageText = 'Period Ends In';
            timeUntilNextBell(end4A);
          } else if (now.isAfter(end4A) && now.isBefore(start4B)) {
            timeMessageText = '7th Starts In';
            currentPeriod = 'Passing Period';
            timeUntilNextBell(start4B);
          } else if (now.isAfter(start4B) && now.isBefore(end4B)) {
            currentPeriod = '7th';
            timeMessageText = 'Period Ends In';
            timeUntilNextBell(end4B);
          } else if (now.isAfter(end4B) && now.isBefore(anchor8Start)) {
            timeMessageText = '7th Starts In';
            currentPeriod = 'Passing Period';
            timeUntilNextBell(anchor8Start);
          } else if (now.isAfter(anchor8Start) && now.isBefore(anchor8End)) {
            currentPeriod = '8th';
            timeMessageText = 'Period Ends In';
            timeUntilNextBell(anchor8End);
          } else {
            currentPeriod = 'School Day Over';
            if (dayColor == NewTrierColors.blue || dayColor == NewTrierColors.green || dayColor == NewTrierColors.yellow) {
              centeredText = 'School Day Over';
            }

          }
        }
        else if (scheduleType == ScheduleType.openingDay) {
          //Opening Day Bell Schedule here for original countdown timers.
          //Winnetka
          final chicago = timezones.getLocation('America/Chicago');
          // final morningAdvStart = timezones.TZDateTime(chicago, 2022, 8, 22, 8, 20);
          // final morningAdvEnd = timezones.TZDateTime(chicago, 2022, 8, 22, 10, 10);
          // final start1 = timezones.TZDateTime(chicago, 2022, 8, 22, 10, 15);
          // final end1 = timezones.TZDateTime(chicago, 2022, 8, 22, 10, 40);
          // final start2 = timezones.TZDateTime(chicago, 2022, 8, 22, 10, 45);
          // final end2 = timezones.TZDateTime(chicago, 2022, 8, 22, 11, 10);
          // final start3 = timezones.TZDateTime(chicago, 2022, 8, 22, 11, 15);
          // final end3 = timezones.TZDateTime(chicago, 2022, 8, 22, 11, 40);
          // final start4a = timezones.TZDateTime(chicago, 2022, 8, 22, 11, 45);
          // final end4a = timezones.TZDateTime(chicago, 2022, 8, 22, 12, 10);
          // final start4b = timezones.TZDateTime(chicago, 2022, 8, 22, 12, 15);
          // final end4b = timezones.TZDateTime(chicago, 2022, 8, 22, 12, 40);
          // final start4c = timezones.TZDateTime(chicago, 2022, 8, 22, 12, 45);
          // final end4c = timezones.TZDateTime(chicago, 2022, 8, 22, 13, 10);
          // final start5 = timezones.TZDateTime(chicago, 2022, 8, 22, 13, 15);
          // final end5 = timezones.TZDateTime(chicago, 2022, 8, 22, 13, 40);
          // final start6 = timezones.TZDateTime(chicago, 2022, 8, 22, 13, 45);
          // final end6 = timezones.TZDateTime(chicago, 2022, 8, 22, 14, 10);
          // final start7 = timezones.TZDateTime(chicago, 2022, 8, 22, 14, 15);
          // final end7 = timezones.TZDateTime(chicago, 2022, 8, 22, 14, 40);
          // final start8 = timezones.TZDateTime(chicago, 2022, 8, 22, 14, 45);
          // final end8 = timezones.TZDateTime(chicago, 2022, 8, 22, 15, 10);
          // final specialAdvStart = timezones.TZDateTime(chicago, 2022, 8, 22, 15, 15);
          // final specialAdvEnd = timezones.TZDateTime(chicago, 2022, 8, 22, 15, 30);


          //TODO: Adjusted bells for testing. Comment this out and uncomment actual schedule.
          final morningAdvStart = timezones.TZDateTime(chicago, 2022, 7, 26, 8, 20);
          final morningAdvEnd = timezones.TZDateTime(chicago, 2022, 7, 26, 10, 10);
          final start1 = timezones.TZDateTime(chicago, 2022, 7, 26, 10, 15);
          final end1 = timezones.TZDateTime(chicago, 2022, 7, 26, 10, 40);
          final start2 = timezones.TZDateTime(chicago, 2022, 7, 26, 10, 45);
          final end2 = timezones.TZDateTime(chicago, 2022, 7, 26, 11, 10);
          final start3 = timezones.TZDateTime(chicago, 2022, 7, 26, 11, 15);
          final end3 = timezones.TZDateTime(chicago, 2022, 7, 26, 11, 40);
          final start4a = timezones.TZDateTime(chicago, 2022, 7, 26, 11, 45);
          final end4a = timezones.TZDateTime(chicago, 2022, 7, 26, 12, 10);
          final start4b = timezones.TZDateTime(chicago, 2022, 7, 26, 12, 15);
          final end4b = timezones.TZDateTime(chicago, 2022, 7, 26, 12, 40);
          final start4c = timezones.TZDateTime(chicago, 2022, 7, 26, 12, 45);
          final end4c = timezones.TZDateTime(chicago, 2022, 7, 26, 13, 10);
          final start5 = timezones.TZDateTime(chicago, 2022, 7, 26, 13, 15);
          final end5 = timezones.TZDateTime(chicago, 2022, 7, 26, 13, 40);
          final start6 = timezones.TZDateTime(chicago, 2022, 7, 26, 13, 45);
          final end6 = timezones.TZDateTime(chicago, 2022, 7, 26, 14, 10);
          final start7 = timezones.TZDateTime(chicago, 2022, 7, 26, 14, 15);
          final end7 = timezones.TZDateTime(chicago, 2022, 7, 26, 14, 40);
          final start8 = timezones.TZDateTime(chicago, 2022, 7, 26, 14, 45);
          final end8 = timezones.TZDateTime(chicago, 2022, 7, 26, 15, 10);
          final specialAdvStart = timezones.TZDateTime(chicago, 2022, 7, 26, 15, 15);
          final specialAdvEnd = timezones.TZDateTime(chicago, 2022, 7, 26, 15, 30);

          if (now.isBefore(morningAdvStart)) {
            currentPeriod = 'Before Advisery';
            timeMessageText = 'Advisery Starts In';
            timeUntilNextBell(morningAdvStart);
          }
          else if (now.isBefore(morningAdvEnd)) {
            currentPeriod = 'Advisery';
            timeMessageText = 'Advisery Ends In';
            timeUntilNextBell(morningAdvEnd);
          }
          else if (now.isBefore(start1)) {
            currentPeriod = 'Passing Period';
            timeMessageText = '1st Starts In';
            timeUntilNextBell(start1);
          }
          else if (now.isBefore(end1)) {
            currentPeriod = '1st';
            timeMessageText = 'Period Ends In';
            timeUntilNextBell(end1);
          }
          else if (now.isBefore(start2)) {
            currentPeriod = 'Passing Period';
            timeMessageText = '2nd Starts In';
            timeUntilNextBell(start2);
          }
          else if (now.isBefore(end2)) {
            currentPeriod = '2nd';
            timeMessageText = 'Period Ends In';
            timeUntilNextBell(end2);
          }
          else if (now.isBefore(start3)) {
            currentPeriod = 'Passing Period';
            timeMessageText = '3rd Starts In';
            timeUntilNextBell(start3);
          }
          else if (now.isBefore(end3)) {
            currentPeriod = '3rd';
            timeMessageText = 'Period Ends In';
            timeUntilNextBell(end3);
          }
          else if (now.isBefore(start4a)) {
            currentPeriod = 'Passing Period';
            timeMessageText = '4A Starts In';
            timeUntilNextBell(start4a);
          }
          else if (now.isBefore(end4a)) {
            currentPeriod = '4A';
            timeMessageText = 'Period Ends In';
            timeUntilNextBell(end4a);
          }
          else if (now.isBefore(start4b)) {
            currentPeriod = 'Passing Period';
            timeMessageText = '4B Starts In';
            timeUntilNextBell(start4b);
          }
          else if (now.isBefore(end4b)) {
            currentPeriod = '4B';
            timeMessageText = 'Period Ends In';
            timeUntilNextBell(end4b);
          }
          else if (now.isBefore(start4c)) {
            currentPeriod = 'Passing Period';
            timeMessageText = '4C Starts In';
            timeUntilNextBell(start4c);
          }
          else if (now.isBefore(end4c)) {
            currentPeriod = '4C';
            timeMessageText = 'Period Ends In';
            timeUntilNextBell(end4c);
          }
          else if (now.isBefore(start5)) {
            currentPeriod = 'Passing Period';
            timeMessageText = '5th Starts In';
            timeUntilNextBell(start5);
          }
          else if (now.isBefore(end5)) {
            currentPeriod = '5th';
            timeMessageText = 'Period Ends In';
            timeUntilNextBell(end5);
          }
          else if (now.isBefore(start6)) {
            currentPeriod = 'Passing Period';
            timeMessageText = '6th Starts In';
            timeUntilNextBell(start6);
          }
          else if (now.isBefore(end6)) {
            currentPeriod = '6th';
            timeMessageText = 'Period Ends In';
            timeUntilNextBell(end6);
          }
          else if (now.isBefore(start7)) {
            currentPeriod = 'Passing Period';
            timeMessageText = '7th Starts In';
            timeUntilNextBell(start7);
          }
          else if (now.isBefore(end7)) {
            currentPeriod = '7th';
            timeMessageText = 'Period Ends In';
            timeUntilNextBell(end7);
          }
          else if (now.isBefore(start8)) {
            currentPeriod = 'Passing Period';
            timeMessageText = '8th Starts In';
            timeUntilNextBell(start8);
          }
          else if (now.isBefore(end8)) {
            currentPeriod = '8th';
            timeMessageText = 'Period Ends In';
            timeUntilNextBell(end8);
          }
          else if (now.isBefore(specialAdvStart)) {
            currentPeriod = 'Passing Period';
            timeMessageText = 'Advisery Starts In';
            timeUntilNextBell(specialAdvStart);
          }
          else if (now.isBefore(specialAdvEnd)) {
            currentPeriod = 'Advisery';
            timeMessageText = 'Period Ends In';
            timeUntilNextBell(specialAdvEnd);
          } else {
            //School day over.
            currentPeriod = 'School Day Over';
            centeredText = 'School Day Over';
          }

        } //End opening Day if statement for winnetka.

      } //End winnetka campus
      else if (campus == Campus.northfield) {
        if (scheduleType == ScheduleType.regular || scheduleType == ScheduleType.earlyDismissal || scheduleType == ScheduleType.lateStart) {
          if (now.isBefore(startOfAdvisery)) {
            currentPeriod = 'Before Advisery';
            timeMessageText = 'Advisery Starts In';
            timeUntilNextBell(startOfAdvisery);
          } else
          if (now.isAfter(startOfAdvisery) && now.isBefore(endOfAdvisery)) {
            currentPeriod = 'Advisery';
            timeMessageText = 'Advisery Ends In';
            timeUntilNextBell(endOfAdvisery);
          } else if (now.isAfter(endOfAdvisery) && now.isBefore(start1A)) {
            timeMessageText =
            dayColor == NewTrierColors.blue ? '1A Starts In' : '5A Starts In';
            currentPeriod = 'Passing Period';
            timeUntilNextBell(start1A);
          } else if (now.isAfter(start1A) && now.isBefore(end1A)) {
            currentPeriod = dayColor == NewTrierColors.blue ? '1A' : '5A';
            timeMessageText = 'Period Ends In';
            timeUntilNextBell(end1A);
          } else if (now.isAfter(end1A) && now.isBefore(start1B)) {
            currentPeriod = 'Passing Period';
            timeMessageText =
            dayColor == NewTrierColors.blue ? '1B Starts In' : '5B Starts In';
            timeUntilNextBell(start1B);
          } else if (now.isAfter(start1B) && now.isBefore(end1B)) {
            currentPeriod = dayColor == NewTrierColors.blue ? '1B' : '5B';
            timeMessageText = 'Period Ends In';
            timeUntilNextBell(end1B);
          } else if (now.isAfter(end1B) && now.isBefore(start2A)) {
            currentPeriod = 'Passing Period';
            timeMessageText =
            dayColor == NewTrierColors.blue ? '2A Starts In' : '6A Starts In';
            timeUntilNextBell(start2A);
          } else if (now.isAfter(start2A) && now.isBefore(end2A)) {
            currentPeriod = dayColor == NewTrierColors.blue ? '2A' : '6A';
            timeMessageText = 'Period Ends In';
            timeUntilNextBell(end2A);
          } else if (now.isAfter(end2A) && now.isBefore(start2B)) {
            timeMessageText =
            dayColor == NewTrierColors.blue ? '2B Starts In' : '6B Starts In';
            currentPeriod = 'Passing Period';
            timeUntilNextBell(start2B);
          } else if (now.isAfter(start2B) && now.isBefore(end2B)) {
            currentPeriod = dayColor == NewTrierColors.blue ? '2B' : '6B';
            timeMessageText = 'Period Ends In';
            timeUntilNextBell(end2B);
          } else if (now.isAfter(end2B) && now.isBefore(start2C)) {
            timeMessageText =
            dayColor == NewTrierColors.blue ? '3A Starts In' : '7A Starts In';
            currentPeriod = 'Passing Period';
            timeUntilNextBell(start2C);
          } else if (now.isAfter(start2C) && now.isBefore(end2C)) {
            currentPeriod = dayColor == NewTrierColors.blue ? '3A' : '7A';
            timeMessageText = 'Period Ends In';
            timeUntilNextBell(end2C);
          } else if (now.isAfter(end2C) && now.isBefore(start3A)) {
            timeMessageText =
            dayColor == NewTrierColors.blue ? '3B Starts In' : '7B Starts In';
            currentPeriod = 'Passing Period';
            timeUntilNextBell(start3A);
          } else if (now.isAfter(start3A) && now.isBefore(end3A)) {
            currentPeriod = dayColor == NewTrierColors.blue ? '3B' : '7B';
            timeMessageText = 'Period Ends In';
            timeUntilNextBell(end3A);
          } else if (now.isAfter(end3A) && now.isBefore(start3B)) {
            timeMessageText =
            dayColor == NewTrierColors.blue ? '3C Starts In' : '7C Starts In';
            currentPeriod = 'Passing Period';
            timeUntilNextBell(start3B);
          } else if (now.isAfter(start3B) && now.isBefore(end3B)) {
            currentPeriod = dayColor == NewTrierColors.blue ? '3C' : '7C';
            timeMessageText = 'Period Ends In';
            timeUntilNextBell(end3B);
          } else if (now.isAfter(end3B) && now.isBefore(start4A)) {
            timeMessageText =
            dayColor == NewTrierColors.blue ? '4A Starts In' : '8A Starts In';
            currentPeriod = 'Passing Period';
            timeUntilNextBell(start4A);
          } else if (now.isAfter(start4A) && now.isBefore(end4A)) {
            currentPeriod = dayColor == NewTrierColors.blue ? '4A' : '8A';
            timeMessageText = 'Period Ends In';
            timeUntilNextBell(end4A);
          } else if (now.isAfter(end4A) && now.isBefore(start4B)) {
            timeMessageText =
            dayColor == NewTrierColors.blue ? '4B Starts In' : '8B Starts In';
            currentPeriod = 'Passing Period';
            timeUntilNextBell(start4B);
          } else if (now.isAfter(start4B) && now.isBefore(end4B)) {
            currentPeriod = dayColor == NewTrierColors.blue ? '4B' : '8B';
            timeMessageText = 'Period Ends In';
            timeUntilNextBell(end4B);
          } else {
            currentPeriod = 'School Day Over';
            if (dayColor == NewTrierColors.blue ||
                dayColor == NewTrierColors.green) {
              centeredText = 'School Day Over';
            }
          }
        }
        else if (scheduleType == ScheduleType.anchor || scheduleType == ScheduleType.anchorEarlyDismissal) {
          if (now.isBefore(startOfAdvisery)) {
            currentPeriod = 'Before Advisery';
            timeMessageText = 'Advisery Starts In';
            timeUntilNextBell(startOfAdvisery);
          } else if (now.isAfter(startOfAdvisery) && now.isBefore(endOfAdvisery)) {
            currentPeriod = 'Advisery';
            timeMessageText = 'Advisery Ends In';
            timeUntilNextBell(endOfAdvisery);
          } else if (now.isAfter(endOfAdvisery) && now.isBefore(start1A)) {
            currentPeriod = 'Passing Period';
            timeMessageText = '1st Starts In';
            timeUntilNextBell(start1A);
          } else if (now.isAfter(start1A) && now.isBefore(end1A)) {
            currentPeriod = '1st';
            timeMessageText = 'Period Ends In';
            timeUntilNextBell(end1A);
          } else if (now.isAfter(end1A) && now.isBefore(start1B)) {
            currentPeriod = 'Passing Period';
            timeMessageText = '2nd Starts In';
            timeUntilNextBell(start1B);
          } else if (now.isAfter(start1B) && now.isBefore(end1B)) {
            currentPeriod = '2nd';
            timeMessageText = 'Period Ends In';
            timeUntilNextBell(end1B);
          } else if (now.isAfter(end1B) && now.isBefore(start2A)) {
            currentPeriod = 'Passing Period';
            timeMessageText = '3rd Starts In';
            timeUntilNextBell(start2A);
          } else if (now.isAfter(start2A) && now.isBefore(end2A)) {
            currentPeriod = '3rd';
            timeMessageText = 'Period Ends In';
            timeUntilNextBell(end2A);
          } else if (now.isAfter(end2A) && now.isBefore(start2B)) {
            currentPeriod = 'Passing Period';
            timeMessageText = '4th Starts In';
            timeUntilNextBell(start2B);
          } else if (now.isAfter(start2B) && now.isBefore(end2B)) {
            currentPeriod = '4th';
            timeMessageText = 'Period Ends In';
            timeUntilNextBell(end2B);
          } else if (now.isAfter(end2B) && now.isBefore(start2C)) {
            timeMessageText = '5A Starts In';
            currentPeriod = 'Passing Period';
            timeUntilNextBell(start2C);
          } else if (now.isAfter(start2C) && now.isBefore(end2C)) {
            currentPeriod = '5A';
            timeMessageText = 'Period Ends In';
            timeUntilNextBell(end2C);
          } else if (now.isAfter(end2C) && now.isBefore(start3A)) {
            timeMessageText = '5B Starts In';
            currentPeriod = 'Passing Period';
            timeUntilNextBell(start3A);
          } else if (now.isAfter(start3A) && now.isBefore(end3A)) {
            currentPeriod = '5B';
            timeMessageText = 'Period Ends In';
            timeUntilNextBell(end3A);
          } else if (now.isAfter(end3A) && now.isBefore(start3B)) {
            timeMessageText = '5C Starts In';
            currentPeriod = 'Passing Period';
            timeUntilNextBell(start3B);
          } else if (now.isAfter(start3B) && now.isBefore(end3B)) {
            currentPeriod = '5C';
            timeMessageText = 'Period Ends In';
            timeUntilNextBell(end3B);
          } else if (now.isAfter(end3B) && now.isBefore(start4A)) {
            timeMessageText = '6th Starts In';
            currentPeriod = 'Passing Period';
            timeUntilNextBell(start4A);
          } else if (now.isAfter(start4A) && now.isBefore(end4A)) {
            currentPeriod = '6th';
            timeMessageText = 'Period Ends In';
            timeUntilNextBell(end4A);
          } else if (now.isAfter(end4A) && now.isBefore(start4B)) {
            timeMessageText = '7th Starts In';
            currentPeriod = 'Passing Period';
            timeUntilNextBell(start4B);
          } else if (now.isAfter(start4B) && now.isBefore(end4B)) {
            currentPeriod = '7th';
            timeMessageText = 'Period Ends In';
            timeUntilNextBell(end4B);
          } else if (now.isAfter(end4B) && now.isBefore(anchor8Start)) {
            timeMessageText = '7th Starts In';
            currentPeriod = 'Passing Period';
            timeUntilNextBell(anchor8Start);
          } else if (now.isAfter(anchor8Start) && now.isBefore(anchor8End)) {
            currentPeriod = '8th';
            timeMessageText = 'Period Ends In';
            timeUntilNextBell(anchor8End);
          } else {
            currentPeriod = 'School Day Over';
            if (dayColor == NewTrierColors.blue || dayColor == NewTrierColors.green || dayColor == NewTrierColors.yellow) {
              centeredText = 'School Day Over';
            }

          }
        }
        else if (scheduleType == ScheduleType.openingDay) {
          //Opening Day Bell Schedule here for original countdown timers.
          //Northfield
          final chicago = timezones.getLocation('America/Chicago');
          // final advTourStart = timezones.TZDateTime(chicago, 2022, 8, 22, 8, 00);
          // final advTourEnd = timezones.TZDateTime(chicago, 2022, 8, 22, 8, 30);
          // final assemblyStart = timezones.TZDateTime(chicago, 2022, 8, 22, 8, 45);
          // final assemblyEnd = timezones.TZDateTime(chicago, 2022, 8, 22, 9, 15);
          // final advLogisticsStart = timezones.TZDateTime(chicago, 2022, 8, 22, 9, 25);
          // final advLogisticsEnd = timezones.TZDateTime(chicago, 2022, 8, 22, 10, 30);
          // final lunchStart = timezones.TZDateTime(chicago, 2022, 8, 22, 10, 40);
          // final lunchEnd = timezones.TZDateTime(chicago, 2022, 8, 22, 11, 10);
          // final start1 = timezones.TZDateTime(chicago, 2022, 8, 22, 11, 15);
          // final end1 = timezones.TZDateTime(chicago, 2022, 8, 22, 11, 40);
          // final start2 = timezones.TZDateTime(chicago, 2022, 8, 22, 11, 45);
          // final end2 = timezones.TZDateTime(chicago, 2022, 8, 22, 12, 10);
          // final start3 = timezones.TZDateTime(chicago, 2022, 8, 22, 12, 15);
          // final end3 = timezones.TZDateTime(chicago, 2022, 8, 22, 12, 40);
          // final start4 = timezones.TZDateTime(chicago, 2022, 8, 22, 12, 45);
          // final end4 = timezones.TZDateTime(chicago, 2022, 8, 22, 13, 10);
          // final start5 = timezones.TZDateTime(chicago, 2022, 8, 22, 13, 15);
          // final end5 = timezones.TZDateTime(chicago, 2022, 8, 22, 13, 40);
          // final start6 = timezones.TZDateTime(chicago, 2022, 8, 22, 13, 45);
          // final end6 = timezones.TZDateTime(chicago, 2022, 8, 22, 14, 10);
          // final start7 = timezones.TZDateTime(chicago, 2022, 8, 22, 14, 15);
          // final end7 = timezones.TZDateTime(chicago, 2022, 8, 22, 14, 40);
          // final start8 = timezones.TZDateTime(chicago, 2022, 8, 22, 14, 45);
          // final end8 = timezones.TZDateTime(chicago, 2022, 8, 22, 15, 10);


          //TODO: Comment out testing schedule and uncomment actual schedule.
          final advTourStart = timezones.TZDateTime(chicago, 2022, 7, 26, 8, 00);
          final advTourEnd = timezones.TZDateTime(chicago, 2022, 7, 26, 8, 30);
          final assemblyStart = timezones.TZDateTime(chicago, 2022, 7, 26, 8, 45);
          final assemblyEnd = timezones.TZDateTime(chicago, 2022, 7, 26, 9, 15);
          final advLogisticsStart = timezones.TZDateTime(chicago, 2022, 7, 26, 9, 25);
          final advLogisticsEnd = timezones.TZDateTime(chicago, 2022, 7, 26, 10, 30);
          final lunchStart = timezones.TZDateTime(chicago, 2022, 7, 26, 10, 40);
          final lunchEnd = timezones.TZDateTime(chicago, 2022, 7, 26, 11, 10);
          final start1 = timezones.TZDateTime(chicago, 2022, 7, 26, 11, 15);
          final end1 = timezones.TZDateTime(chicago, 2022, 7, 26, 11, 40);
          final start2 = timezones.TZDateTime(chicago, 2022, 7, 26, 11, 45);
          final end2 = timezones.TZDateTime(chicago, 2022, 7, 26, 12, 10);
          final start3 = timezones.TZDateTime(chicago, 2022, 7, 26, 12, 15);
          final end3 = timezones.TZDateTime(chicago, 2022, 7, 26, 12, 40);
          final start4 = timezones.TZDateTime(chicago, 2022, 7, 26, 12, 45);
          final end4 = timezones.TZDateTime(chicago, 2022, 7, 26, 13, 10);
          final start5 = timezones.TZDateTime(chicago, 2022, 7, 26, 13, 15);
          final end5 = timezones.TZDateTime(chicago, 2022, 7, 26, 13, 40);
          final start6 = timezones.TZDateTime(chicago, 2022, 7, 26, 13, 45);
          final end6 = timezones.TZDateTime(chicago, 2022, 7, 26, 14, 10);
          final start7 = timezones.TZDateTime(chicago, 2022, 7, 26, 14, 15);
          final end7 = timezones.TZDateTime(chicago, 2022, 7, 26, 14, 40);
          final start8 = timezones.TZDateTime(chicago, 2022, 7, 26, 14, 45);
          final end8 = timezones.TZDateTime(chicago, 2022, 7, 26, 15, 10);

          if (now.isBefore(advTourStart)) {
            currentPeriod = 'Before Advisery';
            timeMessageText = 'Advisery Starts In';
            timeUntilNextBell(advTourStart);
          }
          else if (now.isBefore(advTourEnd)) {
            currentPeriod = 'Advisery';
            timeMessageText = 'Advisery Ends In';
            timeUntilNextBell(advTourEnd);
          }
          else if (now.isBefore(assemblyStart)) {
            currentPeriod = 'Passing Period';
            timeMessageText = 'Assembly Starts In';
            timeUntilNextBell(assemblyStart);
          }
          else if (now.isBefore(assemblyEnd)) {
            currentPeriod = 'Assembly';
            timeMessageText = 'Assembly Ends In';
            timeUntilNextBell(assemblyEnd);
          }
          else if (now.isBefore(advLogisticsStart)) {
            currentPeriod = 'Passing Period';
            timeMessageText = 'Advisery Starts In';
            timeUntilNextBell(advLogisticsStart);
          }
          else if (now.isBefore(advLogisticsEnd)) {
            currentPeriod = 'Advisery';
            timeMessageText = 'Advisery Ends In';
            timeUntilNextBell(advLogisticsEnd);
          }
          else if (now.isBefore(lunchStart)) {
            currentPeriod = 'Passing Period';
            timeMessageText = 'Lunch Starts In';
            timeUntilNextBell(lunchStart);
          }
          else if (now.isBefore(lunchEnd)) {
            currentPeriod = 'Lunch';
            timeMessageText = 'Lunch Ends In';
            timeUntilNextBell(lunchEnd);
          }
          else if (now.isBefore(start1)) {
            currentPeriod = 'Passing Period';
            timeMessageText = '1st Starts In';
            timeUntilNextBell(start1);
          }
          else if (now.isBefore(end1)) {
            currentPeriod = '1st';
            timeMessageText = 'Period Ends In';
            timeUntilNextBell(end1);
          }
          else if (now.isBefore(start2)) {
            currentPeriod = 'Passing Period';
            timeMessageText = '2nd Starts In';
            timeUntilNextBell(start2);
          }
          else if (now.isBefore(end2)) {
            currentPeriod = '2nd';
            timeMessageText = 'Period Ends In';
            timeUntilNextBell(end2);
          }
          else if (now.isBefore(start3)) {
            currentPeriod = 'Passing Period';
            timeMessageText = '3rd Starts In';
            timeUntilNextBell(start3);
          }
          else if (now.isBefore(end3)) {
            currentPeriod = '3rd';
            timeMessageText = 'Period Ends In';
            timeUntilNextBell(end3);
          }
          else if (now.isBefore(start4)) {
            currentPeriod = 'Passing Period';
            timeMessageText = '4th Starts In';
            timeUntilNextBell(start4);
          }
          else if (now.isBefore(end4)) {
            currentPeriod = '4th';
            timeMessageText = 'Period Ends In';
            timeUntilNextBell(end4);
          }
          else if (now.isBefore(start5)) {
            currentPeriod = 'Passing Period';
            timeMessageText = '5th Starts In';
            timeUntilNextBell(start5);
          }
          else if (now.isBefore(end5)) {
            currentPeriod = '5th';
            timeMessageText = 'Period Ends In';
            timeUntilNextBell(end5);
          }
          else if (now.isBefore(start6)) {
            currentPeriod = 'Passing Period';
            timeMessageText = '6th Starts In';
            timeUntilNextBell(start6);
          }
          else if (now.isBefore(end6)) {
            currentPeriod = '6th';
            timeMessageText = 'Period Ends In';
            timeUntilNextBell(end6);
          }
          else if (now.isBefore(start7)) {
            currentPeriod = 'Passing Period';
            timeMessageText = '7th Starts In';
            timeUntilNextBell(start7);
          }
          else if (now.isBefore(end7)) {
            currentPeriod = '7th';
            timeMessageText = 'Period Ends In';
            timeUntilNextBell(end7);
          }
          else if (now.isBefore(start8)) {
            currentPeriod = 'Passing Period';
            timeMessageText = '8th Starts In';
            timeUntilNextBell(start8);
          }
          else if (now.isBefore(end8)) {
            currentPeriod = '8th';
            timeMessageText = 'Period Ends In';
            timeUntilNextBell(end8);
          }
          else {
            //School day over.
            currentPeriod = 'School Day Over';
            centeredText = 'School Day Over';
          }
        }

      }
    });

  }

  //Function that converts the amount of time remaining until the next bell and converts it to a typical time formatting with two digits right of the colon.
  timeUntilNextBell(DateTime nextPeriod) {
    final now = DateTime.now();
    if (now.hour == 0 && now.minute == 0) {
      determineDayColor();
    }
    final timeRemaining = nextPeriod.difference(now);
    if (timeRemaining.inHours > 0) {
      String twoDigits(int n) => n.toString().padLeft(2, "0");
      String twoDigitMinutes = twoDigits(timeRemaining.inMinutes.remainder(60));
      String twoDigitSeconds = twoDigits(timeRemaining.inSeconds.remainder(60));
      setState(() {
        nextBellTime = "${twoDigits(timeRemaining.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
      });


    } else {
      String twoDigits(int n) => n.toString().padLeft(2, "0");
      String twoDigitMinutes = twoDigits(timeRemaining.inMinutes.remainder(60));
      String twoDigitSeconds = twoDigits(timeRemaining.inSeconds.remainder(60));
      setState(() {
        nextBellTime = "$twoDigitMinutes:$twoDigitSeconds";
      });

    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this); //This allows us to call didChangeAppLifeCycle below so that we can update on user coming back to the app.
    campus = widget.savedCampus; //Saved campus is coming from the future builder on the loading screen that gets passed into this. Probably could be optimized.
    tz.initializeTimeZones(); //Needed to begin using timezone package.
    determineDayColor();
    determineCurrentPeriod();
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) => determineCurrentPeriod());
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) => showHowToPopUp());
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.paused) {
      timer?.cancel();
    }

    if (state == AppLifecycleState.resumed) {
      determineDayColor();
      determineCurrentPeriod();
      checkForNewVersion();
      if (timer != null) {
        if (!timer!.isActive) {
          timer = Timer.periodic(const Duration(seconds: 1), (Timer t) =>
              determineCurrentPeriod());
        }
      }

    }
  }

  @override
  void dispose() {
    timer?.cancel();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: dayColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Row(
                  children: [
                    TextButton.icon(onPressed: () async {
                      return showDialog<void>(
                        context: context,
                        barrierDismissible: false, // user must tap button!
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Switch Campuses?',
                              style: TextStyle(
                                color: NewTrierColors.blue,
                              ),
                            ),
                            content: SingleChildScrollView(
                              child: ListBody(
                                children: const <Widget>[
                                  Text('Which campus do you want times for?'),
                                ],
                              ),
                            ),
                            actions: <Widget>[
                              TextButton(
                                child: const Text('Winnetka'),
                                onPressed: () {
                                  changeCampus('Winnetka');
                                  Navigator.of(context).pop();
                                },
                              ),
                              TextButton(
                                child: const Text('Northfield'),
                                onPressed: () {
                                  changeCampus('Northfield');
                                  Navigator.of(context).pop();
                                },
                              ),
                              TextButton(
                                child: const Text('Cancel',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                      icon: const Icon(Icons.swap_vert),
                      label: Text('CAMPUS',
                          style: Theme.of(context).textTheme.headline4!.copyWith(
                            color: dayColor == NewTrierColors.yellow ? NewTrierColors.black : Colors.white,
                          )),
                      style: ButtonStyle(
                        foregroundColor: dayColor == NewTrierColors.yellow ? MaterialStateProperty.all<Color>(NewTrierColors.black) : MaterialStateProperty.all<Color>(Colors.white),
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      iconSize: 20.0,
                      icon: Image.asset('images/canvas_logo.png',
                        color: dayColor == NewTrierColors.yellow ? NewTrierColors.black : Colors.white,
                        height: 20.0,
                        width: 20.0,
                      ),
                      onPressed: () async {
                        //TODO: Package update coming that gets rid of bug where iOS returns integer and android returns bool.
                        dynamic isStudentInstalled = await LaunchApp.isAppInstalled(
                          androidPackageName: 'com.instructure.candroid',
                          iosUrlScheme: 'canvas-student://',
                        );

                       // bool hasStudent = (isStudentInstalled == 0 || isStudentInstalled == false) ? false : true;

                        dynamic isTeacherInstalled = await LaunchApp.isAppInstalled(
                          androidPackageName: 'com.instructure.teacher',
                          iosUrlScheme: 'canvas-teacher://',
                        );

                        //bool hasTeacher = (isTeacherInstalled == 0 || isTeacherInstalled == false) ? false : true;

                        if (isStudentInstalled) {
                          await LaunchApp.openApp(
                            androidPackageName: 'com.instructure.candroid',
                            iosUrlScheme: 'canvas-student://',
                            openStore: false,
                          );
                          //DeviceApps.openApp('com.instructure.candroid');
                        } else if (isTeacherInstalled) {
                          await LaunchApp.openApp(
                            androidPackageName: 'com.instructure.teacher',
                            iosUrlScheme: 'canvas-teacher://',
                            openStore: false,
                          );
                        } else {
                          final urlToLaunch = Uri.https('newtrier.instructure.com', '');
                          if (!await launchUrl(urlToLaunch)) throw 'Could not launch url';
                        }
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.person,
                        color: dayColor == NewTrierColors.yellow ? NewTrierColors.black : Colors.white,),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ProfileScreen()));
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.calendar_today,
                          color: dayColor == NewTrierColors.yellow ? NewTrierColors.black : Colors.white),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CalendarView()));
                      },
                    ),
                  ],
                ),
                Visibility(
                  visible: (currentPeriod == 'School Day Over' || dayColor == NewTrierColors.gray),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 20.0),
                    child: Text(centeredText, textAlign: TextAlign.center,
                      style: TextStyle(
                        color: dayColor == NewTrierColors.yellow ? NewTrierColors.black : Colors.white,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: ((currentPeriod != 'School Day Over' && dayColor != NewTrierColors.gray && studentSupportDayText != '')),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(studentSupportDayText, textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.headline2!.copyWith(
                            color: dayColor == NewTrierColors.yellow ? NewTrierColors.black : Colors.white,
                            fontSize: 14.0,
                          ),
                        ),
                        Visibility(
                          visible: pltToday,
                          child: Padding(
                            padding:  const EdgeInsets.only(top: 12.0),
                            child: Text(campus == Campus.winnetka ? 'For students taking these classes on the Winnetka Campus, this time is made available to them to support access to the many resources around the school which include the Test Make-up Center, the Academic Assistance Center, the library, and individual appointments with teachers.' : 'Students still report to their classes in these departments and a substitute teacher will take attendance. You may use this time as a study hall.',
                              style: const TextStyle(
                                fontStyle: FontStyle.italic,
                                fontSize: 12.0,
                                color: NewTrierColors.black,
                              ),),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible: (currentPeriod != 'School Day Over' && dayColor != NewTrierColors.gray),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 16.0, 0.0, 16.0),
                    child: SizedBox(
                      height: 78.0,
                      child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text('Current Period',
                                    style: Theme.of(context).textTheme.headline3!.copyWith(
                                      color: dayColor == NewTrierColors.yellow ? NewTrierColors.black : Colors.white,
                                    ),
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: AutoSizeText(currentPeriod,
                                        maxLines: 1,
                                        style: Theme.of(context).textTheme.headline1!.copyWith(
                                          color: dayColor == NewTrierColors.yellow ? NewTrierColors.black : Colors.white,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 16.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    AutoSizeText(timeMessageText,
                                      maxLines: 1,
                                      style: Theme.of(context).textTheme.headline3!.copyWith(
                                        color: dayColor == NewTrierColors.yellow ? NewTrierColors.black : Colors.white,
                                      ),
                                    ),
                                    Expanded(
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(nextBellTime,
                                          style: Theme.of(context).textTheme.headline1!.copyWith(
                                            color: dayColor == NewTrierColors.yellow ? NewTrierColors.black : Colors.white,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ]
                      ),
                    ),
                  ),
                ),
                ScheduleTable(currentPeriod: currentPeriod, dayColor: dayColor, scheduleType: scheduleType, campus: campus,),
                Visibility(
                  visible: dayColor != NewTrierColors.gray,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Image.asset(imageAsset,
                      fit: BoxFit.contain,),
                  ),
                ),
          Visibility(
            visible: Platform.isIOS,
            child: const Center(child: Text('Try creating a widget for your home screen so you can see what period it is more quickly.',
                  textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12.0,
              fontStyle: FontStyle.italic,
            ),)
      ),
          ),
                TextButton(
                  child: Text('See Schedules for Other Days',
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                      color: dayColor == NewTrierColors.yellow ? NewTrierColors.black : Colors.white,
                    ),),
                  onPressed: () async {
                    final Uri urlToLaunch = Uri.https('www.newtrier.k12.il.us', '/Page/2');
                    if (!await launchUrl(urlToLaunch)) throw 'Could not launch url';
                  },
                ),
                Visibility(
                  visible: dayColor != NewTrierColors.gray,
                  child: InkWell(
                    onTap: () async {
                      return showDialog<void>(
                        context: context,
                        barrierDismissible: false, // user must tap button!
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('See an issue?'),
                            content: SingleChildScrollView(
                              child: ListBody(
                                children: const <Widget>[
                                  Text('This app was created by New Trier\'s iOS App Development teacher Mr. Eric Duffett. Please report any issues to duffette@nths.net with a screenshot and a detailed description.'),
                                  Center(child: Text('Version 2.0\nLast Update: 7/1/22', textAlign: TextAlign.center,)),
                                ],
                              ),
                            ),
                            actions: <Widget>[
                              TextButton(
                                child: const Text('OK'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      color: Colors.transparent,
                      child: Align(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('Powered by New Trier\'s iOS App Development Class',
                              style: TextStyle(
                                color: dayColor == NewTrierColors.yellow ? NewTrierColors.black : Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Icon(Icons.info_outline,
                                size: 12.0,
                                color: dayColor == NewTrierColors.yellow ? NewTrierColors.black : Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class ScheduleTable extends StatefulWidget {

  final String currentPeriod;
  final Color dayColor;
  final ScheduleType scheduleType;
  final Campus campus;

  const ScheduleTable({Key? key, required this.currentPeriod, required this.dayColor, required this.scheduleType, required this.campus,}) : super(key: key);

  @override
  State<ScheduleTable> createState() => _ScheduleTableState();
}

class _ScheduleTableState extends State<ScheduleTable> {

  String adviseryTime = '8:20 - 8:45';

  List<String> periodNames = [
    '1A',
    '1B',
    '2A',
    '2B',
    '2C',
    '3A',
    '3B',
    '4A',
    '4B',
  ];

  List<String> periodTimes = [
    '8:50 - 9:30',
    '9:35 - 10:15',
    '10:20 - 11:00',
    '11:05 - 11:45',
    '11:50 - 12:30',
    '12:35 - 1:15',
    '1:20 - 2:00',
    '2:05 - 2:45',
    '2:50 - 3:30'
  ];

  void updatePeriodInfo() {
    //TODO: Show schedule for next school day on gray days.
    //TODO: Create variable and use while loop?

    if (widget.campus == Campus.winnetka) {

      if (widget.scheduleType == ScheduleType.regular) {
        adviseryTime = '8:20 - 8:45';
        periodTimes = [
          '8:50 - 9:30',
          '9:35 - 10:15',
          '10:20 - 11:00',
          '11:05 - 11:45',
          '11:50 - 12:30',
          '12:35 - 1:15',
          '1:20 - 2:00',
          '2:05 - 2:45',
          '2:50 - 3:30'
        ];
      }
      else if (widget.scheduleType == ScheduleType.anchor) {
        adviseryTime = '8:20 - 8:50';
        periodTimes = [
          '8:55 - 9:30',
          '9:35 - 10:10',
          '10:15 - 10:50',
          '10:55 - 11:30',
          '11:35 - 12:10',
          '12:15 - 12:50',
          '12:55 - 1:30',
          '1:35 - 2:10',
          '2:15 - 2:50',
          '2:55 - 3:30'
        ];
      }

      else if (widget.scheduleType == ScheduleType.anchorEarlyDismissal) {
        adviseryTime = '8:20 - 8:40';
        periodTimes = [
          '8:45 - 9:05',
          '9:10 - 9:30',
          '9:35 - 9:55',
          '10:00 - 10:20',
          '10:25 - 10:45',
          '10:50 - 11:10',
          '11:15 - 11:35',
          '11:40 - 12:00',
          '12:05 - 12:25',
          '12:30 - 12:50'
        ];
      }

      else if (widget.scheduleType == ScheduleType.earlyDismissal) {
        adviseryTime = '8:20 - 8:45';
        periodTimes = [
          '8:50 - 9:10',
          '9:15 - 9:35',
          '9:40 - 10:00',
          '10:05 - 10:25',
          '10:30 - 10:50',
          '10:55 - 11:15',
          '11:20 - 11:40',
          '11:45 - 12:05',
          '12:10 - 12:30'
        ];
      }

      else if (widget.scheduleType == ScheduleType.lateStart) {
        adviseryTime = '11:20 - 11:45';
        periodTimes = [
          '11:50 - 12:10',
          '12:15 - 12:35',
          '12:40 - 1:00',
          '1:05 - 1:25',
          '1:30 - 1:50',
          '1:55 - 2:15',
          '2:20 - 2:40',
          '2:45 - 3:05',
          '3:10 - 3:30'
        ];
      }


      if (widget.dayColor == NewTrierColors.green) {
        periodNames = [
          '5A',
          '5B',
          '6A',
          '6B',
          '6C',
          '7A',
          '7B',
          '8A',
          '8B',
        ];
      } else if (widget.dayColor == NewTrierColors.blue) {
        periodNames = [
          '1A',
          '1B',
          '2A',
          '2B',
          '2C',
          '3A',
          '3B',
          '4A',
          '4B',
        ];
      } else if (widget.dayColor == NewTrierColors.yellow) {
        periodNames = [
          '1',
          '2',
          '3',
          '4A',
          '4B',
          '4C',
          '5',
          '6',
          '7',
          '8'
        ];
      }
    }
    else { //Northfield Campus

      adviseryTime = '8:00 - 8:25';

      if (widget.scheduleType == ScheduleType.regular) {
        periodTimes = [
          '8:30 - 9:10',
          '9:15 - 9:55',
          '10:00 - 10:40',
          '10:45 - 11:25',
          '11:30 - 12:10',
          '12:15 - 12:55',
          '1:00 - 1:40',
          '1:45 - 2:25',
          '2:30 - 3:10'
        ];
      }
      else if (widget.scheduleType == ScheduleType.anchor) {
        adviseryTime = '8:00 - 8:30';
        periodTimes = [
          '8:35 - 9:10',
          '9:15 - 9:50',
          '9:55 - 10:30',
          '10:35 - 11:10',
          '11:15 - 11:50',
          '11:55 - 12:30',
          '12:35 - 1:10',
          '1:15 - 1:50',
          '1:55 - 2:30',
          '2:35 - 3:10'
        ];
      }

      else if (widget.scheduleType == ScheduleType.anchorEarlyDismissal) {
        adviseryTime = '8:00 - 8:20';
        periodTimes = [
          '8:25 - 8:45',
          '8:50 - 9:10',
          '9:15 - 9:35',
          '9:40 - 10:00',
          '10:05 - 10:25',
          '10:30 - 10:50',
          '10:55 - 11:15',
          '11:20 - 11:40',
          '11:45 - 12:05',
          '12:10 - 12:30'
        ];
      }

      else if (widget.scheduleType == ScheduleType.earlyDismissal) {
        adviseryTime = '8:00 - 8:25';
        periodTimes = [
          '8:30 - 8:50',
          '8:55 - 9:15',
          '9:20 - 9:40',
          '9:45 - 10:05',
          '10:10 - 10:30',
          '10:35 - 10:55',
          '11:00 - 11:20',
          '11:25 - 11:45',
          '11:50 - 12:10'
        ];
      }

      else if (widget.scheduleType == ScheduleType.lateStart) {
        adviseryTime = '11:00 - 11:25';
        periodTimes = [
          '11:30 - 11:50',
          '11:55 - 12:15',
          '12:20 - 12:40',
          '12:45 - 1:05',
          '1:10 - 1:30',
          '1:35 - 1:55',
          '2:00 - 2:20',
          '2:25 - 2:45',
          '2:50 - 3:10'
        ];
      }


      if (widget.dayColor == NewTrierColors.green) {
        periodNames = [
          '5A',
          '5B',
          '6A',
          '6B',
          '7A',
          '7B',
          '7C',
          '8A',
          '8B',
        ];
      } else if (widget.dayColor == NewTrierColors.blue) {
        periodNames = [
          '1A',
          '1B',
          '2A',
          '2B',
          '3A',
          '3B',
          '3C',
          '4A',
          '4B',
        ];
      } else if (widget.dayColor == NewTrierColors.yellow) {
        periodNames = [
          '1',
          '2',
          '3',
          '4',
          '5A',
          '5B',
          '5C',
          '6',
          '7',
          '8'
        ];
      }

    }
  }

  Future<SharedPreferences> getPrefs() async {
    return await SharedPreferences.getInstance();
  }


  @override
  Widget build(BuildContext context) {
    updatePeriodInfo();
    return FutureBuilder<SharedPreferences>(
        future: getPrefs(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data?.getBool('hasEnteredScheduleInfo') == null || widget.dayColor == NewTrierColors.gray || widget.dayColor == NewTrierColors.orange || widget.dayColor == NewTrierColors.brown) {
              return const SizedBox.shrink();
            } else {

              final now = DateTime.now();
              final chicago = timezones.getLocation('America/Chicago');
              //TODO: Change back to correct date.
              // final firstAdvStartWinn = timezones.TZDateTime(chicago, 2022, 8, 22, 8, 20);
              // final firstAdvEndWinn = timezones.TZDateTime(chicago, 2022, 8, 22, 10, 10);
              // final specialAdvStart = timezones.TZDateTime(chicago, 2022, 8, 22, 15, 15);
              // final specialAdvEnd = timezones.TZDateTime(chicago, 2022, 8, 22, 15, 30);

              final firstAdvStartWinn = timezones.TZDateTime(chicago, 2022, 7, 26, 8, 20);
              final firstAdvEndWinn = timezones.TZDateTime(chicago, 2022, 7, 26, 10, 10);
              final bool isFirstAdvWinn = now.isAfter(firstAdvStartWinn) && now.isBefore(firstAdvEndWinn);
              final specialAdvStart = timezones.TZDateTime(chicago, 2022, 7, 26, 15, 15);
              final specialAdvEnd = timezones.TZDateTime(chicago, 2022, 7, 26, 15, 30);
              final bool isSpecialAdv = now.isAfter(specialAdvStart) && now.isBefore(specialAdvEnd);

              //TODO: Change back to correct first date of school.
              // final firstAdvStartNF = timezones.TZDateTime(chicago, 2022, 8, 22, 8, 00);
              // final firstAdvEndNF = timezones.TZDateTime(chicago, 2022, 8, 22, 8, 30);

              // final nfAdLogisticsStart = timezones.TZDateTime(chicago, 2022, 8, 22, 9, 25);
              // final nfAdLogisticsEnd = timezones.TZDateTime(chicago, 2022, 8, 22, 10, 30);

              final firstAdvStartNF = timezones.TZDateTime(chicago, 2022, 7, 26, 8, 00);
              final firstAdvEndNF = timezones.TZDateTime(chicago, 2022, 7, 26, 8, 30);
              final bool isFirstAdvNF = now.isAfter(firstAdvStartNF) && now.isBefore(firstAdvEndNF);

              final nfAdLogisticsStart = timezones.TZDateTime(chicago, 2022, 7, 26, 9, 25);
              final nfAdLogisticsEnd = timezones.TZDateTime(chicago, 2022, 7, 26, 10, 30);
              final bool isNFLogisticsAdv = now.isAfter(nfAdLogisticsStart) && now.isBefore(nfAdLogisticsEnd);

              final bool advToOne = now.isAfter(endOfAdvisery) && now.isBefore(start1A);
              final bool oneAToOneB = now.isAfter(end1A) && now.isBefore(start1B);
              final bool oneBToTwoA = now.isAfter(end1B) && now.isBefore(start2A);
              final bool twoAToTwoB = now.isAfter(end2A) && now.isBefore(start2B);
              final bool twoBToTwoC = now.isAfter(end2B) && now.isBefore(end2C);
              final bool twoCToThreeA = now.isAfter(end2C) && now.isBefore(start3A);
              final bool threeAToThreeB = now.isAfter(end3A) && now.isBefore(start3B);
              final bool threeBToFourA = now.isAfter(end3B) && now.isBefore(start4A);
              final bool fourAToFourB = now.isAfter(end4A) && now.isBefore(start4B);
              final bool fourBToAnchor8Start = now.isAfter(end4B) && now.isBefore(anchor8Start);


              //Opening Day Table
              if (widget.scheduleType == ScheduleType.openingDay) {
                if (widget.campus == Campus.winnetka) {
                  //Winnetka Campus Schedule
                  return Column(
                    children: [
                      Text('Here\'s Your Schedule Today',
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: NewTrierColors.black,
                        ),),
                      Text('Winnetka Campus',
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: NewTrierColors.black,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.normal,
                          fontSize: 12.0,
                        ),),
                      const SizedBox(
                        height: 4.0,
                      ),
                      Table(
                        defaultVerticalAlignment: TableCellVerticalAlignment
                            .middle,
                        border: TableBorder.all(color: Colors.white54),
                        columnWidths: const <int, TableColumnWidth>{
                          0: IntrinsicColumnWidth(),
                          1: FlexColumnWidth(),
                        },
                        children: [
                          TableRow(
                              decoration: BoxDecoration(
                                color: (isFirstAdvWinn) ? Colors.white24 : null,
                              ),
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: const [
                                        Text('Adv',
                                          style: TextStyle(
                                            color: NewTrierColors.black,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16.0,
                                          ),
                                        ),
                                        Text('8:20 - 10:10',
                                          style: TextStyle(
                                            color: NewTrierColors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Column(
                                    children: [
                                      const Text('Advisery',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: NewTrierColors.black,
                                        ),
                                      ),
                                      Text(
                                        snapshot.data?.getString('adviseryRoom') ?? '',
                                        style: const TextStyle(
                                          color: NewTrierColors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ]
                          ),
                          TableRow(
                              decoration: BoxDecoration(
                                color:  (widget.currentPeriod == "1st") ? Colors.white24 : null,
                              ),
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: const [
                                        Text('1',
                                          style: TextStyle(
                                            color: NewTrierColors.black,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16.0,
                                          ),
                                        ),
                                        Text('10:15 - 10:40',
                                          style: TextStyle(
                                            color: NewTrierColors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Column(
                                    children: [
                                      Text(
                                        snapshot.data?.getString('1AnchorClass') ?? '',
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: NewTrierColors.black,
                                        ),
                                      ),
                                      Text(
                                        snapshot.data?.getString('1AnchorRoom') ?? '',
                                        style: const TextStyle(
                                          color: NewTrierColors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ]
                          ),
                          TableRow(
                              decoration: BoxDecoration(
                                color:  (widget.currentPeriod == "2nd") ? Colors.white24 : null,
                              ),
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: const [
                                        Text('2',
                                          style: TextStyle(
                                              color: NewTrierColors.black,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16.0
                                          ),
                                        ),
                                        Text('10:45 - 11:10',
                                          style: TextStyle(
                                            color:NewTrierColors.black,
                                          ),),
                                      ],
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Column(
                                    children: [
                                      Text(
                                        snapshot.data?.getString('2AnchorClass') ?? '',
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: NewTrierColors.black,
                                        ),
                                      ),
                                      Text(
                                        snapshot.data?.getString('2AnchorRoom') ?? '',
                                        style: const TextStyle(
                                          color: NewTrierColors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ]
                          ),
                          TableRow(
                              decoration: BoxDecoration(
                                color:  (widget.currentPeriod == "3rd") ? Colors.white24 : null,
                              ),
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: const [
                                        Text('3',
                                          style: TextStyle(
                                            color: NewTrierColors.black,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text('11:15 - 11:40',
                                          style: TextStyle(
                                            color: NewTrierColors.black,
                                          ),),
                                      ],
                                    ),
                                  ),
                                ),
                                Column(
                                  children: [
                                    Text(
                                      snapshot.data?.getString('3AnchorClass') ?? '',
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: NewTrierColors.black,
                                      ),
                                    ),
                                    Text(snapshot.data?.getString('3AnchorRoom') ?? '',
                                      style: const TextStyle(
                                        color: NewTrierColors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ]
                          ),
                          TableRow(
                              decoration: BoxDecoration(
                                color:  (widget.currentPeriod == "4A") ? Colors.white24 : null,
                              ),
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: const [
                                        Text('4A',
                                          style: TextStyle(
                                            color: NewTrierColors.black,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text('11:45 - 12:10',
                                          style: TextStyle(
                                            color: NewTrierColors.black,
                                          ),),
                                      ],
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Column(
                                    children: [
                                      Text(snapshot.data?.getString(
                                          '4AAnchorClass') ?? '',
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: NewTrierColors.black,
                                        ),
                                      ),
                                      Text(snapshot.data?.getString(
                                          '4AAnchorRoom') ?? '',
                                        style: const TextStyle(
                                          color: NewTrierColors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ]
                          ),
                          TableRow(
                              decoration: BoxDecoration(
                                color:  (widget.currentPeriod == "4B") ? Colors.white24 : null,
                              ),
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: const [
                                        Text('4B',
                                          style: TextStyle(
                                            color: NewTrierColors.black,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text('12:15 - 12:40',
                                          style: TextStyle(
                                            color: NewTrierColors.black,
                                          ),),
                                      ],
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Column(
                                    children: [
                                      Text(snapshot.data?.getString(
                                          '4BAnchorClass') ?? '',
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: NewTrierColors.black,
                                        ),
                                      ),
                                      Text(snapshot.data?.getString(
                                          '4BAnchorRoom') ?? '',
                                        style: const TextStyle(
                                          color: NewTrierColors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ]
                          ),
                          TableRow(
                              decoration: BoxDecoration(
                                color:  (widget.currentPeriod == "4C") ? Colors.white24 : null,
                              ),
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: const [
                                        Text('4C',
                                          style: TextStyle(
                                            color: NewTrierColors.black,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text('12:45 - 1:10',
                                          style: TextStyle(
                                            color: NewTrierColors.black,
                                          ),),
                                      ],
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Column(
                                    children: [
                                      Text(snapshot.data?.getString(
                                          '4CAnchorClass') ?? '',
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: NewTrierColors.black,
                                        ),
                                      ),
                                      Text(snapshot.data?.getString(
                                          '4CAnchorRoom') ?? '',
                                        style: const TextStyle(
                                          color: NewTrierColors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ]
                          ),
                          TableRow(
                              decoration: BoxDecoration(
                                color:  (widget.currentPeriod == "5th") ? Colors.white24 : null,
                              ),
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: const [
                                        Text('5',
                                          style: TextStyle(
                                            color: NewTrierColors.black,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text('1:15 - 1:40',
                                          style: TextStyle(
                                            color: NewTrierColors.black,
                                          ),),
                                      ],
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Column(
                                    children: [
                                      Text(
                                        snapshot.data?.getString('5AnchorClass') ?? '',
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: NewTrierColors.black,
                                        ),
                                      ),
                                      Text(
                                        snapshot.data?.getString('5AnchorRoom') ?? '',
                                        style: const TextStyle(
                                          color: NewTrierColors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ]
                          ),
                          TableRow(
                              decoration: BoxDecoration(
                                color:  (widget.currentPeriod == "6th") ? Colors.white24 : null,
                              ),
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: const [
                                        Text('6',
                                          style: TextStyle(
                                            color: NewTrierColors.black,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text('1:45 - 2:10',
                                          style: TextStyle(
                                            color: NewTrierColors.black,
                                          ),),
                                      ],
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Column(
                                    children: [
                                      Text(
                                        snapshot.data?.getString('6AnchorClass') ?? '',
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: NewTrierColors.black,
                                        ),
                                      ),
                                      Text(
                                        snapshot.data?.getString('6AnchorRoom') ?? '',
                                        style: const TextStyle(
                                          color: NewTrierColors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ]
                          ),
                          TableRow(
                              decoration: BoxDecoration(
                                color:  (widget.currentPeriod == "7th") ? Colors.white24 : null,
                              ),
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: const [
                                        Text('7',
                                          style: TextStyle(
                                            color: NewTrierColors.black,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text('2:15 - 2:40',
                                          style: TextStyle(
                                            color: NewTrierColors.black,
                                          ),),
                                      ],
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Column(
                                    children: [
                                      Text(
                                        snapshot.data?.getString('7AnchorClass') ?? '',
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: NewTrierColors.black,
                                        ),
                                      ),
                                      Text(
                                        snapshot.data?.getString('7AnchorRoom') ?? '',
                                        style: const TextStyle(
                                          color: NewTrierColors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ]
                          ),
                          TableRow(
                              decoration: BoxDecoration(
                                color:  (widget.currentPeriod == "8th") ? Colors.white24 : null,
                              ),
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: const [
                                        Text('8',
                                          style: TextStyle(
                                            color: NewTrierColors.black,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text('2:45 - 3:10',
                                          style: TextStyle(
                                            color: NewTrierColors.black,
                                          ),),
                                      ],
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Column(
                                    children: [
                                      Text(
                                        snapshot.data?.getString('8AnchorClass') ?? '',
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: NewTrierColors.black,
                                        ),
                                      ),
                                      Text(
                                        snapshot.data?.getString('8AnchorRoom') ?? '',
                                        style: const TextStyle(
                                          color: NewTrierColors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ]
                          ),
                          TableRow(
                              decoration: BoxDecoration(
                                color: isSpecialAdv ? Colors.white24 : null,
                              ),
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: const [
                                        Text('Adv',
                                          style: TextStyle(
                                            color: NewTrierColors.black,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16.0,
                                          ),
                                        ),
                                        Text('3:15 - 3:30',
                                          style: TextStyle(
                                            color: NewTrierColors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Column(
                                    children: [
                                      const Text('Advisery',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: NewTrierColors.black,
                                        ),
                                      ),
                                      Text(
                                        snapshot.data?.getString('adviseryRoom') ?? '',
                                        style: const TextStyle(
                                          color: NewTrierColors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ]
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                    ],
                  );
                }
                else {
                  //Northfield campus table
                  return Column(
                    children: [
                      Text('Here\'s Your Schedule Today',
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: NewTrierColors.black,
                        ),),
                      Text('Northfield Campus',
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: NewTrierColors.black,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.normal,
                          fontSize: 12.0,
                        ),),
                      const SizedBox(
                        height: 4.0,
                      ),
                      Table(
                        defaultVerticalAlignment: TableCellVerticalAlignment
                            .middle,
                        border: TableBorder.all(color: Colors.white54),
                        columnWidths: const <int, TableColumnWidth>{
                          0: IntrinsicColumnWidth(),
                          1: FlexColumnWidth(),
                        },
                        children: [
                          TableRow(
                              decoration: BoxDecoration(
                                color: (isFirstAdvNF) ? Colors.white24 : null,
                              ),
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: const [
                                        Text('Adv',
                                          style: TextStyle(
                                            color: NewTrierColors.black,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16.0,
                                          ),
                                        ),
                                        Text('8:00 - 8:30',
                                          style: TextStyle(
                                            color: NewTrierColors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Column(
                                    children: [
                                      const Text('Advisery',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: NewTrierColors.black,
                                        ),
                                      ),
                                      Text(
                                        snapshot.data?.getString('adviseryRoom') ?? '',
                                        style: const TextStyle(
                                          color: NewTrierColors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ]
                          ),
                          TableRow(
                              decoration: BoxDecoration(
                                color: (widget.currentPeriod == "Assembly") ? Colors.white24 : null,
                              ),
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: const [
                                        Text('Assembly',
                                          style: TextStyle(
                                            color: NewTrierColors.black,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16.0,
                                          ),
                                        ),
                                        Text('8:45 - 9:15',
                                          style: TextStyle(
                                            color: NewTrierColors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Column(
                                    children: const [
                                      Text('Assembly',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: NewTrierColors.black,
                                        ),
                                      ),
                                      Text('',
                                        style: TextStyle(
                                          color: NewTrierColors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ]
                          ),
                          TableRow(
                              decoration: BoxDecoration(
                                color: isNFLogisticsAdv ? Colors.white24 : null,
                              ),
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: const [
                                        Text('Adv',
                                          style: TextStyle(
                                            color: NewTrierColors.black,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16.0,
                                          ),
                                        ),
                                        Text('9:25 - 10:30',
                                          style: TextStyle(
                                            color: NewTrierColors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Column(
                                    children: [
                                      const Text('Advisery',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: NewTrierColors.black,
                                        ),
                                      ),
                                      Text(
                                        snapshot.data?.getString('adviseryRoom') ?? '',
                                        style: const TextStyle(
                                          color: NewTrierColors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ]
                          ),
                          TableRow(
                              decoration: BoxDecoration(
                                color: (widget.currentPeriod == "Lunch") ? Colors.white24 : null,
                              ),
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: const [
                                        Text('Lunch',
                                          style: TextStyle(
                                            color: NewTrierColors.black,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16.0,
                                          ),
                                        ),
                                        Text('10:40 - 11:10',
                                          style: TextStyle(
                                            color: NewTrierColors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Column(
                                    children: const [
                                      Text('Lunch',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: NewTrierColors.black,
                                        ),
                                      ),
                                      Text('with Advisery',
                                        style: TextStyle(
                                          color: NewTrierColors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ]
                          ),
                          TableRow(
                              decoration: BoxDecoration(
                                color:  (widget.currentPeriod == "1st") ? Colors.white24 : null,
                              ),
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: const [
                                        Text('1',
                                          style: TextStyle(
                                            color: NewTrierColors.black,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16.0,
                                          ),
                                        ),
                                        Text('11:15 - 11:40',
                                          style: TextStyle(
                                            color: NewTrierColors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Column(
                                    children: [
                                      Text(
                                        snapshot.data?.getString('1AnchorClass') ?? '',
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: NewTrierColors.black,
                                        ),
                                      ),
                                      Text(
                                        snapshot.data?.getString('1AnchorRoom') ?? '',
                                        style: const TextStyle(
                                          color: NewTrierColors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ]
                          ),
                          TableRow(
                              decoration: BoxDecoration(
                                color:  (widget.currentPeriod == "2nd") ? Colors.white24 : null,
                              ),
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: const [
                                        Text('2',
                                          style: TextStyle(
                                              color: NewTrierColors.black,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16.0
                                          ),
                                        ),
                                        Text('11:45 - 12:10',
                                          style: TextStyle(
                                            color:NewTrierColors.black,
                                          ),),
                                      ],
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Column(
                                    children: [
                                      Text(
                                        snapshot.data?.getString('2AnchorClass') ?? '',
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: NewTrierColors.black,
                                        ),
                                      ),
                                      Text(
                                        snapshot.data?.getString('2AnchorRoom') ?? '',
                                        style: const TextStyle(
                                          color: NewTrierColors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ]
                          ),
                          TableRow(
                              decoration: BoxDecoration(
                                color:  (widget.currentPeriod == "3rd") ? Colors.white24 : null,
                              ),
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: const [
                                        Text('3',
                                          style: TextStyle(
                                            color: NewTrierColors.black,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text('12:15 - 12:40',
                                          style: TextStyle(
                                            color: NewTrierColors.black,
                                          ),),
                                      ],
                                    ),
                                  ),
                                ),
                                Column(
                                  children: [
                                    Text(
                                      snapshot.data?.getString('3AnchorClass') ?? '',
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: NewTrierColors.black,
                                      ),
                                    ),
                                    Text(snapshot.data?.getString('3AnchorRoom') ?? '',
                                      style: const TextStyle(
                                        color: NewTrierColors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ]
                          ),
                          TableRow(
                              decoration: BoxDecoration(
                                color:  (widget.currentPeriod == "4th") ? Colors.white24 : null,
                              ),
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: const [
                                        Text('4',
                                          style: TextStyle(
                                            color: NewTrierColors.black,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text('12:45 - 1:10',
                                          style: TextStyle(
                                            color: NewTrierColors.black,
                                          ),),
                                      ],
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Column(
                                    children: [
                                      Text(snapshot.data?.getString('4AnchorClass') ?? '',
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: NewTrierColors.black,
                                        ),
                                      ),
                                      Text(snapshot.data?.getString('4AnchorRoom') ?? '',
                                        style: const TextStyle(
                                          color: NewTrierColors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ]
                          ),
                          TableRow(
                              decoration: BoxDecoration(
                                color:  (widget.currentPeriod == "5th") ? Colors.white24 : null,
                              ),
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: const [
                                        Text('5',
                                          style: TextStyle(
                                            color: NewTrierColors.black,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text('1:15 - 1:40',
                                          style: TextStyle(
                                            color: NewTrierColors.black,
                                          ),),
                                      ],
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Column(
                                    children: const [
                                      Text(
                                        '5A, 5B, or 5C Class',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: NewTrierColors.black,
                                        ),
                                      ),
                                      Text('See Adviser',
                                        style: TextStyle(
                                          color: NewTrierColors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ]
                          ),
                          TableRow(
                              decoration: BoxDecoration(
                                color:  (widget.currentPeriod == "6th") ? Colors.white24 : null,
                              ),
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: const [
                                        Text('6',
                                          style: TextStyle(
                                            color: NewTrierColors.black,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text('1:45 - 2:10',
                                          style: TextStyle(
                                            color: NewTrierColors.black,
                                          ),),
                                      ],
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Column(
                                    children: [
                                      Text(
                                        snapshot.data?.getString('6AnchorClass') ?? '',
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: NewTrierColors.black,
                                        ),
                                      ),
                                      Text(
                                        snapshot.data?.getString('6AnchorRoom') ?? '',
                                        style: const TextStyle(
                                          color: NewTrierColors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ]
                          ),
                          TableRow(
                              decoration: BoxDecoration(
                                color:  (widget.currentPeriod == "7th") ? Colors.white24 : null,
                              ),
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: const [
                                        Text('7',
                                          style: TextStyle(
                                            color: NewTrierColors.black,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text('2:15 - 2:40',
                                          style: TextStyle(
                                            color: NewTrierColors.black,
                                          ),),
                                      ],
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Column(
                                    children: [
                                      Text(
                                        snapshot.data?.getString('7AnchorClass') ?? '',
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: NewTrierColors.black,
                                        ),
                                      ),
                                      Text(
                                        snapshot.data?.getString('7AnchorRoom') ?? '',
                                        style: const TextStyle(
                                          color: NewTrierColors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ]
                          ),
                          TableRow(
                              decoration: BoxDecoration(
                                color:  (widget.currentPeriod == "8th") ? Colors.white24 : null,
                              ),
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: const [
                                        Text('8',
                                          style: TextStyle(
                                            color: NewTrierColors.black,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text('2:45 - 3:10',
                                          style: TextStyle(
                                            color: NewTrierColors.black,
                                          ),),
                                      ],
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Column(
                                    children: [
                                      Text(
                                        snapshot.data?.getString('8AnchorClass') ?? '',
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: NewTrierColors.black,
                                        ),
                                      ),
                                      Text(
                                        snapshot.data?.getString('8AnchorRoom') ?? '',
                                        style: const TextStyle(
                                          color: NewTrierColors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ]
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                    ],
                  );
                }
              }
              //Anchor Day Table
              else if (widget.scheduleType == ScheduleType.anchor || widget.scheduleType == ScheduleType.anchorEarlyDismissal) {
                if (widget.campus == Campus.winnetka) {
                  //Winnetka Anchor
                  return Column(
                    children: [
                      Text('Here\'s Your Schedule Today',
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: NewTrierColors.black,
                        ),),
                      Text(widget.campus == Campus.winnetka ? 'Winnetka Campus' : 'Northfield Campus',
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: NewTrierColors.black,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.normal,
                          fontSize: 12.0,
                        ),),
                      const SizedBox(
                        height: 4.0,
                      ),
                      Table(
                        defaultVerticalAlignment: TableCellVerticalAlignment
                            .middle,
                        border: TableBorder.all(color: Colors.white54),
                        columnWidths: const <int, TableColumnWidth>{
                          0: IntrinsicColumnWidth(),
                          1: FlexColumnWidth(),
                        },
                        children: [
                          TableRow(
                              decoration: BoxDecoration(
                                color: (widget.currentPeriod == "Advisery") ? Colors.white24 : null,
                              ),
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Text('Adv',
                                          style: TextStyle(
                                            color: NewTrierColors.black,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16.0,
                                          ),
                                        ),
                                        Text(adviseryTime,
                                          style:  const TextStyle(
                                            color: NewTrierColors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Column(
                                    children: [
                                      const Text('Advisery',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: NewTrierColors.black,
                                        ),
                                      ),
                                      Text(
                                        snapshot.data?.getString('adviseryRoom') ?? '',
                                        style: const TextStyle(
                                          color: NewTrierColors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ]
                          ),
                          TableRow(
                              decoration: BoxDecoration(
                                color:  (widget.currentPeriod == "1st" || advToOne) ? Colors.white24 : null,
                              ),
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(periodNames[0],
                                          style: const TextStyle(
                                            color: NewTrierColors.black,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16.0,
                                          ),
                                        ),
                                        Text(periodTimes[0],
                                          style: const TextStyle(
                                            color: NewTrierColors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Column(
                                    children: [
                                      Text(
                                        snapshot.data?.getString('1AnchorClass') ?? '',
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: NewTrierColors.black,
                                        ),
                                      ),
                                      Text(
                                        snapshot.data?.getString('1AnchorRoom') ?? '',
                                        style: const TextStyle(
                                          color: NewTrierColors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ]
                          ),
                          TableRow(
                              decoration: BoxDecoration(
                                color:  (widget.currentPeriod == "2nd" || oneAToOneB) ? Colors.white24 : null,
                              ),
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(periodNames[1],
                                          style: const TextStyle(
                                              color: NewTrierColors.black,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16.0
                                          ),
                                        ),
                                        Text(periodTimes[1],
                                          style: const TextStyle(
                                            color:NewTrierColors.black,
                                          ),),
                                      ],
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Column(
                                    children: [
                                      Text(
                                        snapshot.data?.getString('2AnchorClass') ?? '',
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: NewTrierColors.black,
                                        ),
                                      ),
                                      Text(
                                        snapshot.data?.getString('2AnchorRoom') ?? '',
                                        style: const TextStyle(
                                          color: NewTrierColors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ]
                          ),
                          TableRow(
                              decoration: BoxDecoration(
                                color:  (widget.currentPeriod == "3rd" || oneBToTwoA) ? Colors.white24 : null,
                              ),
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(periodNames[2],
                                          style: const TextStyle(
                                            color: NewTrierColors.black,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(periodTimes[2],
                                          style: const TextStyle(
                                            color: NewTrierColors.black,
                                          ),),
                                      ],
                                    ),
                                  ),
                                ),
                                Column(
                                  children: [
                                    Text(
                                      snapshot.data?.getString('3AnchorClass') ?? '',
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: NewTrierColors.black,
                                      ),
                                    ),
                                    Text(snapshot.data?.getString('3AnchorRoom') ?? '',
                                      style: const TextStyle(
                                        color: NewTrierColors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ]
                          ),
                          TableRow(
                              decoration: BoxDecoration(
                                color:  (widget.currentPeriod == "4A" || twoAToTwoB) ? Colors.white24 : null,
                              ),
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(periodNames[3],
                                          style: const TextStyle(
                                            color: NewTrierColors.black,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(periodTimes[3],
                                          style: const TextStyle(
                                            color: NewTrierColors.black,
                                          ),),
                                      ],
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Column(
                                    children: [
                                      Text(snapshot.data?.getString(
                                          '4AAnchorClass') ?? '',
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: NewTrierColors.black,
                                        ),
                                      ),
                                      Text(snapshot.data?.getString(
                                          '4AAnchorRoom') ?? '',
                                        style: const TextStyle(
                                          color: NewTrierColors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ]
                          ),
                          TableRow(
                              decoration: BoxDecoration(
                                color:  (widget.currentPeriod == "4B" || twoBToTwoC) ? Colors.white24 : null ,
                              ),
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(periodNames[4],
                                          style: const TextStyle(
                                            color: NewTrierColors.black,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(periodTimes[4],
                                          style: const TextStyle(
                                            color: NewTrierColors.black,
                                          ),),
                                      ],
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Column(
                                    children: [
                                      Text(snapshot.data?.getString(
                                          '4BAnchorClass') ?? '',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: NewTrierColors.black,
                                        ),
                                      ),
                                      Text(snapshot.data?.getString(
                                          '4BAnchorRoom') ?? '',
                                        style: TextStyle(
                                          color: NewTrierColors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ]
                          ),
                          TableRow(
                              decoration: BoxDecoration(
                                color:  (widget.currentPeriod == "4C" || twoCToThreeA) ? Colors.white24 : null,
                              ),
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(periodNames[5],
                                          style: TextStyle(
                                            color: NewTrierColors.black,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(periodTimes[5],
                                          style: TextStyle(
                                            color: NewTrierColors.black,
                                          ),),
                                      ],
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Column(
                                    children: [
                                      Text(snapshot.data?.getString(
                                          '4CAnchorClass') ?? '',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: NewTrierColors.black,
                                        ),
                                      ),
                                      Text(snapshot.data?.getString(
                                          '4CAnchorRoom') ?? '',
                                        style: TextStyle(
                                          color: NewTrierColors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ]
                          ),
                          TableRow(
                              decoration: BoxDecoration(
                                color:  (widget.currentPeriod == "5th" || threeAToThreeB) ? Colors.white24 : null,
                              ),
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(periodNames[6],
                                          style: TextStyle(
                                            color: NewTrierColors.black,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(periodTimes[6],
                                          style: TextStyle(
                                            color: NewTrierColors.black,
                                          ),),
                                      ],
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Column(
                                    children: [
                                      Text(
                                        snapshot.data?.getString('5AnchorClass') ?? '',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: NewTrierColors.black,
                                        ),
                                      ),
                                      Text(
                                        snapshot.data?.getString('5AnchorRoom') ?? '',
                                        style: TextStyle(
                                          color: NewTrierColors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ]
                          ),
                          TableRow(
                              decoration: BoxDecoration(
                                color:  (widget.currentPeriod == "6th" || threeBToFourA) ? Colors.white24 : null,
                              ),
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(periodNames[7],
                                          style: TextStyle(
                                            color: NewTrierColors.black,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(periodTimes[7],
                                          style: TextStyle(
                                            color: NewTrierColors.black,
                                          ),),
                                      ],
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Column(
                                    children: [
                                      Text(
                                        snapshot.data?.getString('6AnchorClass') ?? '',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: NewTrierColors.black,
                                        ),
                                      ),
                                      Text(
                                        snapshot.data?.getString('6AnchorRoom') ?? '',
                                        style: TextStyle(
                                          color: NewTrierColors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ]
                          ),
                          TableRow(
                              decoration: BoxDecoration(
                                color:  (widget.currentPeriod == "7th" || fourAToFourB) ? Colors.white24 : null,
                              ),
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(periodNames[8],
                                          style: TextStyle(
                                            color: NewTrierColors.black,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(periodTimes[8],
                                          style: TextStyle(
                                            color: NewTrierColors.black,
                                          ),),
                                      ],
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Column(
                                    children: [
                                      Text(
                                        snapshot.data?.getString('7AnchorClass') ?? '',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: NewTrierColors.black,
                                        ),
                                      ),
                                      Text(
                                        snapshot.data?.getString('7AnchorRoom') ?? '',
                                        style: TextStyle(
                                          color: NewTrierColors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ]
                          ),
                          TableRow(
                              decoration: BoxDecoration(
                                color:  (widget.currentPeriod == "8th" || fourBToAnchor8Start) ? Colors.white24 : null,
                              ),
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(periodNames[9],
                                          style: TextStyle(
                                            color: NewTrierColors.black,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(periodTimes[9],
                                          style: TextStyle(
                                            color: NewTrierColors.black,
                                          ),),
                                      ],
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Column(
                                    children: [
                                      Text(
                                        snapshot.data?.getString('8AnchorClass') ?? '',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: NewTrierColors.black,
                                        ),
                                      ),
                                      Text(
                                        snapshot.data?.getString('8AnchorRoom') ?? '',
                                        style: TextStyle(
                                          color: NewTrierColors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ]
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                    ],
                  );
                } else {
                  //Northfield anchor day needs adjusted for 5A lunch.
                  return Column(
                    children: [
                      Text('Here\'s Your Schedule Today',
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: NewTrierColors.black,
                        ),),
                      Text(widget.campus == Campus.winnetka ? 'Winnetka Campus' : 'Northfield Campus',
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: NewTrierColors.black,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.normal,
                          fontSize: 12.0,
                        ),),
                      const SizedBox(
                        height: 4.0,
                      ),
                      Table(
                        defaultVerticalAlignment: TableCellVerticalAlignment
                            .middle,
                        border: TableBorder.all(color: Colors.white54),
                        columnWidths: const <int, TableColumnWidth>{
                          0: IntrinsicColumnWidth(),
                          1: FlexColumnWidth(),
                        },
                        children: [
                          TableRow(
                              decoration: BoxDecoration(
                                color: (widget.currentPeriod == "Advisery") ? Colors.white24 : null,
                              ),
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Text('Adv',
                                          style: TextStyle(
                                            color: NewTrierColors.black,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16.0,
                                          ),
                                        ),
                                        Text(adviseryTime,
                                          style:  const TextStyle(
                                            color: NewTrierColors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Column(
                                    children: [
                                      const Text('Advisery',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: NewTrierColors.black,
                                        ),
                                      ),
                                      Text(
                                        snapshot.data?.getString('adviseryRoom') ?? '',
                                        style: const TextStyle(
                                          color: NewTrierColors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ]
                          ),
                          TableRow(
                              decoration: BoxDecoration(
                                color:  (widget.currentPeriod == "1st" || advToOne) ? Colors.white24 : null,
                              ),
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(periodNames[0],
                                          style: const TextStyle(
                                            color: NewTrierColors.black,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16.0,
                                          ),
                                        ),
                                        Text(periodTimes[0],
                                          style: const TextStyle(
                                            color: NewTrierColors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Column(
                                    children: [
                                      Text(
                                        snapshot.data?.getString('1AnchorClass') ?? '',
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: NewTrierColors.black,
                                        ),
                                      ),
                                      Text(
                                        snapshot.data?.getString('1AnchorRoom') ?? '',
                                        style: const TextStyle(
                                          color: NewTrierColors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ]
                          ),
                          TableRow(
                              decoration: BoxDecoration(
                                color:  (widget.currentPeriod == "2nd" || oneAToOneB) ? Colors.white24 : null,
                              ),
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(periodNames[1],
                                          style: const TextStyle(
                                              color: NewTrierColors.black,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16.0
                                          ),
                                        ),
                                        Text(periodTimes[1],
                                          style: const TextStyle(
                                            color:NewTrierColors.black,
                                          ),),
                                      ],
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Column(
                                    children: [
                                      Text(
                                        snapshot.data?.getString('2AnchorClass') ?? '',
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: NewTrierColors.black,
                                        ),
                                      ),
                                      Text(
                                        snapshot.data?.getString('2AnchorRoom') ?? '',
                                        style: const TextStyle(
                                          color: NewTrierColors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ]
                          ),
                          TableRow(
                              decoration: BoxDecoration(
                                color:  (widget.currentPeriod == "3rd" || oneBToTwoA) ? Colors.white24 : null,
                              ),
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(periodNames[2],
                                          style: const TextStyle(
                                            color: NewTrierColors.black,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(periodTimes[2],
                                          style: const TextStyle(
                                            color: NewTrierColors.black,
                                          ),),
                                      ],
                                    ),
                                  ),
                                ),
                                Column(
                                  children: [
                                    Text(
                                      snapshot.data?.getString('3AnchorClass') ?? '',
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: NewTrierColors.black,
                                      ),
                                    ),
                                    Text(snapshot.data?.getString('3AnchorRoom') ?? '',
                                      style: const TextStyle(
                                        color: NewTrierColors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ]
                          ),
                          TableRow(
                              decoration: BoxDecoration(
                                color:  (widget.currentPeriod == "4th" || twoAToTwoB) ? Colors.white24 : null,
                              ),
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(periodNames[3],
                                          style: const TextStyle(
                                            color: NewTrierColors.black,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(periodTimes[3],
                                          style: const TextStyle(
                                            color: NewTrierColors.black,
                                          ),),
                                      ],
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Column(
                                    children: [
                                      Text(snapshot.data?.getString(
                                          '4AnchorClass') ?? '',
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: NewTrierColors.black,
                                        ),
                                      ),
                                      Text(snapshot.data?.getString(
                                          '4AnchorRoom') ?? '',
                                        style: const TextStyle(
                                          color: NewTrierColors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ]
                          ),
                          TableRow(
                              decoration: BoxDecoration(
                                color:  (widget.currentPeriod == "5A" || twoBToTwoC) ? Colors.white24 : null ,
                              ),
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(periodNames[4],
                                          style: const TextStyle(
                                            color: NewTrierColors.black,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(periodTimes[4],
                                          style: const TextStyle(
                                            color: NewTrierColors.black,
                                          ),),
                                      ],
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Column(
                                    children: [
                                      Text(snapshot.data?.getString(
                                          '5AAnchorClass') ?? '',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: NewTrierColors.black,
                                        ),
                                      ),
                                      Text(snapshot.data?.getString(
                                          '5AAnchorRoom') ?? '',
                                        style: TextStyle(
                                          color: NewTrierColors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ]
                          ),
                          TableRow(
                              decoration: BoxDecoration(
                                color:  (widget.currentPeriod == "5B" || twoCToThreeA) ? Colors.white24 : null,
                              ),
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(periodNames[5],
                                          style: TextStyle(
                                            color: NewTrierColors.black,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(periodTimes[5],
                                          style: TextStyle(
                                            color: NewTrierColors.black,
                                          ),),
                                      ],
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Column(
                                    children: [
                                      Text(snapshot.data?.getString(
                                          '5BAnchorClass') ?? '',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: NewTrierColors.black,
                                        ),
                                      ),
                                      Text(snapshot.data?.getString(
                                          '5BAnchorRoom') ?? '',
                                        style: TextStyle(
                                          color: NewTrierColors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ]
                          ),
                          TableRow(
                              decoration: BoxDecoration(
                                color:  (widget.currentPeriod == "5C" || threeAToThreeB) ? Colors.white24 : null,
                              ),
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(periodNames[6],
                                          style: TextStyle(
                                            color: NewTrierColors.black,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(periodTimes[6],
                                          style: TextStyle(
                                            color: NewTrierColors.black,
                                          ),),
                                      ],
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Column(
                                    children: [
                                      Text(
                                        snapshot.data?.getString('5CAnchorClass') ?? '',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: NewTrierColors.black,
                                        ),
                                      ),
                                      Text(
                                        snapshot.data?.getString('5CAnchorRoom') ?? '',
                                        style: TextStyle(
                                          color: NewTrierColors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ]
                          ),
                          TableRow(
                              decoration: BoxDecoration(
                                color:  (widget.currentPeriod == "6th" || threeBToFourA) ? Colors.white24 : null,
                              ),
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(periodNames[7],
                                          style: TextStyle(
                                            color: NewTrierColors.black,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(periodTimes[7],
                                          style: TextStyle(
                                            color: NewTrierColors.black,
                                          ),),
                                      ],
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Column(
                                    children: [
                                      Text(
                                        snapshot.data?.getString('6AnchorClass') ?? '',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: NewTrierColors.black,
                                        ),
                                      ),
                                      Text(
                                        snapshot.data?.getString('6AnchorRoom') ?? '',
                                        style: TextStyle(
                                          color: NewTrierColors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ]
                          ),
                          TableRow(
                              decoration: BoxDecoration(
                                color:  (widget.currentPeriod == "7th" || fourAToFourB) ? Colors.white24 : null,
                              ),
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(periodNames[8],
                                          style: TextStyle(
                                            color: NewTrierColors.black,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(periodTimes[8],
                                          style: TextStyle(
                                            color: NewTrierColors.black,
                                          ),),
                                      ],
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Column(
                                    children: [
                                      Text(
                                        snapshot.data?.getString('7AnchorClass') ?? '',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: NewTrierColors.black,
                                        ),
                                      ),
                                      Text(
                                        snapshot.data?.getString('7AnchorRoom') ?? '',
                                        style: TextStyle(
                                          color: NewTrierColors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ]
                          ),
                          TableRow(
                              decoration: BoxDecoration(
                                color:  (widget.currentPeriod == "8th" || fourBToAnchor8Start) ? Colors.white24 : null,
                              ),
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(periodNames[9],
                                          style: TextStyle(
                                            color: NewTrierColors.black,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(periodTimes[9],
                                          style: TextStyle(
                                            color: NewTrierColors.black,
                                          ),),
                                      ],
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Column(
                                    children: [
                                      Text(
                                        snapshot.data?.getString('8AnchorClass') ?? '',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: NewTrierColors.black,
                                        ),
                                      ),
                                      Text(
                                        snapshot.data?.getString('8AnchorRoom') ?? '',
                                        style: TextStyle(
                                          color: NewTrierColors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ]
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                    ],
                  );
                }

              }
              else {
                //Not an anchor day - Must be Blue or Green Day
                return Column(
                  children: [
                    Text('Here\'s Your Schedule Today',
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                        color: Colors.white,
                      ),),
                    Text(widget.campus == Campus.winnetka ? 'Winnetka Campus' : 'Northfield Campus',
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.normal,
                        fontSize: 12.0,
                      ),),
                    const SizedBox(
                      height: 4.0,
                    ),
                    Table(
                      defaultVerticalAlignment: TableCellVerticalAlignment
                          .middle,
                      border: TableBorder.all(color: Colors.white54),
                      columnWidths: const <int, TableColumnWidth>{
                        0: IntrinsicColumnWidth(),
                        1: FlexColumnWidth(),
                      },
                      children: [
                        TableRow(
                            decoration: BoxDecoration(
                              color: (widget.currentPeriod == "Advisery") ? Colors.white24 : null,
                            ),
                            children: [
                              TableCell(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Text('Adv',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16.0,
                                        ),
                                      ),
                                      Text(adviseryTime,
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              TableCell(
                                child: Column(
                                  children: [
                                    const Text('Advisery',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      snapshot.data?.getString('adviseryRoom') ?? '',
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ]
                        ),
                        TableRow(
                            decoration: BoxDecoration(
                              color: (widget.currentPeriod == periodNames[0] || advToOne) ? Colors.white24 : null,
                            ),
                            children: [
                              TableCell(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(periodNames[0],
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16.0,
                                        ),
                                      ),
                                      Text(periodTimes[0],
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              TableCell(
                                child: Column(
                                  children: [
                                    Text(snapshot.data?.getString(
                                        '${periodNames[0]}Class') ?? '',
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(snapshot.data?.getString(
                                        '${periodNames[0]}Room') ?? '',
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ]
                        ),
                        TableRow(
                            decoration: BoxDecoration(
                              color: (widget.currentPeriod == periodNames[1] || oneAToOneB) ? Colors.white24 : null,
                            ),
                            children: [
                              TableCell(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(periodNames[1],
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16.0
                                        ),
                                      ),
                                      Text(periodTimes[1],
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),),
                                    ],
                                  ),
                                ),
                              ),
                              TableCell(
                                child: Column(
                                  children: [
                                    Text(snapshot.data?.getString(
                                        '${periodNames[1]}Class') ?? '',
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(snapshot.data?.getString(
                                        '${periodNames[1]}Room') ?? '',
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ]
                        ),
                        TableRow(
                            decoration: BoxDecoration(
                              color: (widget.currentPeriod == periodNames[2] || oneBToTwoA) ? Colors.white24 : null,
                            ),
                            children: [
                              TableCell(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(periodNames[2],
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(periodTimes[2],
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),),
                                    ],
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  Text(snapshot.data?.getString(
                                      '${periodNames[2]}Class') ??
                                      '',
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(snapshot.data?.getString(
                                      '${periodNames[2]}Room') ??
                                      '',
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ]
                        ),
                        TableRow(
                            decoration: BoxDecoration(
                              color: (widget.currentPeriod == periodNames[3] || twoAToTwoB) ? Colors.white24 : null,
                            ),
                            children: [
                              TableCell(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(periodNames[3],
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(periodTimes[3],
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),),
                                    ],
                                  ),
                                ),
                              ),
                              TableCell(
                                child: Column(
                                  children: [
                                    Text(snapshot.data?.getString(
                                        '${periodNames[3]}Class') ?? '',
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(snapshot.data?.getString(
                                        '${periodNames[3]}Room') ?? '',
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ]
                        ),
                        TableRow(
                            decoration: BoxDecoration(
                              color: (widget.currentPeriod == periodNames[4] || twoBToTwoC) ? Colors.white24 : null,
                            ),
                            children: [
                              TableCell(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(periodNames[4],
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(periodTimes[4],
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),),
                                    ],
                                  ),
                                ),
                              ),
                              TableCell(
                                child: Column(
                                  children: [
                                    Text(snapshot.data?.getString(
                                        '${periodNames[4]}Class') ?? '',
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(snapshot.data?.getString(
                                        '${periodNames[4]}Room') ?? '',
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ]
                        ),
                        TableRow(
                            decoration: BoxDecoration(
                              color: (widget.currentPeriod == periodNames[5] || twoCToThreeA) ? Colors.white24 : null,
                            ),
                            children: [
                              TableCell(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(periodNames[5],
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(periodTimes[5],
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),),
                                    ],
                                  ),
                                ),
                              ),
                              TableCell(
                                child: Column(
                                  children: [
                                    Text(snapshot.data?.getString(
                                        '${periodNames[5]}Class') ?? '',
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(snapshot.data?.getString(
                                        '${periodNames[5]}Room') ?? '',
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ]
                        ),
                        TableRow(
                            decoration: BoxDecoration(
                              color: (widget.currentPeriod == periodNames[6] || threeAToThreeB) ? Colors.white24 : null,
                            ),
                            children: [
                              TableCell(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(periodNames[6],
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(periodTimes[6],
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),),
                                    ],
                                  ),
                                ),
                              ),
                              TableCell(
                                child: Column(
                                  children: [
                                    Text(snapshot.data?.getString(
                                        '${periodNames[6]}Class') ?? '',
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(snapshot.data?.getString(
                                        '${periodNames[6]}Room') ?? '',
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ]
                        ),
                        TableRow(
                            decoration: BoxDecoration(
                              color: (widget.currentPeriod == periodNames[7] || threeBToFourA) ? Colors.white24 : null,
                            ),
                            children: [
                              TableCell(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(periodNames[7],
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(periodTimes[7],
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),),
                                    ],
                                  ),
                                ),
                              ),
                              TableCell(
                                child: Column(
                                  children: [
                                    Text(snapshot.data?.getString(
                                        '${periodNames[7]}Class') ?? '',
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(snapshot.data?.getString(
                                        '${periodNames[7]}Room') ?? '',
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ]
                        ),
                        TableRow(
                            decoration: BoxDecoration(
                              color: (widget.currentPeriod == periodNames[8] || fourAToFourB) ? Colors.white24 : null,
                            ),
                            children: [
                              TableCell(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(periodNames[8],
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(periodTimes[8],
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),),
                                    ],
                                  ),
                                ),
                              ),
                              TableCell(
                                child: Column(
                                  children: [
                                    Text(snapshot.data?.getString(
                                        '${periodNames[8]}Class') ?? '',
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(snapshot.data?.getString(
                                        '${periodNames[8]}Room') ?? '',
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ]
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                  ],
                );
              }
            }
          } else if (snapshot.hasError) {
            return const Text('Error loading schedule.');
          } else {
            return const SizedBox.shrink();
          }
        }
    );
  }
}
