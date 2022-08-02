import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nt_block_android/new_trier_colors.dart';
import 'package:nt_block_android/new_trier_dates.dart';
import 'package:nt_block_android/plds.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:url_launcher/url_launcher.dart';



class CalendarView extends StatefulWidget {
  const CalendarView({Key? key}) : super(key: key);

  @override
  _CalendarViewState createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {

  var daysRemaining = 0;
  final today = DateTime.now();
  final lastDayOfSchool = tz.TZDateTime(tz.getLocation('America/Chicago'), 2023, 6, 10, 23, 59);

  void calculateDaysRemaining() {

    final daysRemainingDuration = lastDayOfSchool.difference(today);
    setState(() {
      daysRemaining = daysRemainingDuration.inDays;
    });
  }

  @override
  void initState() {
    super.initState();
    calculateDaysRemaining();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendar View'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: daysRemaining + 1,
                  itemBuilder: (context, index) {
                    for (var day = 0; day <= daysRemaining; day++) {
                      final calendarDay = today.add(Duration(days: day));
                      final format = DateFormat('EEEE, MMMM d, yyyy');
                      final formattedDate = format.format(calendarDay);
                      var dayColor = NewTrierColors.green;
                      var dayColorText = 'Green Day';
                      var studentSupportDayText = '';
                      if (index == day) {
                        //TODO: Change to end of 2022-2023 school year once school year begins.

                        if (calendarDay.isAfter(tz.TZDateTime(tz.getLocation('America/Chicago'), 2022, 6, 10, 23, 59)) && calendarDay.isBefore(tz.TZDateTime(tz.getLocation('America/Chicago'), 2022, 8, 17, 23, 59))) {
                          dayColor = NewTrierColors.gray;
                          dayColorText = 'No School - Summer Break';
                        }

                        for (var blueDay in blueDays) {
                          if (calendarDay.day == blueDay.day && calendarDay.month == blueDay.month && calendarDay.year == blueDay.year) {
                            dayColor = NewTrierColors.blue;
                            dayColorText = 'Blue Day';
                          }
                        }

                        for (var anchorDay in anchorDays) {
                          if (calendarDay.day == anchorDay.day && calendarDay.month == anchorDay.month && calendarDay.year == anchorDay.year) {
                            dayColor = NewTrierColors.yellow;
                            dayColorText = 'Anchor Day';
                            studentSupportDayText = '';
                            for (var pltDay in allPLTs) {
                              if (calendarDay.day == pltDay.day  && calendarDay.month == pltDay.month && calendarDay.year == pltDay.year) {
                                studentSupportDayText = 'The following departments do not have class today due to Professional Development:';
                              }
                            }
                          }
                        }

                        //First Day of School
                        if (calendarDay.day == 22 && calendarDay.month == 8 && calendarDay.year == 2022) {
                          dayColor = NewTrierColors.yellow;
                          dayColorText = 'Anchor Day';
                          studentSupportDayText = 'Special Schedule for the Opening Day of School.';
                        }

                        if (calendarDay.weekday == 6 || calendarDay.weekday == 7) {
                          dayColor = NewTrierColors.gray;
                          dayColorText = '';
                          studentSupportDayText = '';
                        }

                        for (var pld in aaPLTs) {
                          if (calendarDay.day == pld.day && calendarDay.month == pld.month &&
                              calendarDay.year == pld.year) {
                            studentSupportDayText += '\nApplied Arts';
                          }
                        }

                        for (var pld in artPLTs) {
                          if (calendarDay.day == pld.day && calendarDay.month == pld.month &&
                              calendarDay.year == pld.year) {
                            studentSupportDayText += '\nArt';
                          }
                        }

                        for (var pld in businessPLTs) {
                          if (calendarDay.day == pld.day && calendarDay.month == pld.month &&
                              calendarDay.year == pld.year) {
                            studentSupportDayText += '\nBusiness Education';
                          }
                        }

                        for (var pld in musicPLTs) {
                          if (calendarDay.day == pld.day && calendarDay.month == pld.month &&
                              calendarDay.year == pld.year) {
                            studentSupportDayText += '\nMusic & Theatre';
                          }
                        }

                        for (var pld in englishPLTs) {
                          if (calendarDay.day == pld.day && calendarDay.month == pld.month &&
                              calendarDay.year == pld.year) {
                            studentSupportDayText += '\nEnglish';
                          }
                        }

                        for (var pld in kwPLTs) {
                          if (calendarDay.day == pld.day && calendarDay.month == pld.month &&
                              calendarDay.year == pld.year) {
                            studentSupportDayText += '\nKinetic Wellness';
                          }
                        }

                        for (var pld in mathPLTs) {
                          if (calendarDay.day == pld.day && calendarDay.month == pld.month &&
                              calendarDay.year == pld.year) {
                            studentSupportDayText += '\nMath';
                          }
                        }

                        for (var pld in mclPLTs) {
                          if (calendarDay.day == pld.day && calendarDay.month == pld.month &&
                              calendarDay.year == pld.year) {
                            studentSupportDayText += '\nModern & Classical Languages';
                          }
                        }

                        for (var pld in sciencePLDs) {
                          if (calendarDay.day == pld.day && calendarDay.month == pld.month &&
                              calendarDay.year == pld.year) {
                            studentSupportDayText += '\nScience';
                          }
                        }

                        for (var pld in ssPLTs) {
                          if (calendarDay.day == pld.day && calendarDay.month == pld.month &&
                              calendarDay.year == pld.year) {
                            studentSupportDayText += '\nSocial Studies';
                          }
                        }

                        for (var pld in specialEdPLTs) {
                          if (calendarDay.day == pld.day && calendarDay.month == pld.month &&
                              calendarDay.year == pld.year) {
                            studentSupportDayText += '\nSpecial Education';
                          }
                        }

                        for (var extendedAdv in extendedAdviseries) {
                          if (calendarDay.day == extendedAdv.day && calendarDay.month == extendedAdv.month &&
                              calendarDay.year == extendedAdv.year) {
                            dayColorText += ' - Extended Advisery';
                          }
                        }

                        for (var specialSchedule in lateStarts) {
                          if (calendarDay.day == specialSchedule.day && calendarDay.month == specialSchedule.month &&
                              calendarDay.year == specialSchedule.year) {
                            dayColorText += ' - Late Start';
                            //studentSupportDayText = 'No student support release time on Late Start days.';
                          }
                        }

                        for (var specialSchedule in earlyDismissals) {
                          if (calendarDay.day == specialSchedule.day && calendarDay.month == specialSchedule.month &&
                              calendarDay.year == specialSchedule.year) {
                            dayColorText += ' - Early Dismissal';
                            //studentSupportDayText = 'No student support release time on Early Dismissal days.';
                          }
                        }

                        for (var exam in finals) {
                          if (calendarDay.day == exam.day && calendarDay.month == exam.month &&
                              calendarDay.year == exam.year) {
                            dayColorText = 'Final Exams';
                            dayColor = NewTrierColors.brown;
                            studentSupportDayText = '';
                          }
                        }

                        for (var holiday in holidays) {
                          if (calendarDay.day == holiday.day && calendarDay.month == holiday.month &&
                              calendarDay.year == holiday.year) {
                            dayColorText = 'No School - Holiday';
                            dayColor = NewTrierColors.gray;
                            studentSupportDayText = '';
                          }
                        }

                        for (var holiday in springBreak) {
                          if (calendarDay.day == holiday.day && calendarDay.month == holiday.month &&
                              calendarDay.year == holiday.year) {
                            dayColorText = 'No School - Spring Break';
                            dayColor = NewTrierColors.gray;
                            studentSupportDayText = '';
                          }
                        }

                        for (var dayOff in gradingDays) {
                          if (calendarDay.day == dayOff.day && calendarDay.month == dayOff.month &&
                              calendarDay.year == dayOff.year) {
                            dayColorText = 'No School - Grading Day';
                            dayColor = NewTrierColors.gray;
                            studentSupportDayText = '';
                          }
                        }

                        for (var dayOff in instituteDays) {
                          if (calendarDay.day == dayOff.day && calendarDay.month == dayOff.month &&
                              calendarDay.year == dayOff.year) {
                            dayColorText = 'No School - Staff Institute Day';
                            dayColor = NewTrierColors.gray;
                            studentSupportDayText = '';
                          }
                        }

                        if (calendarDay.day == 10 && calendarDay.month == 11 && calendarDay.year == 2022) {
                          dayColorText = 'No School - Parent-Teacher Conferences';
                          dayColor = NewTrierColors.gray;
                          studentSupportDayText = '';
                        }

                        if (calendarDay.day == 12 && calendarDay.month == 10 && calendarDay.year == 2022) {
                          studentSupportDayText = 'Freshman go to School Night at the Northfield Campus';
                        }



                        // for (var dayOff in [makeUpDay1]) {
                        //   if (calendarDay.day == dayOff.day && calendarDay.month == dayOff.month &&
                        //       calendarDay.year == dayOff.year) {
                        //     dayColorText = 'Make Up Test Day - Student Attendance Not Required';
                        //     dayColor = NewTrierColors.gray;
                        //     studentSupportDayText = '';
                        //   }
                        // }

                        if (calendarDay.day == 12 && calendarDay.month == 4 && calendarDay.year == 2023) {
                          dayColorText = 'State Testing at Winnetka. Anchor Day at Northfield.';
                        }

                        if (calendarDay.day == 19 && calendarDay.month == 4 && calendarDay.year == 2023) {
                          dayColorText = 'State Testing at Northfield. Anchor Day at Winnetka.';
                        }

                        if (calendarDay.day == 17 && calendarDay.month == 5 && calendarDay.year == 2023) {
                          studentSupportDayText = 'Last Day of School for Seniors.';
                        }



                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.fromLTRB(6.0, 4.0, 0.0, 4.0) ,
                              color: NewTrierColors.backgroundGray,
                              width: double.infinity,
                              child: Text(formattedDate,
                                style: const TextStyle(
                                    color: Color(0xFF434343),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600
                                ),
                              ),
                            ),
                            Padding(
                              padding: (studentSupportDayText != '') ? const EdgeInsets.fromLTRB(16.0, 6.0, 0, 0) : (dayColorText == '') ? const EdgeInsets.all(2.0) : const EdgeInsets.fromLTRB(16.0, 8.0, 0, 12.0),
                              child: Text(dayColorText,
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: dayColor,
                                ),),
                            ),
                            Visibility(
                              visible: studentSupportDayText != '',
                              child: Padding(
                                padding: studentSupportDayText != '' ? const EdgeInsets.fromLTRB(16.0, 0.0, 8.0, 8.0) : const EdgeInsets.all(0.0),
                                child: Text(studentSupportDayText,
                                  style: const TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF313131)
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      }
                    }

                    return Text('');

                  }),
            ),
            SizedBox(
              height: 40,
              child: Center(
                child: TextButton(
                  onPressed: () async {
                    final Uri urlToLaunch = Uri.https('www.newtrier.k12.il.us', '/Page/2');
                    if (!await launchUrl(urlToLaunch)) throw 'Could not launch url';
                  },
                  child: const Text('View Official New Trier Calendars'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
