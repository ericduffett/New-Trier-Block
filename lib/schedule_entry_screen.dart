import 'package:flutter/material.dart';
import 'package:nt_block_android/bell_schedule.dart';
import 'package:nt_block_android/new_trier_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';


class ScheduleEntryScreen extends StatefulWidget {
  const ScheduleEntryScreen({Key? key}) : super(key: key);

  @override
  State<ScheduleEntryScreen> createState() => _ScheduleEntryScreenState();
}

class _ScheduleEntryScreenState extends State<ScheduleEntryScreen> {

  // final TextEditingController _classNameController = TextEditingController();
  // final FocusNode _classNameFocusNode = FocusNode();
  // final TextEditingController _roomNumberController = TextEditingController();
  // final FocusNode _roomNumberFocusNode = FocusNode();
  //
  // final TextEditingController _aBlockController = TextEditingController();
  // final TextEditingController _aBlockRoomController = TextEditingController();
  // final TextEditingController _bBlockController = TextEditingController();
  // final TextEditingController _bBlockRoomController = TextEditingController();
  // final TextEditingController _cBlockController = TextEditingController();
  // final TextEditingController _cBlockRoomController = TextEditingController();
  // final TextEditingController _aAnchorBlockController = TextEditingController();
  // final TextEditingController _aAnchorRoomController = TextEditingController();
  // final TextEditingController _bAnchorBlockController = TextEditingController();
  // final TextEditingController _bAnchorRoomController = TextEditingController();
  // final TextEditingController _cAnchorBlockController = TextEditingController();
  // final TextEditingController _cAnchorRoomController = TextEditingController();
  // final FocusNode _aBlockFocusNode = FocusNode();
  // final FocusNode _aBlockRoomFocusNode = FocusNode();
  // final FocusNode _bBlockFocusNode = FocusNode();
  // final FocusNode _bBlockRoomFocusNode = FocusNode();
  // final FocusNode _cBlockFocusNode = FocusNode();
  // final FocusNode _cBlockRoomFocusNode = FocusNode();
  // final FocusNode _aAnchorBlockFocusNode = FocusNode();
  // final FocusNode _aAnchorBlockRoomFocusNode = FocusNode();
  // final FocusNode _bAnchorBlockFocusNode = FocusNode();
  // final FocusNode _bAnchorBlockRoomFocusNode = FocusNode();
  // final FocusNode _cAnchorBlockFocusNode = FocusNode();
  // final FocusNode _cAnchorBlockRoomFocusNode = FocusNode();

  String scheduleToEnter = 'Blue';
  Campus selectedCampus = Campus.winnetka;
  // bool isFreePeriod = false;
  // bool? isFullPeriodClass = true;
  // int periodNumber = 1;

  // String? lunchPeriod = 'A';
  // String? scheduleType = 'Full Period';

  // bool hasCBlock() {
  //   bool cBlockToReturn = false;
  //   if (selectedCampus == Campus.winnetka) {
  //     if (periodNumber == 2 || periodNumber == 6) {
  //       cBlockToReturn = true;
  //     } else {
  //       cBlockToReturn = false;
  //     }
  //   } else {
  //     if (periodNumber == 3 || periodNumber == 7) {
  //       return true;
  //     } else {
  //       return false;
  //     }
  //   }
  //
  //   return cBlockToReturn;
  // }


  // String convertPeriodToString() {
  //   switch (periodNumber) {
  //     case 1:
  //       return "First";
  //     case 2:
  //       return "Second";
  //     case 3:
  //       return "Third";
  //     case 4:
  //       return "Fourth";
  //     case 5:
  //       return "Fifth";
  //     case 6:
  //       return "Sixth";
  //     case 7:
  //       return "Seventh";
  //     case 8:
  //       return "Eighth";
  //     default:
  //       return "Unknown";
  //   }
  // }


  advanceScheduleEntry() {
    setState((){
      if (scheduleToEnter == 'Blue') {
        scheduleToEnter = 'Green';
      } else if (scheduleToEnter == 'Green') {
        showDialog(context: context, builder: (context) {
          return AlertDialog(
            title: const Text('Confirm Anchor Day Schedule',
              style: TextStyle(
                color: NewTrierColors.blue,
              ),),
            content: const Text('We\'ve done our best to populate your anchor day schedule based on what you entered for your blue and green day schedules. Please enter your advisery room number, remove your science lab period, and make other edits as necessary before hitting save.'),
            actions: [
              TextButton(
                child: const Text('OK'),
                onPressed: () => Navigator.of(context).pop(),
              )
            ],
          );
        });
        scheduleToEnter = 'Anchor';
      } else if (scheduleToEnter == 'Anchor') {
        scheduleToEnter = 'Complete';
        showDialog(context: context, builder: (context){
          return AlertDialog(
            title: const Text('Schedule Entry Complete',
              style: TextStyle(
                color: NewTrierColors.blue,
              ),
            ),
            content: const Text('Edit your schedule any time by returning to the profile screen and hitting \'Edit\' in the top right corner.'),
            actions: [
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  SharedPreferences.getInstance().then((prefs) => prefs.setBool('hasEnteredScheduleInfo', true));
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
      }
    });
  }

//   saveClassData() async {
//     final prefs = await SharedPreferences.getInstance();
//     if (hasCBlock()) {
//       final aClassName = _aBlockController.text;
//       final aRoomNumber = _aBlockRoomController.text;
//       prefs.setString('${periodNumber}aClass', aClassName);
//       prefs.setString('${periodNumber}aRoom', aRoomNumber);
//       final bClassName = _bBlockController.text;
//       final bRoomNumber = _bBlockRoomController.text;
//       prefs.setString('${periodNumber}bClass', bClassName);
//       prefs.setString('${periodNumber}bRoom', bRoomNumber);
//       final cClassName = _cBlockController.text;
//       final cRoomNumber = _cBlockRoomController.text;
//       prefs.setString('${periodNumber}cClass', cClassName);
//       prefs.setString('${periodNumber}cRoom', cRoomNumber);
//       //prefs.setString('${periodNumber}lunch', lunchPeriod ?? 'A');
//
//       final lowerCaseLunch = lunchPeriod!.toLowerCase();
//       prefs.setString('$periodNumber${lowerCaseLunch}Class', 'Lunch');
//     }
//     else if (isFullPeriodClass == true) {
//       final className = _classNameController.text;
//       final roomNumber = _roomNumberController.text;
//       prefs.setString('${periodNumber}aClass', className);
//       prefs.setString('${periodNumber}aRoom', roomNumber);
//       prefs.setString('${periodNumber}bClass', className);
//       prefs.setString('${periodNumber}bRoom', roomNumber);
//       //Can't have CBlock based on previous if statement
//       // if (hasCBlock()) {
//       //   prefs.setString('${periodNumber}cClass', className);
//       //   prefs.setString('${periodNumber}cRoom', roomNumber);
//       // }
//     } else {
//       //Period only has A/B Blocks but user has not  marked it as a full period class.
//       final aClassName = _aBlockController.text;
//       final aRoomNumber = _aBlockRoomController.text;
//       prefs.setString('${periodNumber}aClass', aClassName);
//       prefs.setString('${periodNumber}aRoom', aRoomNumber);
//       final bClassName = _bBlockController.text;
//       final bRoomNumber = _bBlockRoomController.text;
//       prefs.setString('${periodNumber}bClass', bClassName);
//       prefs.setString('${periodNumber}bRoom', bRoomNumber);
//       //Can't have a C block due to previous if statement.
//       // if (hasCBlock()) {
//       //   print("has C Block");
//       //   final cClassName = _cBlockController.text;
//       //   final cRoomNumber = _cBlockRoomController.text;
//       //   prefs.setString('${periodNumber}cClass', cClassName);
//       //   prefs.setString('${periodNumber}cRoom', cRoomNumber);
//       // }
//     }
// //Add anchor Day Details
//     if (periodNumber == 4) {
//       final aClassName = _aAnchorBlockController.text;
//       final aRoomNumber = _aAnchorRoomController.text;
//       prefs.setString('4aAnchorClass', aClassName);
//       prefs.setString('4aAnchorRoom', aRoomNumber);
//       final bClassName = _bAnchorBlockController.text;
//       final bRoomNumber = _bAnchorRoomController.text;
//       prefs.setString('4bAnchorClass', bClassName);
//       prefs.setString('4bAnchorRoom', bRoomNumber);
//       final cClassName = _cAnchorBlockController.text;
//       final cRoomNumber = _cAnchorRoomController.text;
//       prefs.setString('4cAnchorClass', cClassName);
//       prefs.setString('4cAnchorRoom', cRoomNumber);
//       //prefs.setString('4AnchorLunch', lunchPeriod ?? 'A');
//
//       final lowerCaseLunch = lunchPeriod!.toLowerCase();
//       prefs.setString('$periodNumber${lowerCaseLunch}AnchorClass', 'Lunch');
//     }
//
//     _classNameController.clear();
//     _roomNumberController.clear();
//     _aBlockController.clear();
//     _bBlockController.clear();
//     _cBlockController.clear();
//     _aBlockRoomController.clear();
//     _bBlockRoomController.clear();
//     _cBlockRoomController.clear();
//
//   }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Schedule Entry'),
        leading: IconButton(
          //color: NewTrierColors.blue,
          icon: const Icon(Icons.close),
          onPressed: () async {
            final prefs = await SharedPreferences.getInstance();
            final hasEnteredSchedule = prefs.getBool('hasEnteredScheduleInfo') ?? false;
            if (hasEnteredSchedule) {
              Navigator.of(context).pop();
            } else {
              showDialog(context: context, builder: (context){
                return AlertDialog(
                  title: const Text('Are you sure you want to cancel adding your schedule?',
                    style: TextStyle(
                      color: NewTrierColors.blue,
                    ),
                  ),
                  content: const Text('Canceling at this point will remove all schedule information.'),
                  actions: [
                    TextButton(
                      child: const Text('Yes, cancel adding data.',
                        style: TextStyle(
                          color: Colors.red,
                        ),),
                      onPressed: () async {
                        final prefs = await SharedPreferences.getInstance();
                        prefs.remove('adviseryRoom');
                        prefs.remove('1AClass');
                        prefs.remove('1BClass');
                        prefs.remove('1ARoom');
                        prefs.remove('1BRoom');

                        prefs.remove('2AClass');
                        prefs.remove('2BClass');
                        prefs.remove('2ARoom');
                        prefs.remove('2BRoom');
                        prefs.remove('2CClass');
                        prefs.remove('2CRoom');

                        prefs.remove('3AClass');
                        prefs.remove('3BClass');
                        prefs.remove('3ARoom');
                        prefs.remove('3BRoom');
                        prefs.remove('3CClass');
                        prefs.remove('3CRoom');

                        prefs.remove('4AClass');
                        prefs.remove('4BClass');
                        prefs.remove('4ARoom');
                        prefs.remove('4BRoom');

                        prefs.remove('4AAnchorClass');
                        prefs.remove('4BAnchorClass');
                        prefs.remove('4CAnchorClass');
                        prefs.remove('4AAnchorRoom');
                        prefs.remove('4BAnchorRoom');
                        prefs.remove('4CAnchorRoom');

                        prefs.remove('5AClass');
                        prefs.remove('5BClass');
                        prefs.remove('5ARoom');
                        prefs.remove('5BRoom');

                        prefs.remove('6AClass');
                        prefs.remove('6BClass');
                        prefs.remove('6ARoom');
                        prefs.remove('6BRoom');
                        prefs.remove('6CClass');
                        prefs.remove('6CRoom');

                        prefs.remove('7AClass');
                        prefs.remove('7BClass');
                        prefs.remove('7ARoom');
                        prefs.remove('7BRoom');
                        prefs.remove('7CClass');
                        prefs.remove('7CRoom');

                        prefs.remove('8AClass');
                        prefs.remove('8BClass');
                        prefs.remove('8ARoom');
                        prefs.remove('8BRoom');

                        prefs.remove('1AnchorClass');
                        prefs.remove('1AnchorRoom');
                        prefs.remove('2AnchorClass');
                        prefs.remove('2AnchorRoom');
                        prefs.remove('3AnchorClass');
                        prefs.remove('3AnchorRoom');
                        prefs.remove('5AnchorClass');
                        prefs.remove('5AnchorRoom');
                        prefs.remove('6AnchorClass');
                        prefs.remove('6AnchorRoom');
                        prefs.remove('7AnchorClass');
                        prefs.remove('7AnchorRoom');
                        prefs.remove('8AnchorClass');
                        prefs.remove('8AnchorRoom');

                        prefs.remove('hasEnteredScheduleInfo');

                        Navigator.of(context).pop();
                        Navigator.of(context).pop();

                      },
                    ),
                    TextButton(
                      child: const Text('No, continue editing.'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    )

                  ],
                );
              });
            }


          },
        ),
      ),
      //extendBodyBehindAppBar: true,
      body: SafeArea(
          minimum: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 32.0),
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Enter your schedule for this semester.",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: NewTrierColors.blue,
                        fontFamily: 'Poppins',
                        fontSize: 18.0,
                      ),
                    ),
                    const Text("You can edit your schedule later to make changes at the semester.",),
                    const Text('Hint: Use the \'next\' button on the keyboard after entering the A Block for each class to easily copy the class info to the B block as well.',
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                      ),),
                    const SizedBox(
                      height: 16.0,
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    const Text('Campus',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: NewTrierColors.blue,
                      ),),
                    Row(
                      children: [
                        Radio(
                            fillColor: MaterialStateProperty.all(NewTrierColors.blue),
                            value: Campus.winnetka,
                            groupValue: selectedCampus,
                            onChanged: (Campus? newValue) {
                              setState(() {
                                selectedCampus = newValue!;
                              });
                            }),
                        const Text('Winnetka'),
                        Radio(
                            fillColor: MaterialStateProperty.all(NewTrierColors.blue),
                            value: Campus.northfield,
                            groupValue: selectedCampus,
                            onChanged: (Campus? newValue) {
                              setState(() {
                                selectedCampus = newValue!;
                              });
                            }),
                        const Text('Northfield'),
                      ],
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Visibility(
                      visible: scheduleToEnter == 'Blue',
                      child:  BlueDayScheduleEntry(campus: selectedCampus, onComplete: advanceScheduleEntry,),
                    ),
                    Visibility(
                      visible: scheduleToEnter == 'Green',
                      child:  GreenDayScheduleEntry(campus: selectedCampus, onComplete: advanceScheduleEntry,),
                    ),
                    Visibility(
                      visible: scheduleToEnter == 'Anchor',
                      child:  (selectedCampus == Campus.winnetka) ? WinnetkaAnchorDayScheduleEntry(campus: selectedCampus, onComplete: advanceScheduleEntry,) : NorthfieldAnchorDayScheduleEntry(campus: selectedCampus, onComplete: advanceScheduleEntry,),
                    ),

                  ],
                )
            ),
          )
      ),

      // SafeArea(
      //   minimum: const EdgeInsets.fromLTRB(16.0, 100.0, 16.0, 32.0),
      //   child: GestureDetector(
      //     onTap: () => FocusScope.of(context).unfocus(),
      //     child: Container(
      //       color: Colors.transparent,
      //       height: double.infinity,
      //       width: double.infinity,
      //       child: ListView(
      //         children: [
      //           const Text("Enter your schedule for this semester.",
      //             style: TextStyle(
      //               fontWeight: FontWeight.w600,
      //               color: NewTrierColors.blue,
      //               fontFamily: 'Poppins',
      //               fontSize: 18.0,
      //             ),
      //           ),
      //           const Text("You can edit your schedule later to make changes at the semester.",),
      //           const SizedBox(
      //             height: 16.0,
      //           ),
      //           Text('${convertPeriodToString()} Period',
      //             textAlign: TextAlign.start,
      //             style: const TextStyle(
      //               fontSize: 18.0,
      //               fontWeight: FontWeight.bold,
      //               color: NewTrierColors.blue,
      //             ),
      //           ),
      //           const SizedBox(
      //             height: 8.0,
      //           ),
      //           const Text('Campus'),
      //           Row(
      //             children: [
      //               Radio(
      //                   fillColor: MaterialStateProperty.all(NewTrierColors.blue),
      //                   value: Campus.winnetka,
      //                   groupValue: selectedCampus,
      //                   onChanged: (Campus? newValue) {
      //                     setState(() {
      //                       selectedCampus = newValue!;
      //                     });
      //                   }),
      //               const Text('Winnetka'),
      //               Radio(
      //                   fillColor: MaterialStateProperty.all(NewTrierColors.blue),
      //                   value: Campus.northfield,
      //                   groupValue: selectedCampus,
      //                   onChanged: (Campus? newValue) {
      //                     setState(() {
      //                       selectedCampus = newValue!;
      //                     });
      //                   }),
      //               const Text('Northfield'),
      //
      //             ],
      //           ),
      //           const SizedBox(
      //             height: 8.0,
      //           ),
      //           Visibility(
      //             visible: !(hasCBlock()),
      //             child: Column(
      //               children: [
      //                 Row(
      //                   children: [
      //                     Padding(
      //                       padding: const EdgeInsets.only(right: 8.0),
      //                       child: SizedBox(
      //                         height: 20,
      //                         width: 20,
      //                         child: Checkbox(
      //                             fillColor: MaterialStateProperty.all(NewTrierColors.blue),
      //                             value: isFreePeriod,
      //                             onChanged: (newValue) {
      //                               setState(() {
      //                                 isFreePeriod = newValue!;
      //                               });
      //                             }),
      //                       ),
      //                     ),
      //                     const Text('Free Period'),
      //                   ],
      //                 ),
      //                 const SizedBox(
      //                   height: 8.0,
      //                 ),
      //               ],
      //             ),
      //           ),
      //
      //           Visibility(
      //             visible: (!hasCBlock() && !isFreePeriod),
      //             child: Column(
      //               mainAxisSize: MainAxisSize.min,
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               mainAxisAlignment: MainAxisAlignment.start,
      //               children: [
      //                 Row(
      //                   children: [
      //                     Padding(
      //                       padding: const EdgeInsets.only(right: 8.0),
      //                       child: SizedBox(
      //                         width: 20,
      //                         height: 20,
      //                         child: Checkbox(
      //                             materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      //                             fillColor: MaterialStateProperty.all(NewTrierColors.blue),
      //                             value: isFullPeriodClass,
      //                             onChanged: (newValue) {
      //                               setState(() {
      //                                 isFullPeriodClass = newValue;
      //                               });
      //                             }),
      //                       ),
      //                     ),
      //                     const Text('Full Period Class'),
      //                   ],
      //                 ),
      //                 Visibility(
      //                   visible: (!isFreePeriod && isFullPeriodClass!),
      //                   child: Row(
      //                     children: [
      //                       Expanded(
      //                         child: Padding(
      //                           padding: const EdgeInsets.only(right: 16.0),
      //                           child: TextField(
      //                             controller: _classNameController,
      //                             focusNode: _classNameFocusNode,
      //                             decoration: const InputDecoration(
      //                               labelText: 'Class Name',
      //                             ),
      //                           ),
      //                         ),
      //                       ),
      //                       Expanded(
      //                         child: TextField(
      //                           controller: _roomNumberController,
      //                           focusNode: _roomNumberFocusNode,
      //                           decoration: const InputDecoration(
      //                               labelText: 'Room Number'
      //                           ),
      //                         ),
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //               ],
      //             ),
      //           ),
      //           const SizedBox(
      //             height: 8.0,
      //           ),
      //           //TODO: Add lunch period details for 2/6 at Winnetka and 3/7 at Northfield
      //           Visibility(
      //             visible: hasCBlock(),
      //             child: Column(
      //               mainAxisSize: MainAxisSize.min,
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [
      //                 const Text('Lunch Period',
      //                 ),
      //                 Row(
      //                   children: [
      //                     Radio(
      //                         fillColor: MaterialStateProperty.all(NewTrierColors.blue),
      //                         value: 'A',
      //                         groupValue: lunchPeriod,
      //                         onChanged: (String? newValue) {
      //                           setState(() {
      //                             lunchPeriod = newValue;
      //                           });
      //                         }),
      //                     const Text('A'),
      //                     Radio(
      //                         fillColor: MaterialStateProperty.all(NewTrierColors.blue),
      //                         value: 'B',
      //                         groupValue: lunchPeriod,
      //                         onChanged: (String? newValue) {
      //                           setState(() {
      //                             lunchPeriod = newValue;
      //                           });
      //                         }),
      //                     const Text('B'),
      //                     Radio(
      //                         fillColor: MaterialStateProperty.all(NewTrierColors.blue),
      //                         value: 'C',
      //                         groupValue: lunchPeriod,
      //                         onChanged: (String? newValue) {
      //                           setState(() {
      //                             lunchPeriod = newValue;
      //                           });
      //                         }),
      //                     const Text('C'),
      //                   ],
      //                 ),
      //                 Visibility(
      //                   visible: lunchPeriod != 'A',
      //                   child: Row(
      //                     children: [
      //                       Expanded(
      //                         child: Padding(
      //                           padding: const EdgeInsets.only(right: 16.0),
      //                           child: TextField(
      //                             controller: _aBlockController,
      //                             focusNode: _aBlockFocusNode,
      //                             decoration: const InputDecoration(
      //                                 labelText: 'A Block Class'
      //                             ),
      //                           ),
      //                         ),
      //                       ),
      //                       Expanded(
      //                         child: TextField(
      //                           controller: _aBlockRoomController,
      //                           focusNode: _aBlockRoomFocusNode,
      //                           decoration: const InputDecoration(
      //                               labelText: 'Room Number'
      //                           ),
      //                         ),
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //                 Visibility(
      //                   visible: lunchPeriod != 'B',
      //                   child: Row(
      //                     children: [
      //                       Expanded(
      //                         child: Padding(
      //                           padding: const EdgeInsets.only(right: 16.0),
      //                           child: TextField(
      //                             controller: _bBlockController,
      //                             focusNode: _bBlockFocusNode,
      //                             decoration: const InputDecoration(
      //                                 labelText: 'B Block Class'
      //                             ),
      //                           ),
      //                         ),
      //                       ),
      //                       Expanded(
      //                         child: TextField(
      //                           controller: _bBlockRoomController,
      //                           focusNode: _bBlockRoomFocusNode,
      //                           decoration: const InputDecoration(
      //                               labelText: 'Room Number'
      //                           ),
      //                         ),
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //                 Visibility(
      //                   visible: lunchPeriod != 'C',
      //                   child: Row(
      //                     children: [
      //                       Expanded(
      //                         child: Padding(
      //                           padding: const EdgeInsets.only(right: 16.0),
      //                           child: TextField(
      //                             controller: _cBlockController,
      //                             focusNode: _cBlockFocusNode,
      //                             decoration: const InputDecoration(
      //                                 labelText: 'C Block Class'
      //                             ),
      //                           ),
      //                         ),
      //                       ),
      //                       Expanded(
      //                         child: TextField(
      //                           controller: _cBlockRoomController,
      //                           focusNode: _cBlockRoomFocusNode,
      //                           decoration: const InputDecoration(
      //                             labelText: 'Room Number',
      //                           ),
      //                         ),
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //                 const Text('For each block, leave the box blank for free periods.',
      //                   style: TextStyle(
      //                     fontStyle: FontStyle.italic,
      //                     fontSize: 12.0,
      //                   ),
      //                 ),
      //               ],
      //             ),
      //           ),
      //           Visibility(
      //             visible: (isFullPeriodClass != true && !isFreePeriod && !hasCBlock()),
      //             child: Column(
      //               mainAxisSize: MainAxisSize.min,
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               mainAxisAlignment: MainAxisAlignment.start,
      //               children: [
      //                 Row(
      //                   children: [
      //                     Expanded(
      //                       child: Padding(
      //                         padding: const EdgeInsets.only(right: 16.0),
      //                         child: TextField(
      //                           controller: _aBlockController,
      //                           focusNode: _aBlockFocusNode,
      //                           decoration: const InputDecoration(
      //                               labelText: 'A Block Class'
      //                           ),
      //                         ),
      //                       ),
      //                     ),
      //                     Expanded(
      //                       child: TextField(
      //                         controller: _aBlockRoomController,
      //                         focusNode: _aBlockRoomFocusNode,
      //                         decoration: const InputDecoration(
      //                             labelText: 'Room Number'
      //                         ),
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //                 Row(
      //                   children: [
      //                     Expanded(
      //                       child: Padding(
      //                         padding: const EdgeInsets.only(right: 16.0),
      //                         child: TextField(
      //                           controller: _bBlockController,
      //                           focusNode: _bBlockFocusNode,
      //                           decoration: const InputDecoration(
      //                               labelText: 'B Block Class'
      //                           ),
      //                         ),
      //                       ),
      //                     ),
      //                     Expanded(
      //                       child: TextField(
      //                         controller: _bBlockRoomController,
      //                         focusNode: _bBlockRoomFocusNode,
      //                         decoration: const InputDecoration(
      //                             labelText: 'Room Number'
      //                         ),
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //                 const SizedBox(
      //                   height: 8.0,
      //                 ),
      //                 const Text('For each block, leave the box blank for free periods.',
      //                   style: TextStyle(
      //                     fontStyle: FontStyle.italic,
      //                     fontSize: 12.0,
      //                   ),
      //                 ),
      //               ],
      //             ),
      //           ),
      //           const SizedBox(
      //             height: 16.0,
      //           ),
      //           Visibility(
      //             visible: ((selectedCampus == Campus.winnetka && periodNumber == 4) || (selectedCampus == Campus.northfield && periodNumber == 5)),
      //             child: Column(
      //               mainAxisSize: MainAxisSize.min,
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [
      //                 const Text('Add Anchor Day Details',
      //                   style: TextStyle(
      //                     color: NewTrierColors.blue,
      //                     fontSize: 16.0,
      //                     fontWeight: FontWeight.bold,
      //                   ),
      //                 ),
      //                 const Text('Anchor Day Lunch Period',
      //                 ),
      //                 Row(
      //                   children: [
      //                     Radio(
      //                         fillColor: MaterialStateProperty.all(NewTrierColors.blue),
      //                         value: 'A',
      //                         groupValue: lunchPeriod,
      //                         onChanged: (String? newValue) {
      //                           setState(() {
      //                             lunchPeriod = newValue;
      //                           });
      //                         }),
      //                     const Text('A'),
      //                     Radio(
      //                         fillColor: MaterialStateProperty.all(NewTrierColors.blue),
      //                         value: 'B',
      //                         groupValue: lunchPeriod,
      //                         onChanged: (String? newValue) {
      //                           setState(() {
      //                             lunchPeriod = newValue;
      //                           });
      //                         }),
      //                     const Text('B'),
      //                     Radio(
      //                         fillColor: MaterialStateProperty.all(NewTrierColors.blue),
      //                         value: 'C',
      //                         groupValue: lunchPeriod,
      //                         onChanged: (String? newValue) {
      //                           setState(() {
      //                             lunchPeriod = newValue;
      //                           });
      //                         }),
      //                     const Text('C'),
      //                   ],
      //                 ),
      //                 const Text('Anchor Day Schedule (Leave Free Period Blank)'),
      //                 Visibility(
      //                   visible: lunchPeriod != 'A',
      //                   child: Row(
      //                     children: [
      //                       Expanded(
      //                         child: Padding(
      //                           padding: const EdgeInsets.only(right: 16.0),
      //                           child: TextField(
      //                             controller: _aAnchorBlockController,
      //                             focusNode: _aAnchorBlockFocusNode,
      //                             decoration: const InputDecoration(
      //                                 labelText: 'A Block Class'
      //                             ),
      //                           ),
      //                         ),
      //                       ),
      //                       Expanded(
      //                         child: TextField(
      //                           controller: _aAnchorRoomController,
      //                           focusNode: _aAnchorBlockRoomFocusNode,
      //                           decoration: const InputDecoration(
      //                               labelText: 'Room Number'
      //                           ),
      //                         ),
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //                 Visibility(
      //                   visible: lunchPeriod != 'B',
      //                   child: Row(
      //                     children: [
      //                       Expanded(
      //                         child: Padding(
      //                           padding: const EdgeInsets.only(right: 16.0),
      //                           child: TextField(
      //                             controller: _bAnchorBlockController,
      //                             focusNode: _bAnchorBlockFocusNode,
      //                             decoration: const InputDecoration(
      //                                 labelText: 'B Block Class'
      //                             ),
      //                           ),
      //                         ),
      //                       ),
      //                       Expanded(
      //                         child: TextField(
      //                           controller: _bAnchorRoomController,
      //                           focusNode: _bAnchorBlockRoomFocusNode,
      //                           decoration: const InputDecoration(
      //                               labelText: 'Room Number'
      //                           ),
      //                         ),
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //                 Visibility(
      //                   visible: lunchPeriod != 'C',
      //                   child: Row(
      //                     children: [
      //                       Expanded(
      //                         child: Padding(
      //                           padding: const EdgeInsets.only(right: 16.0),
      //                           child: TextField(
      //                             controller: _cAnchorBlockController,
      //                             focusNode: _cAnchorBlockFocusNode,
      //                             decoration: const InputDecoration(
      //                                 labelText: 'C Block Class'
      //                             ),
      //                           ),
      //                         ),
      //                       ),
      //                       Expanded(
      //                         child: TextField(
      //                           controller: _cAnchorRoomController,
      //                           focusNode: _cAnchorBlockRoomFocusNode,
      //                           decoration: const InputDecoration(
      //                             labelText: 'Room Number',
      //                           ),
      //                         ),
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //               ],
      //             ),
      //           ),
      //           Center(
      //             child: TextButton(
      //               child: const Text('Save Class'),
      //               onPressed: () async {
      //                 await saveClassData();
      //                 setState(() {
      //                   isFullPeriodClass = true;
      //                   isFreePeriod = false;
      //                   periodNumber += 1;
      //                 });
      //                 if (periodNumber >= 9) {
      //
      //                   // final prefs = await SharedPreferences.getInstance();
      //                   // prefs.getString('1aClass') ?? '';
      //
      //                 //  final studentSchedule = StudentSchedule(oneAClass: prefs.getString('1aClass') ?? '', oneBClass: prefs.getString('1bClass') ?? '', twoAClass: prefs.getString('2aClass') ?? '', twoBClass: prefs.getString('2bClass') ?? '', twoCClass: prefs.getString('2cClass'), threeAClass: prefs.getString('3aClass') ?? '', threeBClass: prefs.getString('3bClass') ?? '', fourAClass: prefs.getString('4aClass') ?? '', fourBClass: prefs.getString('4bClass') ?? '', fiveAClass: prefs.getString('5aClass') ?? '', fiveBClass: prefs.getString('5bClass') ?? '', sixAClass: prefs.getString('6aClass') ?? '', sixBClass: prefs.getString('6bClass') ?? '', sixCClass: prefs.getString('6cClass'), sevenAClass: prefs.getString('7aClass') ?? '', sevenBClass: prefs.getString('7bClass') ?? '', sevenCClass: prefs.getString('7cClass'), eightAClass: prefs.getString('8aClass') ?? '', eightBClass: prefs.getString('8bClass') ?? '', fourAAnchorClass: prefs.getString('1aClass') ?? '', fourBAnchorClass: fourBAnchorClass, fourCAnchorClass: fourCAnchorClass, oneARoom: oneARoom, oneBRoom: oneBRoom, twoARoom: twoARoom, twoBRoom: twoBRoom, threeARoom: threeARoom, threeBRoom: threeBRoom, fourARoom: fourARoom, fourBRoom: fourBRoom, fiveARoom: fiveARoom, fiveBRoom: fiveBRoom, sixARoom: sixARoom, sixBRoom: sixBRoom, sevenARoom: sevenARoom, sevenBRoom: sevenBRoom, eightARoom: eightARoom, eightBRoom: eightBRoom, fourAAnchorRoom: fourAAnchorRoom, fourBAnchorRoom: fourBAnchorRoom, fourCAnchorRoom: fourCAnchorRoom)
      //
      //                   showDialog(context: context, builder: (context) {
      //                     return AlertDialog(
      //                       title: const Text('Finished Entering Class Data',
      //                         style: TextStyle(
      //                           color: NewTrierColors.blue,
      //                         ),
      //                       ),
      //                       content: const Text('You can edit your class details any time by tapping on the profile icon on the home screen'),
      //                       actions: [
      //                         TextButton(
      //                           child: const Text('OK'),
      //                           onPressed: () {
      //                             SharedPreferences.getInstance().then((prefs) => prefs.setBool('hasEnteredScheduleInfo', true));
      //                             Navigator.of(context).pop();
      //                             Navigator.of(context).pop();
      //                           },
      //                         )
      //                       ],
      //                     );
      //                   });
      //                 }
      //               },
      //             ),
      //           )
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}

class BlueDayScheduleEntry extends StatefulWidget {
  final Campus campus;
  final Function onComplete;
  const BlueDayScheduleEntry({Key? key, required this.campus, required this.onComplete}) : super(key: key);

  @override
  State<BlueDayScheduleEntry> createState() => _BlueDayScheduleEntryState();
}

class _BlueDayScheduleEntryState extends State<BlueDayScheduleEntry> {

  final TextEditingController _1aClassController = TextEditingController();
  final TextEditingController _1aRoomController = TextEditingController();
  final TextEditingController _1bClassController = TextEditingController();
  final TextEditingController _1bRoomController = TextEditingController();
  final TextEditingController _2aClassController = TextEditingController();
  final TextEditingController _2aRoomController = TextEditingController();
  final TextEditingController _2bClassController = TextEditingController();
  final TextEditingController _2bRoomController = TextEditingController();
  final TextEditingController _2cClassController = TextEditingController();
  final TextEditingController _2cRoomController = TextEditingController();
  final TextEditingController _3aClassController = TextEditingController();
  final TextEditingController _3aRoomController = TextEditingController();
  final TextEditingController _3bClassController = TextEditingController();
  final TextEditingController _3bRoomController = TextEditingController();
  final TextEditingController _4aClassController = TextEditingController();
  final TextEditingController _4aRoomController = TextEditingController();
  final TextEditingController _4bClassController = TextEditingController();
  final TextEditingController _4bRoomController = TextEditingController();
  final FocusNode _1aClassFocusNode = FocusNode();
  final FocusNode _1aRoomFocusNode = FocusNode();
  final FocusNode _1bClassFocusNode = FocusNode();
  final FocusNode _1bRoomFocusNode = FocusNode();
  final FocusNode _2aClassFocusNode = FocusNode();
  final FocusNode _2aRoomFocusNode = FocusNode();
  final FocusNode _2bClassFocusNode = FocusNode();
  final FocusNode _2bRoomFocusNode = FocusNode();
  final FocusNode _2cClassFocusNode = FocusNode();
  final FocusNode _2cRoomFocusNode = FocusNode();
  final FocusNode _3aClassFocusNode = FocusNode();
  final FocusNode _3aRoomFocusNode = FocusNode();
  final FocusNode _3bClassFocusNode = FocusNode();
  final FocusNode _3bRoomFocusNode = FocusNode();
  final FocusNode _4aClassFocusNode = FocusNode();
  final FocusNode _4aRoomFocusNode = FocusNode();
  final FocusNode _4bClassFocusNode = FocusNode();
  final FocusNode _4bRoomFocusNode = FocusNode();

  bool hasLoaded = false;

  Future<void> saveClassData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('${periodNumbers[0]}Class', _1aClassController.text);
    prefs.setString('${periodNumbers[1]}Class', _1bClassController.text);
    prefs.setString('${periodNumbers[2]}Class', _2aClassController.text);
    prefs.setString('${periodNumbers[3]}Class', _2bClassController.text);
    prefs.setString('${periodNumbers[4]}Class', _2cClassController.text);
    prefs.setString('${periodNumbers[5]}Class', _3aClassController.text);
    prefs.setString('${periodNumbers[6]}Class', _3bClassController.text);
    prefs.setString('${periodNumbers[7]}Class', _4aClassController.text);
    prefs.setString('${periodNumbers[8]}Class', _4bClassController.text);

    prefs.setString('${periodNumbers[0]}Room', _1aRoomController.text);
    prefs.setString('${periodNumbers[1]}Room', _1bRoomController.text);
    prefs.setString('${periodNumbers[2]}Room', _2aRoomController.text);
    prefs.setString('${periodNumbers[3]}Room', _2bRoomController.text);
    prefs.setString('${periodNumbers[4]}Room', _2cRoomController.text);
    prefs.setString('${periodNumbers[5]}Room', _3aRoomController.text);
    prefs.setString('${periodNumbers[6]}Room', _3bRoomController.text);
    prefs.setString('${periodNumbers[7]}Room', _4aRoomController.text);
    prefs.setString('${periodNumbers[8]}Room', _4bRoomController.text);
  }

  List<String> periodNumbers = [
    '1A',
    '1B',
    '2A',
    '2B',
    '2C',
    '3A',
    '3B',
    '4A',
    '4B'
  ];

  updatePeriodNumbers() {
    if (widget.campus == Campus.winnetka) {
      periodNumbers = [
        '1A',
        '1B',
        '2A',
        '2B',
        '2C',
        '3A',
        '3B',
        '4A',
        '4B'
      ];
    } else {
      periodNumbers = [
        '1A',
        '1B',
        '2A',
        '2B',
        '3A',
        '3B',
        '3C',
        '4A',
        '4B'
      ];
    }
  }

  showCopyToBBlockPrompt(TextEditingController aClassController, TextEditingController bClassController, TextEditingController aRoomController, TextEditingController bRoomController) {
    showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: const Text('Would you like to copy this class info to the B Block?',
          style: TextStyle(
            color: NewTrierColors.blue,
          ),),
        content: const Text('If this is a full period class, choose \'Yes\' and we\'ll copy the class info to B block for you.'),
        actions: [
          TextButton(
            child: const Text('YES'),
            onPressed: () {
              bClassController.text = aClassController.text;
              bRoomController.text = aRoomController.text;
              FocusScope.of(context).unfocus();
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text('NO'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      );
    });
  }

  showLunchCopyPrompt(TextEditingController aClassController, TextEditingController bClassController, TextEditingController aRoomController, TextEditingController bRoomController, TextEditingController cClassController, TextEditingController cRoomController) {
    showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: const Text('What is your lunch period?',
          style: TextStyle(
            color: NewTrierColors.blue,
          ),),
        content: const Text('Tell us which lunch you have and we\'ll do our best to fill in the rest of the information for this period.'),
        actions: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    child: const Text('A Lunch'),
                    onPressed: () {
                      aClassController.text = 'Lunch';
                      FocusScope.of(context).unfocus();
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: const Text('B Lunch'),
                    onPressed: () {
                      cClassController.text = aClassController.text;
                      cRoomController.text = aRoomController.text;
                      bClassController.text = 'Lunch';
                      FocusScope.of(context).unfocus();
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: const Text('C Lunch'),
                    onPressed: () {
                      cClassController.text = 'Lunch';
                      bClassController.text = aClassController.text;
                      bRoomController.text = aRoomController.text;
                      FocusScope.of(context).unfocus();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
              TextButton(
                child: const Text('Cancel'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    updatePeriodNumbers();
    return FutureBuilder(
      future: SharedPreferences.getInstance(),
      builder: (BuildContext context, AsyncSnapshot<SharedPreferences> snapshot) {
        if (snapshot.hasData) {
          if (!hasLoaded) {
            String oneAClass = snapshot.data?.getString('1AClass') ?? '';
            if (_1aClassController.text == '') {
              _1aClassController.text = oneAClass;
            }

            String oneARoom = snapshot.data?.getString('1ARoom') ?? '';
            if (_1aRoomController.text == '') {
              _1aRoomController.text = oneARoom;
            }

            String oneBClass = snapshot.data?.getString('1BClass') ?? '';
            if (_1bClassController.text == '') {
              _1bClassController.text = oneBClass;
            }

            String oneBRoom = snapshot.data?.getString('1BRoom') ?? '';
            if (_1bRoomController.text == '') {
              _1bRoomController.text = oneBRoom;
            }


            String twoAClass = snapshot.data?.getString('2AClass') ?? '';
            if (_2aClassController.text == '') {
              _2aClassController.text = twoAClass;
            }

            String twoARoom = snapshot.data?.getString('2ARoom') ?? '';
            if (_2aRoomController.text == '') {
              _2aRoomController.text = twoARoom;
            }


            String twoBClass = snapshot.data?.getString('2BClass') ?? '';
            if (_2bClassController.text == '') {
              _2bClassController.text = twoBClass;
            }

            String twoBRoom = snapshot.data?.getString('2BRoom') ?? '';
            if (_2bRoomController.text == '') {
              _2bRoomController.text = twoBRoom;
            }

            String twoCClass = '';
            String threeAClass = '';
            String threeBClass = '';

            String twoCRoom = '';
            String threeARoom = '';
            String threeBRoom = '';

            if (widget.campus == Campus.winnetka) {
              twoCClass = snapshot.data?.getString('2CClass') ?? '';
              if (_2cClassController.text == '') {
                _2cClassController.text = twoCClass;
              }

              twoCRoom = snapshot.data?.getString('2CRoom') ?? '';
              if (_2cRoomController.text == '') {
                _2cRoomController.text = twoCRoom;
              }


              threeAClass = snapshot.data?.getString('3AClass') ?? '';
              if (_3aClassController.text == '') {
                _3aClassController.text = threeAClass;
              }

              threeARoom = snapshot.data?.getString('3ARoom') ?? '';
              if (_3aRoomController.text == '') {
                _3aRoomController.text = threeARoom;
              }


              threeBClass = snapshot.data?.getString('3BClass') ?? '';
              if (_3bClassController.text == '') {
                _3bClassController.text = threeBClass;
              }

              threeBRoom = snapshot.data?.getString('3BRoom') ?? '';
              if (_3bRoomController.text == '') {
                _3bRoomController.text = threeBRoom;
              }
            } else {
              threeAClass = snapshot.data?.getString('3AClass') ?? '';
              if (_2cClassController.text == '') {
                _2cClassController.text = threeAClass;
              }

              threeARoom = snapshot.data?.getString('3ARoom') ?? '';
              if (_2cRoomController.text == '') {
                _2cRoomController.text = threeARoom;
              }


              threeBClass = snapshot.data?.getString('3BClass') ?? '';
              if (_3aClassController.text == '') {
                _3aClassController.text = threeBClass;
              }

              threeBRoom = snapshot.data?.getString('3BRoom') ?? '';
              if (_3aRoomController.text == '') {
                _3aRoomController.text = threeBRoom;
              }

              String threeCClass = snapshot.data?.getString('3CClass') ?? '';
              if (_3bClassController.text == '') {
                _3bClassController.text = threeCClass;
              }

              String threeCRoom = snapshot.data?.getString('3CRoom') ?? '';
              if (_3bRoomController.text == '') {
                _3bRoomController.text = threeCRoom;
              }
            }

            String fourAClass = snapshot.data?.getString('4AClass') ?? '';
            if (_4aClassController.text == '') {
              _4aClassController.text = fourAClass;
            }

            String fourARoom = snapshot.data?.getString('4ARoom') ?? '';
            if (_4aRoomController.text == '') {
              _4aRoomController.text = fourARoom;
            }


            String fourBClass = snapshot.data?.getString('4BClass') ?? '';
            if (_4bClassController.text == '') {
              _4bClassController.text = fourBClass;
            }

            String fourBRoom = snapshot.data?.getString('4BRoom') ?? '';
            if (_4bRoomController.text == '') {
              _4bRoomController.text = fourBRoom;
            }
            hasLoaded = true;
          }

          return Column(
            children: [
              const Text('Blue Day Schedule',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: NewTrierColors.blue,
                  fontSize: 18.0,
                ),
              ),
              const Text('Leave free periods blank.',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                ),
              ),
              Table(
                defaultVerticalAlignment: TableCellVerticalAlignment
                    .middle,
                border: TableBorder.all(color: NewTrierColors.blue),
                columnWidths: const <int, TableColumnWidth>{
                  0: IntrinsicColumnWidth(),
                  1: FlexColumnWidth(2),
                  2: FlexColumnWidth(1)
                },
                children: [
                  TableRow(
                      children: [
                        BlueDayScheduleEntryPeriodText(periodName: periodNumbers[0]),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0.0),
                          child: TextField(
                            controller: _1aClassController,
                            focusNode: _1aClassFocusNode,
                            textCapitalization: TextCapitalization.words,
                            textInputAction: TextInputAction.next,
                            decoration: const InputDecoration(
                              focusedBorder: InputBorder.none,
                              border: InputBorder.none,
                              labelText: 'Class Name',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0.0),
                          child: TextField(
                            controller: _1aRoomController,
                            focusNode: _1aRoomFocusNode,
                            textCapitalization: TextCapitalization.words,
                            onEditingComplete: () {
                              showCopyToBBlockPrompt(_1aClassController, _1bClassController, _1aRoomController, _1bRoomController);
                            },
                            textInputAction: TextInputAction.next,
                            decoration: const InputDecoration(
                              focusedBorder: InputBorder.none,
                              border: InputBorder.none,
                              labelText: 'Room #',
                            ),
                          ),
                        ),
                      ]
                  ),
                  TableRow(
                      children: [
                        BlueDayScheduleEntryPeriodText(periodName: periodNumbers[1]),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0.0),
                          child: TextField(
                            controller: _1bClassController,
                            focusNode: _1bClassFocusNode,
                            textCapitalization: TextCapitalization.words,
                            textInputAction: TextInputAction.next,
                            decoration: const InputDecoration(
                              focusedBorder: InputBorder.none,
                              border: InputBorder.none,
                              labelText: 'Class Name',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0.0),
                          child: TextField(
                            controller: _1bRoomController,
                            focusNode: _1bRoomFocusNode,
                            textCapitalization: TextCapitalization.words,
                            textInputAction: TextInputAction.next,
                            decoration: const InputDecoration(
                              focusedBorder: InputBorder.none,
                              border: InputBorder.none,
                              labelText: 'Room #',
                            ),
                          ),
                        ),
                      ]
                  ),
                  TableRow(
                      children: [
                        BlueDayScheduleEntryPeriodText(periodName:  periodNumbers[2]),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0.0),
                          child: TextField(
                            controller: _2aClassController,
                            focusNode: _2aClassFocusNode,
                            textCapitalization: TextCapitalization.words,
                            textInputAction: TextInputAction.next,
                            decoration: const InputDecoration(
                              focusedBorder: InputBorder.none,
                              border: InputBorder.none,
                              labelText: 'Class Name',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0.0),
                          child: TextField(
                            controller: _2aRoomController,
                            focusNode: _2aRoomFocusNode,
                            textInputAction: TextInputAction.next,
                            textCapitalization: TextCapitalization.words,
                            onEditingComplete: () {
                              if (widget.campus == Campus.winnetka) {
                                //Show lunch controller
                                showLunchCopyPrompt(_2aClassController, _2bClassController, _2aRoomController, _2bRoomController, _2cClassController, _2cRoomController);
                              } else {
                                showCopyToBBlockPrompt(_2aClassController, _2bClassController, _2aRoomController, _2bRoomController);
                              }
                            },
                            decoration: const InputDecoration(
                              focusedBorder: InputBorder.none,
                              border: InputBorder.none,
                              labelText: 'Room #',
                            ),
                          ),
                        ),
                      ]
                  ),
                  TableRow(
                      children: [
                        BlueDayScheduleEntryPeriodText(periodName:  periodNumbers[3]),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0.0),
                          child: TextField(
                            controller: _2bClassController,
                            focusNode: _2bClassFocusNode,
                            textCapitalization: TextCapitalization.words,
                            textInputAction: TextInputAction.next,
                            decoration: const InputDecoration(
                              focusedBorder: InputBorder.none,
                              border: InputBorder.none,
                              labelText: 'Class Name',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0.0),
                          child: TextField(
                            controller: _2bRoomController,
                            focusNode: _2bRoomFocusNode,
                            textCapitalization: TextCapitalization.words,
                            textInputAction: TextInputAction.next,
                            decoration: const InputDecoration(
                              focusedBorder: InputBorder.none,
                              border: InputBorder.none,
                              labelText: 'Room #',
                            ),
                          ),
                        ),
                      ]
                  ),
                  TableRow(
                      children: [
                        BlueDayScheduleEntryPeriodText(periodName:  periodNumbers[4]),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0.0),
                          child: TextField(
                            controller: _2cClassController,
                            focusNode: _2cClassFocusNode,
                            textCapitalization: TextCapitalization.words,
                            textInputAction: TextInputAction.next,
                            decoration: const InputDecoration(
                              focusedBorder: InputBorder.none,
                              border: InputBorder.none,
                              labelText: 'Class Name',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0.0),
                          child: TextField(
                            controller: _2cRoomController,
                            focusNode: _2cRoomFocusNode,
                            textCapitalization: TextCapitalization.words,
                            textInputAction: TextInputAction.next,
                            onEditingComplete: () {
                              if (widget.campus == Campus.northfield) {
                                showLunchCopyPrompt(_2cClassController, _3aClassController, _2cRoomController, _3aRoomController, _3bClassController, _3bRoomController);
                              } else {
                                _2cRoomFocusNode.nextFocus();
                              }
                            },
                            decoration: const InputDecoration(
                              focusedBorder: InputBorder.none,
                              border: InputBorder.none,
                              labelText: 'Room #',
                            ),
                          ),
                        ),
                      ]
                  ),
                  TableRow(
                      children: [
                        BlueDayScheduleEntryPeriodText(periodName:  periodNumbers[5]),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0.0),
                          child: TextField(
                            controller: _3aClassController,
                            focusNode: _3aClassFocusNode,
                            textCapitalization: TextCapitalization.words,
                            textInputAction: TextInputAction.next,
                            decoration: const InputDecoration(
                              focusedBorder: InputBorder.none,
                              border: InputBorder.none,
                              labelText: 'Class Name',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0.0),
                          child: TextField(
                            controller: _3aRoomController,
                            focusNode: _3aRoomFocusNode,
                            textCapitalization: TextCapitalization.words,
                            textInputAction: TextInputAction.next,
                            onEditingComplete: () {
                              if (widget.campus == Campus.winnetka) {
                                showCopyToBBlockPrompt(_3aClassController, _3bClassController, _3aRoomController, _3bRoomController);
                              } else {
                                //Do nothing because it's not an A block at Northfield.

                              }
                            },
                            decoration: const InputDecoration(
                              focusedBorder: InputBorder.none,
                              border: InputBorder.none,
                              labelText: 'Room #',
                            ),
                          ),
                        ),
                      ]
                  ),
                  TableRow(
                      children: [
                        BlueDayScheduleEntryPeriodText(periodName:  periodNumbers[6]),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0.0),
                          child: TextField(
                            controller: _3bClassController,
                            focusNode: _3bClassFocusNode,
                            textCapitalization: TextCapitalization.words,
                            textInputAction: TextInputAction.next,
                            decoration: const InputDecoration(
                              focusedBorder: InputBorder.none,
                              border: InputBorder.none,
                              labelText: 'Class Name',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0.0),
                          child: TextField(
                            controller: _3bRoomController,
                            focusNode: _3bRoomFocusNode,
                            textCapitalization: TextCapitalization.words,
                            textInputAction: TextInputAction.next,
                            decoration: const InputDecoration(
                              focusedBorder: InputBorder.none,
                              border: InputBorder.none,
                              labelText: 'Room #',
                            ),
                          ),
                        ),
                      ]
                  ),
                  TableRow(
                      children: [
                        BlueDayScheduleEntryPeriodText(periodName:  periodNumbers[7]),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0.0),
                          child: TextField(
                            controller: _4aClassController,
                            focusNode: _4aClassFocusNode,
                            textCapitalization: TextCapitalization.words,
                            textInputAction: TextInputAction.next,
                            decoration: const InputDecoration(
                              focusedBorder: InputBorder.none,
                              border: InputBorder.none,
                              labelText: 'Class Name',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0.0),
                          child: TextField(
                            controller: _4aRoomController,
                            focusNode: _4aRoomFocusNode,
                            textCapitalization: TextCapitalization.words,
                            textInputAction: TextInputAction.next,
                            onEditingComplete: () {
                              showCopyToBBlockPrompt(_4aClassController, _4bClassController, _4aRoomController, _4bRoomController);
                            },
                            decoration: const InputDecoration(
                              focusedBorder: InputBorder.none,
                              border: InputBorder.none,
                              labelText: 'Room #',
                            ),
                          ),
                        ),
                      ]
                  ),
                  TableRow(
                      children: [
                        BlueDayScheduleEntryPeriodText(periodName: periodNumbers[8]),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0.0),
                          child: TextField(
                            controller: _4bClassController,
                            focusNode: _4bClassFocusNode,
                            textCapitalization: TextCapitalization.words,
                            textInputAction: TextInputAction.next,
                            decoration: const InputDecoration(
                              focusedBorder: InputBorder.none,
                              border: InputBorder.none,
                              labelText: 'Class Name',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0.0),
                          child: TextField(
                            controller: _4bRoomController,
                            focusNode: _4bRoomFocusNode,
                            textCapitalization: TextCapitalization.words,
                            textInputAction: TextInputAction.done,
                            decoration: const InputDecoration(
                              focusedBorder: InputBorder.none,
                              border: InputBorder.none,
                              labelText: 'Room #',
                            ),
                          ),
                        ),
                      ]
                  ),
                ],
              ),
              const SizedBox(height: 12.0,),
              Center(
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(NewTrierColors.blue),
                  ),
                  child: const Text('Save Blue Day Schedule',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () async {
                    await saveClassData();
                    widget.onComplete();
                  },
                ),
              ),
            ],
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}

class GreenDayScheduleEntry extends StatefulWidget {
  final Campus campus;
  final Function onComplete;
  const GreenDayScheduleEntry({Key? key, required this.campus, required this.onComplete}) : super(key: key);

  @override
  State<GreenDayScheduleEntry> createState() => _GreenDayScheduleEntryState();
}

class _GreenDayScheduleEntryState extends State<GreenDayScheduleEntry> {

  final TextEditingController _1aClassController = TextEditingController();
  final TextEditingController _1aRoomController = TextEditingController();
  final TextEditingController _1bClassController = TextEditingController();
  final TextEditingController _1bRoomController = TextEditingController();
  final TextEditingController _2aClassController = TextEditingController();
  final TextEditingController _2aRoomController = TextEditingController();
  final TextEditingController _2bClassController = TextEditingController();
  final TextEditingController _2bRoomController = TextEditingController();
  final TextEditingController _2cClassController = TextEditingController();
  final TextEditingController _2cRoomController = TextEditingController();
  final TextEditingController _3aClassController = TextEditingController();
  final TextEditingController _3aRoomController = TextEditingController();
  final TextEditingController _3bClassController = TextEditingController();
  final TextEditingController _3bRoomController = TextEditingController();
  final TextEditingController _4aClassController = TextEditingController();
  final TextEditingController _4aRoomController = TextEditingController();
  final TextEditingController _4bClassController = TextEditingController();
  final TextEditingController _4bRoomController = TextEditingController();
  final FocusNode _1aClassFocusNode = FocusNode();
  final FocusNode _1aRoomFocusNode = FocusNode();
  final FocusNode _1bClassFocusNode = FocusNode();
  final FocusNode _1bRoomFocusNode = FocusNode();
  final FocusNode _2aClassFocusNode = FocusNode();
  final FocusNode _2aRoomFocusNode = FocusNode();
  final FocusNode _2bClassFocusNode = FocusNode();
  final FocusNode _2bRoomFocusNode = FocusNode();
  final FocusNode _2cClassFocusNode = FocusNode();
  final FocusNode _2cRoomFocusNode = FocusNode();
  final FocusNode _3aClassFocusNode = FocusNode();
  final FocusNode _3aRoomFocusNode = FocusNode();
  final FocusNode _3bClassFocusNode = FocusNode();
  final FocusNode _3bRoomFocusNode = FocusNode();
  final FocusNode _4aClassFocusNode = FocusNode();
  final FocusNode _4aRoomFocusNode = FocusNode();
  final FocusNode _4bClassFocusNode = FocusNode();
  final FocusNode _4bRoomFocusNode = FocusNode();

  bool hasLoaded = false;



  Future<void> saveClassData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('${periodNumbers[0]}Class', _1aClassController.text);
    prefs.setString('${periodNumbers[1]}Class', _1bClassController.text);
    prefs.setString('${periodNumbers[2]}Class', _2aClassController.text);
    prefs.setString('${periodNumbers[3]}Class', _2bClassController.text);
    prefs.setString('${periodNumbers[4]}Class', _2cClassController.text);
    prefs.setString('${periodNumbers[5]}Class', _3aClassController.text);
    prefs.setString('${periodNumbers[6]}Class', _3bClassController.text);
    prefs.setString('${periodNumbers[7]}Class', _4aClassController.text);
    prefs.setString('${periodNumbers[8]}Class', _4bClassController.text);

    prefs.setString('${periodNumbers[0]}Room', _1aRoomController.text);
    prefs.setString('${periodNumbers[1]}Room', _1bRoomController.text);
    prefs.setString('${periodNumbers[2]}Room', _2aRoomController.text);
    prefs.setString('${periodNumbers[3]}Room', _2bRoomController.text);
    prefs.setString('${periodNumbers[4]}Room', _2cRoomController.text);
    prefs.setString('${periodNumbers[5]}Room', _3aRoomController.text);
    prefs.setString('${periodNumbers[6]}Room', _3bRoomController.text);
    prefs.setString('${periodNumbers[7]}Room', _4aRoomController.text);
    prefs.setString('${periodNumbers[8]}Room', _4bRoomController.text);
  }

  List<String> periodNumbers = [
    '5A',
    '5B',
    '6A',
    '6B',
    '6C',
    '7A',
    '7B',
    '8A',
    '8B'
  ];

  updatePeriodNumbers() {
    if (widget.campus == Campus.winnetka) {
      periodNumbers = [
        '5A',
        '5B',
        '6A',
        '6B',
        '6C',
        '7A',
        '7B',
        '8A',
        '8B'
      ];
    } else {
      periodNumbers = [
        '5A',
        '5B',
        '6A',
        '6B',
        '7A',
        '7B',
        '7C',
        '8A',
        '8B'
      ];
    }
  }

  showCopyToBBlockPrompt(TextEditingController aClassController, TextEditingController bClassController, TextEditingController aRoomController, TextEditingController bRoomController) {
    showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: const Text('Would you like to copy this class info to the B Block?',
          style: TextStyle(
            color: NewTrierColors.blue,
          ),),
        content: const Text('If this is a full period class, choose \'Yes\' and we\'ll copy the class info to B block for you.'),
        actions: [
          TextButton(
            child: const Text('YES'),
            onPressed: () {
              bClassController.text = aClassController.text;
              bRoomController.text = aRoomController.text;
              FocusScope.of(context).unfocus();
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text('NO'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      );
    });
  }

  showLunchCopyPrompt(TextEditingController aClassController, TextEditingController bClassController, TextEditingController aRoomController, TextEditingController bRoomController, TextEditingController cClassController, TextEditingController cRoomController) {
    showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: const Text('What is your lunch period?',
          style: TextStyle(
            color: NewTrierColors.blue,
          ),),
        content: const Text('Tell us which lunch you have and we\'ll do our best to fill in the rest of the information for this period.'),
        actions: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    child: const Text('A Lunch'),
                    onPressed: () {
                      aClassController.text = 'Lunch';
                      FocusScope.of(context).unfocus();
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: const Text('B Lunch'),
                    onPressed: () {
                      cClassController.text = aClassController.text;
                      cRoomController.text = aRoomController.text;
                      bClassController.text = 'Lunch';
                      FocusScope.of(context).unfocus();
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: const Text('C Lunch'),
                    onPressed: () {
                      cClassController.text = 'Lunch';
                      bClassController.text = aClassController.text;
                      bRoomController.text = aRoomController.text;
                      FocusScope.of(context).unfocus();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
              TextButton(
                child: const Text('Cancel'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        ],
      );
    });
  }


  @override
  Widget build(BuildContext context) {
    updatePeriodNumbers();
    return FutureBuilder(
        future: SharedPreferences.getInstance(),
        builder: (BuildContext context, AsyncSnapshot<SharedPreferences> snapshot) {
          if (snapshot.hasData) {
            if (!hasLoaded) {
              String oneAClass = snapshot.data?.getString('5AClass') ?? '';
              if (_1aClassController.text == '') {
                _1aClassController.text = oneAClass;
              }

              String oneARoom = snapshot.data?.getString('5ARoom') ?? '';
              if (_1aRoomController.text == '') {
                _1aRoomController.text = oneARoom;
              }

              String oneBClass = snapshot.data?.getString('5BClass') ?? '';
              if (_1bClassController.text == '') {
                _1bClassController.text = oneBClass;
              }

              String oneBRoom = snapshot.data?.getString('5BRoom') ?? '';
              if (_1bRoomController.text == '') {
                _1bRoomController.text = oneBRoom;
              }


              String twoAClass = snapshot.data?.getString('6AClass') ?? '';
              if (_2aClassController.text == '') {
                _2aClassController.text = twoAClass;
              }

              String twoARoom = snapshot.data?.getString('6ARoom') ?? '';
              if (_2aRoomController.text == '') {
                _2aRoomController.text = twoARoom;
              }


              String twoBClass = snapshot.data?.getString('6BClass') ?? '';
              if (_2bClassController.text == '') {
                _2bClassController.text = twoBClass;
              }

              String twoBRoom = snapshot.data?.getString('6BRoom') ?? '';
              if (_2bRoomController.text == '') {
                _2bRoomController.text = twoBRoom;
              }

              String twoCClass = '';
              String threeAClass = '';
              String threeBClass = '';

              String twoCRoom = '';
              String threeARoom = '';
              String threeBRoom = '';

              if (widget.campus == Campus.winnetka) {
                twoCClass = snapshot.data?.getString('6CClass') ?? '';
                if (_2cClassController.text == '') {
                  _2cClassController.text = twoCClass;
                }

                twoCRoom = snapshot.data?.getString('6CRoom') ?? '';
                if (_2cRoomController.text == '') {
                  _2cRoomController.text = twoCRoom;
                }


                threeAClass = snapshot.data?.getString('7AClass') ?? '';
                if (_3aClassController.text == '') {
                  _3aClassController.text = threeAClass;
                }

                threeARoom = snapshot.data?.getString('7ARoom') ?? '';
                if (_3aRoomController.text == '') {
                  _3aRoomController.text = threeARoom;
                }


                threeBClass = snapshot.data?.getString('7BClass') ?? '';
                if (_3bClassController.text == '') {
                  _3bClassController.text = threeBClass;
                }

                threeBRoom = snapshot.data?.getString('7BRoom') ?? '';
                if (_3bRoomController.text == '') {
                  _3bRoomController.text = threeBRoom;
                }
              } else {
                threeAClass = snapshot.data?.getString('7AClass') ?? '';
                if (_2cClassController.text == '') {
                  _2cClassController.text = threeAClass;
                }

                threeARoom = snapshot.data?.getString('7ARoom') ?? '';
                if (_2cRoomController.text == '') {
                  _2cRoomController.text = threeARoom;
                }


                threeBClass = snapshot.data?.getString('7BClass') ?? '';
                if (_3aClassController.text == '') {
                  _3aClassController.text = threeBClass;
                }

                threeBRoom = snapshot.data?.getString('7BRoom') ?? '';
                if (_3aRoomController.text == '') {
                  _3aRoomController.text = threeBRoom;
                }

                String threeCClass = snapshot.data?.getString('7CClass') ?? '';
                if (_3bClassController.text == '') {
                  _3bClassController.text = threeCClass;
                }

                String threeCRoom = snapshot.data?.getString('7CRoom') ?? '';
                if (_3bRoomController.text == '') {
                  _3bRoomController.text = threeCRoom;
                }
              }

              String fourAClass = snapshot.data?.getString('8AClass') ?? '';
              if (_4aClassController.text == '') {
                _4aClassController.text = fourAClass;
              }

              String fourARoom = snapshot.data?.getString('8ARoom') ?? '';
              if (_4aRoomController.text == '') {
                _4aRoomController.text = fourARoom;
              }


              String fourBClass = snapshot.data?.getString('8BClass') ?? '';
              if (_4bClassController.text == '') {
                _4bClassController.text = fourBClass;
              }

              String fourBRoom = snapshot.data?.getString('8BRoom') ?? '';
              if (_4bRoomController.text == '') {
                _4bRoomController.text = fourBRoom;
              }
              hasLoaded = true;
            }

            return Column(
              children: [
                const Text('Green Day Schedule',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: NewTrierColors.green,
                    fontSize: 18.0,
                  ),
                ),
                const Text('Leave free periods blank.',
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                  ),
                ),
                Table(
                  defaultVerticalAlignment: TableCellVerticalAlignment
                      .middle,
                  border: TableBorder.all(color: NewTrierColors.green),
                  columnWidths: const <int, TableColumnWidth>{
                    0: IntrinsicColumnWidth(),
                    1: FlexColumnWidth(2),
                    2: FlexColumnWidth(1)
                  },
                  children: [
                    TableRow(
                        children: [
                          GreenDayScheduleEntryPeriodText(
                              periodName: periodNumbers[0]),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 0.0),
                            child: TextField(
                              controller: _1aClassController,
                              focusNode: _1aClassFocusNode,
                              textCapitalization: TextCapitalization.words,
                              textInputAction: TextInputAction.next,
                              decoration: const InputDecoration(
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none,
                                labelText: 'Class Name',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 0.0),
                            child: TextField(
                              controller: _1aRoomController,
                              focusNode: _1aRoomFocusNode,
                              textCapitalization: TextCapitalization.words,
                              textInputAction: TextInputAction.next,
                              onEditingComplete: () {
                                showCopyToBBlockPrompt(
                                    _1aClassController, _1bClassController,
                                    _1aRoomController, _1bRoomController);
                              },
                              decoration: const InputDecoration(
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none,
                                labelText: 'Room #',
                              ),
                            ),
                          ),
                        ]
                    ),
                    TableRow(
                        children: [
                          GreenDayScheduleEntryPeriodText(
                              periodName: periodNumbers[1]),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 0.0),
                            child: TextField(
                              controller: _1bClassController,
                              focusNode: _1bClassFocusNode,
                              textCapitalization: TextCapitalization.words,
                              textInputAction: TextInputAction.next,
                              decoration: const InputDecoration(
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none,
                                labelText: 'Class Name',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 0.0),
                            child: TextField(
                              controller: _1bRoomController,
                              focusNode: _1bRoomFocusNode,
                              textCapitalization: TextCapitalization.words,
                              textInputAction: TextInputAction.next,
                              decoration: const InputDecoration(
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none,
                                labelText: 'Room #',
                              ),
                            ),
                          ),
                        ]
                    ),
                    TableRow(
                        children: [
                          GreenDayScheduleEntryPeriodText(
                              periodName: periodNumbers[2]),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 0.0),
                            child: TextField(
                              controller: _2aClassController,
                              focusNode: _2aClassFocusNode,
                              textCapitalization: TextCapitalization.words,
                              textInputAction: TextInputAction.next,
                              decoration: const InputDecoration(
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none,
                                labelText: 'Class Name',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 0.0),
                            child: TextField(
                              controller: _2aRoomController,
                              focusNode: _2aRoomFocusNode,
                              textCapitalization: TextCapitalization.words,
                              textInputAction: TextInputAction.next,
                              onEditingComplete: () {
                                if (widget.campus == Campus.winnetka) {
                                  //Show lunch controller
                                  showLunchCopyPrompt(
                                      _2aClassController, _2bClassController,
                                      _2aRoomController, _2bRoomController,
                                      _2cClassController, _2cRoomController);
                                } else {
                                  showCopyToBBlockPrompt(
                                      _2aClassController, _2bClassController,
                                      _2aRoomController, _2bRoomController);
                                }
                              },
                              decoration: const InputDecoration(
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none,
                                labelText: 'Room #',
                              ),
                            ),
                          ),
                        ]
                    ),
                    TableRow(
                        children: [
                          GreenDayScheduleEntryPeriodText(
                              periodName: periodNumbers[3]),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 0.0),
                            child: TextField(
                              controller: _2bClassController,
                              focusNode: _2bClassFocusNode,
                              textCapitalization: TextCapitalization.words,
                              textInputAction: TextInputAction.next,
                              decoration: const InputDecoration(
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none,
                                labelText: 'Class Name',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 0.0),
                            child: TextField(
                              controller: _2bRoomController,
                              focusNode: _2bRoomFocusNode,
                              textCapitalization: TextCapitalization.words,
                              textInputAction: TextInputAction.next,
                              decoration: const InputDecoration(
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none,
                                labelText: 'Room #',
                              ),
                            ),
                          ),
                        ]
                    ),
                    TableRow(
                        children: [
                          GreenDayScheduleEntryPeriodText(
                              periodName: periodNumbers[4]),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 0.0),
                            child: TextField(
                              controller: _2cClassController,
                              focusNode: _2cClassFocusNode,
                              textCapitalization: TextCapitalization.words,
                              textInputAction: TextInputAction.next,
                              decoration: const InputDecoration(
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none,
                                labelText: 'Class Name',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 0.0),
                            child: TextField(
                              controller: _2cRoomController,
                              focusNode: _2cRoomFocusNode,
                              textCapitalization: TextCapitalization.words,
                              textInputAction: TextInputAction.next,
                              onEditingComplete: () {
                                if (widget.campus == Campus.northfield) {
                                  showLunchCopyPrompt(
                                      _2cClassController, _3aClassController,
                                      _2cRoomController, _3aRoomController,
                                      _3bClassController, _3bRoomController);
                                }
                              },
                              decoration: const InputDecoration(
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none,
                                labelText: 'Room #',
                              ),
                            ),
                          ),
                        ]
                    ),
                    TableRow(
                        children: [
                          GreenDayScheduleEntryPeriodText(
                              periodName: periodNumbers[5]),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 0.0),
                            child: TextField(
                              controller: _3aClassController,
                              focusNode: _3aClassFocusNode,
                              textCapitalization: TextCapitalization.words,
                              textInputAction: TextInputAction.next,
                              decoration: const InputDecoration(
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none,
                                labelText: 'Class Name',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 0.0),
                            child: TextField(
                              controller: _3aRoomController,
                              focusNode: _3aRoomFocusNode,
                              textCapitalization: TextCapitalization.words,
                              textInputAction: TextInputAction.next,
                              onEditingComplete: () {
                                if (widget.campus == Campus.winnetka) {
                                  showCopyToBBlockPrompt(
                                      _3aClassController, _3bClassController,
                                      _3aRoomController, _3bRoomController);
                                } else {
                                  //Do nothing because it's not an A block at Northfield.

                                }
                              },
                              decoration: const InputDecoration(
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none,
                                labelText: 'Room #',
                              ),
                            ),
                          ),
                        ]
                    ),
                    TableRow(
                        children: [
                          GreenDayScheduleEntryPeriodText(
                              periodName: periodNumbers[6]),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 0.0),
                            child: TextField(
                              controller: _3bClassController,
                              focusNode: _3bClassFocusNode,
                              textCapitalization: TextCapitalization.words,
                              textInputAction: TextInputAction.next,
                              decoration: const InputDecoration(
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none,
                                labelText: 'Class Name',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 0.0),
                            child: TextField(
                              controller: _3bRoomController,
                              focusNode: _3bRoomFocusNode,
                              textCapitalization: TextCapitalization.words,
                              textInputAction: TextInputAction.next,
                              decoration: const InputDecoration(
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none,
                                labelText: 'Room #',
                              ),
                            ),
                          ),
                        ]
                    ),
                    TableRow(
                        children: [
                          GreenDayScheduleEntryPeriodText(
                              periodName: periodNumbers[7]),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 0.0),
                            child: TextField(
                              controller: _4aClassController,
                              focusNode: _4aClassFocusNode,
                              textCapitalization: TextCapitalization.words,
                              textInputAction: TextInputAction.next,
                              decoration: const InputDecoration(
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none,
                                labelText: 'Class Name',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 0.0),
                            child: TextField(
                              controller: _4aRoomController,
                              focusNode: _4aRoomFocusNode,
                              textCapitalization: TextCapitalization.words,
                              textInputAction: TextInputAction.next,
                              onEditingComplete: () {
                                showCopyToBBlockPrompt(
                                    _4aClassController, _4bClassController,
                                    _4aRoomController, _4bRoomController);
                              },
                              decoration: const InputDecoration(
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none,
                                labelText: 'Room #',
                              ),
                            ),
                          ),
                        ]
                    ),
                    TableRow(
                        children: [
                          GreenDayScheduleEntryPeriodText(
                              periodName: periodNumbers[8]),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 0.0),
                            child: TextField(
                              controller: _4bClassController,
                              focusNode: _4bClassFocusNode,
                              textCapitalization: TextCapitalization.words,
                              textInputAction: TextInputAction.next,
                              decoration: const InputDecoration(
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none,
                                labelText: 'Class Name',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 0.0),
                            child: TextField(
                              controller: _4bRoomController,
                              focusNode: _4bRoomFocusNode,
                              textCapitalization: TextCapitalization.words,
                              textInputAction: TextInputAction.done,
                              decoration: const InputDecoration(
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none,
                                labelText: 'Room #',
                              ),
                            ),
                          ),
                        ]
                    ),
                  ],
                ),
                const SizedBox(height: 12.0,),
                Center(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          NewTrierColors.green),
                    ),
                    child: const Text('Save Green Day Schedule',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),),
                    onPressed: () async {
                      await saveClassData();
                      widget.onComplete();
                    },
                  ),
                ),
              ],
            );
          } else {
            return const SizedBox.shrink();
          }
        });
  }
}

class NorthfieldAnchorDayScheduleEntry extends StatefulWidget {
  final Campus campus;
  final Function onComplete;
  const NorthfieldAnchorDayScheduleEntry({Key? key, required this.campus, required this.onComplete}) : super(key: key);

  @override
  State<NorthfieldAnchorDayScheduleEntry> createState() => _NorthfieldAnchorDayScheduleEntryState();
}

class _NorthfieldAnchorDayScheduleEntryState extends State<NorthfieldAnchorDayScheduleEntry> {

  final TextEditingController _adviseryClassController = TextEditingController();
  final TextEditingController _adviseryRoomController = TextEditingController();
  final TextEditingController _1aClassController = TextEditingController();
  final TextEditingController _1aRoomController = TextEditingController();
  final TextEditingController _1bClassController = TextEditingController();
  final TextEditingController _1bRoomController = TextEditingController();
  final TextEditingController _2aClassController = TextEditingController();
  final TextEditingController _2aRoomController = TextEditingController();
  final TextEditingController _2bClassController = TextEditingController();
  final TextEditingController _2bRoomController = TextEditingController();
  final TextEditingController _2cClassController = TextEditingController();
  final TextEditingController _2cRoomController = TextEditingController();
  final TextEditingController _3aClassController = TextEditingController();
  final TextEditingController _3aRoomController = TextEditingController();
  final TextEditingController _3bClassController = TextEditingController();
  final TextEditingController _3bRoomController = TextEditingController();
  final TextEditingController _4aClassController = TextEditingController();
  final TextEditingController _4aRoomController = TextEditingController();
  final TextEditingController _4bClassController = TextEditingController();
  final TextEditingController _4bRoomController = TextEditingController();
  final TextEditingController _8ClassController = TextEditingController();
  final TextEditingController _8RoomController = TextEditingController();
  final FocusNode _adviseryClassFocusNode = FocusNode();
  final FocusNode _adviseryRoomFocusNode = FocusNode();
  final FocusNode _1aClassFocusNode = FocusNode();
  final FocusNode _1aRoomFocusNode = FocusNode();
  final FocusNode _1bClassFocusNode = FocusNode();
  final FocusNode _1bRoomFocusNode = FocusNode();
  final FocusNode _2aClassFocusNode = FocusNode();
  final FocusNode _2aRoomFocusNode = FocusNode();
  final FocusNode _2bClassFocusNode = FocusNode();
  final FocusNode _2bRoomFocusNode = FocusNode();
  final FocusNode _2cClassFocusNode = FocusNode();
  final FocusNode _2cRoomFocusNode = FocusNode();
  final FocusNode _3aClassFocusNode = FocusNode();
  final FocusNode _3aRoomFocusNode = FocusNode();
  final FocusNode _3bClassFocusNode = FocusNode();
  final FocusNode _3bRoomFocusNode = FocusNode();
  final FocusNode _4aClassFocusNode = FocusNode();
  final FocusNode _4aRoomFocusNode = FocusNode();
  final FocusNode _4bClassFocusNode = FocusNode();
  final FocusNode _4bRoomFocusNode = FocusNode();
  final FocusNode _8ClassFocusNode = FocusNode();
  final FocusNode _8RoomFocusNode = FocusNode();

  bool hasUpdated = false;

  Future<void> saveClassData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('adviseryRoom', _adviseryRoomController.text);
    prefs.setString('1AnchorClass', _1aClassController.text);
    prefs.setString('2AnchorClass', _1bClassController.text);
    prefs.setString('3AnchorClass', _2aClassController.text);
    prefs.setString('4AnchorClass', _2bClassController.text);
    prefs.setString('5AAnchorClass', _2cClassController.text);
    prefs.setString('5BAnchorClass', _3aClassController.text);
    prefs.setString('5CAnchorClass', _3bClassController.text);
    prefs.setString('6AnchorClass', _4aClassController.text);
    prefs.setString('7AnchorClass', _4bClassController.text);
    prefs.setString('8AnchorClass', _8ClassController.text);

    prefs.setString('1AnchorRoom', _1aRoomController.text);
    prefs.setString('2AnchorRoom', _1bRoomController.text);
    prefs.setString('3AnchorRoom', _2aRoomController.text);
    prefs.setString('4AnchorRoom', _2bRoomController.text);
    prefs.setString('5AAnchorRoom', _2cRoomController.text);
    prefs.setString('5BAnchorRoom', _3aRoomController.text);
    prefs.setString('5CAnchorRoom', _3bRoomController.text);
    prefs.setString('6AnchorRoom', _4aRoomController.text);
    prefs.setString('7AnchorRoom', _4bRoomController.text);
    prefs.setString('8AnchorRoom', _8RoomController.text);
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: SharedPreferences.getInstance(),
        builder: (BuildContext context, AsyncSnapshot<SharedPreferences> prefs) {
          if (prefs.hasData) {
            if (!hasUpdated) {

              _adviseryClassController.text = 'Advisery';
              String advRoom = prefs.data!.getString('adviseryRoom') ?? '';
              _adviseryRoomController.text = advRoom;

              String oneClass = prefs.data!.getString('1AClass') ?? '';
              String oneRoom = prefs.data!.getString('1ARoom') ?? '';
              String twoClass = prefs.data!.getString('2AClass') ?? '';
              String twoRoom = prefs.data!.getString('2ARoom') ?? '';
              if (twoClass == 'Lunch') {
                twoClass = prefs.data!.getString('2BClass') ?? '';
                twoRoom = prefs.data!.getString('2BRoom') ?? '';
              }
              String threeClass = prefs.data!.getString('3AClass') ?? '';
              String threeRoom = prefs.data!.getString('3ARoom') ?? '';
              if (threeClass == 'Lunch') {
                threeClass = prefs.data!.getString('3BClass') ?? '';
                threeRoom = prefs.data!.getString('3BRoom') ?? '';
              }
              String fourClass = prefs.data!.getString('4AClass') ?? '';
              String fourRoom = prefs.data!.getString('4ARoom') ?? '';
              //String fiveClass = prefs.data!.getString('5AClass') ?? '';
              String sixClass = prefs.data!.getString('6AClass') ?? '';
              String sixRoom = prefs.data!.getString('6ARoom') ?? '';
              if (sixClass == 'Lunch') {
                sixClass = prefs.data!.getString('6BClass') ?? '';
                sixRoom = prefs.data!.getString('6BRoom') ?? '';
              }
              String sevenClass = prefs.data!.getString('7AClass') ?? '';
              String sevenRoom = prefs.data!.getString('7ARoom') ?? '';
              if (sevenClass == 'Lunch') {
                sevenClass = prefs.data!.getString('7BClass') ?? '';
                sevenRoom = prefs.data!.getString('7BRoom') ?? '';
              }
              String eightClass = prefs.data!.getString('8AClass') ?? '';

              if (_1aClassController.text == '') {
                _1aClassController.text = oneClass;
                _1aRoomController.text = oneRoom;
              }

              if (_1bClassController.text == '') {
                _1bClassController.text = twoClass;
                _1bRoomController.text = twoRoom;
              }

              if (_2aClassController.text == '') {
                _2aClassController.text = threeClass;
                _2aRoomController.text = threeRoom;
              }

              if (_2bClassController.text == '') {
                _2bClassController.text = fourClass;
                _2bRoomController.text = fourRoom;
              }

              if (_4aClassController.text == '') {
                _4aClassController.text = sixClass;
                _4aRoomController.text = sixRoom;
              }

              if (_4bClassController.text == '') {
                _4bClassController.text = sevenClass;
                _4bRoomController.text = sevenRoom;
              }

              if (_8ClassController.text == '') {
                _8ClassController.text = eightClass;
                _8RoomController.text = prefs.data!.getString('8ARoom') ?? '';
              }
              hasUpdated = true;
            }

            return Column(
              children: [
                const Text('Anchor Day Schedule',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: NewTrierColors.yellow,
                    fontSize: 18.0,
                  ),
                ),
                const Text('Leave free periods blank.',
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                  ),
                ),
                Table(
                  defaultVerticalAlignment: TableCellVerticalAlignment
                      .middle,
                  border: TableBorder.all(color: NewTrierColors.yellow),
                  columnWidths: const <int, TableColumnWidth>{
                    0: IntrinsicColumnWidth(),
                    1: FlexColumnWidth(2),
                    2: FlexColumnWidth(1)
                  },
                  children: [
                    TableRow(
                        children: [
                          const AnchorDayScheduleEntryPeriodText(periodName: 'Adv'),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 0.0),
                            child: TextField(
                              controller: _adviseryClassController,
                              focusNode: _adviseryClassFocusNode,
                              textCapitalization: TextCapitalization.words,
                              textInputAction: TextInputAction.next,
                              decoration: const InputDecoration(
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none,
                                //labelText: 'Advisery',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 0.0),
                            child: TextField(
                              controller: _adviseryRoomController,
                              focusNode: _adviseryRoomFocusNode,
                              textCapitalization: TextCapitalization.words,
                              textInputAction: TextInputAction.next,
                              decoration: const InputDecoration(
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none,
                                labelText: 'Room #',
                              ),
                            ),
                          ),
                        ]
                    ),
                    TableRow(
                        children: [
                          const AnchorDayScheduleEntryPeriodText(periodName: '1'),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 0.0),
                            child: TextField(
                              controller: _1aClassController,
                              focusNode: _1aClassFocusNode,
                              textCapitalization: TextCapitalization.words,
                              textInputAction: TextInputAction.next,
                              decoration: const InputDecoration(
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none,
                                labelText: 'Class Name',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 0.0),
                            child: TextField(
                              controller: _1aRoomController,
                              focusNode: _1aRoomFocusNode,
                              textCapitalization: TextCapitalization.words,
                              textInputAction: TextInputAction.next,
                              decoration: const InputDecoration(
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none,
                                labelText: 'Room #',
                              ),
                            ),
                          ),
                        ]
                    ),
                    TableRow(
                        children: [
                          const AnchorDayScheduleEntryPeriodText(periodName: '2'),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 0.0),
                            child: TextField(
                              controller: _1bClassController,
                              focusNode: _1bClassFocusNode,
                              textCapitalization: TextCapitalization.words,
                              textInputAction: TextInputAction.next,
                              decoration: const InputDecoration(
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none,
                                labelText: 'Class Name',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 0.0),
                            child: TextField(
                              controller: _1bRoomController,
                              focusNode: _1bRoomFocusNode,
                              textCapitalization: TextCapitalization.words,
                              textInputAction: TextInputAction.next,
                              decoration: const InputDecoration(
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none,
                                labelText: 'Room #',
                              ),
                            ),
                          ),
                        ]
                    ),
                    TableRow(
                        children: [
                          const AnchorDayScheduleEntryPeriodText(periodName: '3'),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 0.0),
                            child: TextField(
                              controller: _2aClassController,
                              focusNode: _2aClassFocusNode,
                              textCapitalization: TextCapitalization.words,
                              textInputAction: TextInputAction.next,
                              decoration: const InputDecoration(
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none,
                                labelText: 'Class Name',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 0.0),
                            child: TextField(
                              controller: _2aRoomController,
                              focusNode: _2aRoomFocusNode,
                              textCapitalization: TextCapitalization.words,
                              textInputAction: TextInputAction.next,
                              decoration: const InputDecoration(
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none,
                                labelText: 'Room #',
                              ),
                            ),
                          ),
                        ]
                    ),
                    TableRow(
                        children: [
                          const AnchorDayScheduleEntryPeriodText(
                              periodName: '4'),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 0.0),
                            child: TextField(
                              controller: _2bClassController,
                              focusNode: _2bClassFocusNode,
                              textCapitalization: TextCapitalization.words,
                              textInputAction: TextInputAction.next,
                              decoration: const InputDecoration(
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none,
                                labelText: 'Class Name',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 0.0),
                            child: TextField(
                              controller: _2bRoomController,
                              focusNode: _2bRoomFocusNode,
                              textCapitalization: TextCapitalization.words,
                              textInputAction: TextInputAction.next,
                              decoration: const InputDecoration(
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none,
                                labelText: 'Room #',
                              ),
                            ),
                          ),
                        ]
                    ),
                    TableRow(
                        children: [
                          const AnchorDayScheduleEntryPeriodText(
                              periodName: '5A'),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 0.0),
                            child: TextField(
                              controller: _2cClassController,
                              focusNode: _2cClassFocusNode,
                              textCapitalization: TextCapitalization.words,
                              textInputAction: TextInputAction.next,
                              decoration: const InputDecoration(
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none,
                                labelText: 'Class Name',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 0.0),
                            child: TextField(
                              controller: _2cRoomController,
                              focusNode: _2cRoomFocusNode,
                              textCapitalization: TextCapitalization.words,
                              textInputAction: TextInputAction.next,
                              decoration: const InputDecoration(
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none,
                                labelText: 'Room #',
                              ),
                            ),
                          ),
                        ]
                    ),
                    TableRow(
                        children: [
                          const AnchorDayScheduleEntryPeriodText(
                              periodName: '5B'),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 0.0),
                            child: TextField(
                              controller: _3aClassController,
                              focusNode: _3aClassFocusNode,
                              textCapitalization: TextCapitalization.words,
                              textInputAction: TextInputAction.next,
                              decoration: const InputDecoration(
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none,
                                labelText: 'Class Name',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 0.0),
                            child: TextField(
                              controller: _3aRoomController,
                              focusNode: _3aRoomFocusNode,
                              textCapitalization: TextCapitalization.words,
                              textInputAction: TextInputAction.next,
                              decoration: const InputDecoration(
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none,
                                labelText: 'Room #',
                              ),
                            ),
                          ),
                        ]
                    ),
                    TableRow(
                        children: [
                          const AnchorDayScheduleEntryPeriodText(periodName: '5C'),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 0.0),
                            child: TextField(
                              controller: _3bClassController,
                              focusNode: _3bClassFocusNode,
                              textCapitalization: TextCapitalization.words,
                              textInputAction: TextInputAction.next,
                              decoration: const InputDecoration(
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none,
                                labelText: 'Class Name',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 0.0),
                            child: TextField(
                              controller: _3bRoomController,
                              focusNode: _3bRoomFocusNode,
                              textCapitalization: TextCapitalization.words,
                              textInputAction: TextInputAction.next,
                              decoration: const InputDecoration(
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none,
                                labelText: 'Room #',
                              ),
                            ),
                          ),
                        ]
                    ),
                    TableRow(
                        children: [
                          const AnchorDayScheduleEntryPeriodText(periodName: '6'),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 0.0),
                            child: TextField(
                              controller: _4aClassController,
                              focusNode: _4aClassFocusNode,
                              textCapitalization: TextCapitalization.words,
                              textInputAction: TextInputAction.next,
                              decoration: const InputDecoration(
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none,
                                labelText: 'Class Name',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 0.0),
                            child: TextField(
                              controller: _4aRoomController,
                              focusNode: _4aRoomFocusNode,
                              textCapitalization: TextCapitalization.words,
                              textInputAction: TextInputAction.next,
                              decoration: const InputDecoration(
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none,
                                labelText: 'Room #',
                              ),
                            ),
                          ),
                        ]
                    ),
                    TableRow(
                        children: [
                          const AnchorDayScheduleEntryPeriodText(periodName: '7'),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 0.0),
                            child: TextField(
                              controller: _4bClassController,
                              focusNode: _4bClassFocusNode,
                              textCapitalization: TextCapitalization.words,
                              textInputAction: TextInputAction.next,
                              decoration: const InputDecoration(
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none,
                                labelText: 'Class Name',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 0.0),
                            child: TextField(
                              controller: _4bRoomController,
                              focusNode: _4bRoomFocusNode,
                              textCapitalization: TextCapitalization.words,
                              textInputAction: TextInputAction.done,
                              decoration: const InputDecoration(
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none,
                                labelText: 'Room #',
                              ),
                            ),
                          ),
                        ]
                    ),
                    TableRow(
                        children: [
                          const AnchorDayScheduleEntryPeriodText(periodName: '8'),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 0.0),
                            child: TextField(
                              controller: _8ClassController,
                              focusNode: _8ClassFocusNode,
                              textCapitalization: TextCapitalization.words,
                              textInputAction: TextInputAction.next,
                              decoration: const InputDecoration(
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none,
                                labelText: 'Class Name',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 0.0),
                            child: TextField(
                              controller: _8RoomController,
                              focusNode: _8RoomFocusNode,
                              textCapitalization: TextCapitalization.words,
                              textInputAction: TextInputAction.done,
                              decoration: const InputDecoration(
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none,
                                labelText: 'Room #',
                              ),
                            ),
                          ),
                        ]
                    ),
                  ],
                ),
                const SizedBox(height: 12.0,),
                Center(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          NewTrierColors.yellow),
                    ),
                    child: const Text('Save Anchor Day Schedule',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),),
                    onPressed: () async {
                      await saveClassData();
                      widget.onComplete();
                    },
                  ),
                ),
              ],
            );
          } else {
            return const SizedBox.shrink();
          }
        }
    );
  }
}

class WinnetkaAnchorDayScheduleEntry extends StatefulWidget {
  final Campus campus;
  final Function onComplete;
  const WinnetkaAnchorDayScheduleEntry({Key? key, required this.campus, required this.onComplete}) : super(key: key);

  @override
  State<WinnetkaAnchorDayScheduleEntry> createState() => _WinnetkaAnchorDayScheduleEntryState();
}

class _WinnetkaAnchorDayScheduleEntryState extends State<WinnetkaAnchorDayScheduleEntry> {

  final TextEditingController _adviseryClassController = TextEditingController();
  final TextEditingController _adviseryRoomController = TextEditingController();
  final TextEditingController _1aClassController = TextEditingController();
  final TextEditingController _1aRoomController = TextEditingController();
  final TextEditingController _1bClassController = TextEditingController();
  final TextEditingController _1bRoomController = TextEditingController();
  final TextEditingController _2aClassController = TextEditingController();
  final TextEditingController _2aRoomController = TextEditingController();
  final TextEditingController _2bClassController = TextEditingController();
  final TextEditingController _2bRoomController = TextEditingController();
  final TextEditingController _2cClassController = TextEditingController();
  final TextEditingController _2cRoomController = TextEditingController();
  final TextEditingController _3aClassController = TextEditingController();
  final TextEditingController _3aRoomController = TextEditingController();
  final TextEditingController _3bClassController = TextEditingController();
  final TextEditingController _3bRoomController = TextEditingController();
  final TextEditingController _4aClassController = TextEditingController();
  final TextEditingController _4aRoomController = TextEditingController();
  final TextEditingController _4bClassController = TextEditingController();
  final TextEditingController _4bRoomController = TextEditingController();
  final TextEditingController _8ClassController = TextEditingController();
  final TextEditingController _8RoomController = TextEditingController();
  final FocusNode _adviseryClassFocusNode = FocusNode();
  final FocusNode _adviseryRoomFocusNode = FocusNode();
  final FocusNode _1aClassFocusNode = FocusNode();
  final FocusNode _1aRoomFocusNode = FocusNode();
  final FocusNode _1bClassFocusNode = FocusNode();
  final FocusNode _1bRoomFocusNode = FocusNode();
  final FocusNode _2aClassFocusNode = FocusNode();
  final FocusNode _2aRoomFocusNode = FocusNode();
  final FocusNode _2bClassFocusNode = FocusNode();
  final FocusNode _2bRoomFocusNode = FocusNode();
  final FocusNode _2cClassFocusNode = FocusNode();
  final FocusNode _2cRoomFocusNode = FocusNode();
  final FocusNode _3aClassFocusNode = FocusNode();
  final FocusNode _3aRoomFocusNode = FocusNode();
  final FocusNode _3bClassFocusNode = FocusNode();
  final FocusNode _3bRoomFocusNode = FocusNode();
  final FocusNode _4aClassFocusNode = FocusNode();
  final FocusNode _4aRoomFocusNode = FocusNode();
  final FocusNode _4bClassFocusNode = FocusNode();
  final FocusNode _4bRoomFocusNode = FocusNode();
  final FocusNode _8ClassFocusNode = FocusNode();
  final FocusNode _8RoomFocusNode = FocusNode();

  bool hasUpdated = false;

  Future<void> saveClassData() async {
    final prefs = await SharedPreferences.getInstance();
    print(_adviseryRoomController.text);
    prefs.setString('adviseryRoom', _adviseryRoomController.text);
    prefs.setString('1AnchorClass', _1aClassController.text);
    prefs.setString('2AnchorClass', _1bClassController.text);
    prefs.setString('3AnchorClass', _2aClassController.text);
    prefs.setString('4AAnchorClass', _2bClassController.text);
    prefs.setString('4BAnchorClass', _2cClassController.text);
    prefs.setString('4CAnchorClass', _3aClassController.text);
    prefs.setString('5AnchorClass', _3bClassController.text);
    prefs.setString('6AnchorClass', _4aClassController.text);
    prefs.setString('7AnchorClass', _4bClassController.text);
    prefs.setString('8AnchorClass', _8ClassController.text);

    prefs.setString('1AnchorRoom', _1aRoomController.text);
    prefs.setString('2AnchorRoom', _1bRoomController.text);
    prefs.setString('3AnchorRoom', _2aRoomController.text);
    prefs.setString('4AAnchorRoom', _2bRoomController.text);
    prefs.setString('4BAnchorRoom', _2cRoomController.text);
    prefs.setString('4CAnchorRoom', _3aRoomController.text);
    prefs.setString('5AnchorRoom', _3bRoomController.text);
    prefs.setString('6AnchorRoom', _4aRoomController.text);
    prefs.setString('7AnchorRoom', _4bRoomController.text);
    prefs.setString('8AnchorRoom', _8RoomController.text);
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: SharedPreferences.getInstance(),
        builder: (BuildContext context, AsyncSnapshot<SharedPreferences> prefs) {
          if (prefs.hasData) {
            if (!hasUpdated) {

              _adviseryClassController.text = 'Advisery';
              String advRoom = prefs.data!.getString('adviseryRoom') ?? '';
              _adviseryRoomController.text = advRoom;

              String oneClass = prefs.data!.getString('1AClass') ?? '';
              String oneRoom = prefs.data!.getString('1ARoom') ?? '';
              String twoClass = prefs.data!.getString('2AClass') ?? '';
              String twoRoom = prefs.data!.getString('2ARoom') ?? '';
              if (twoClass == 'Lunch') {
                twoClass = prefs.data!.getString('2BClass') ?? '';
                twoRoom = prefs.data!.getString('2BRoom') ?? '';
              }
              String threeClass = prefs.data!.getString('3AClass') ?? '';
              String threeRoom = prefs.data!.getString('3ARoom') ?? '';
              if (threeClass == 'Lunch') {
                threeClass = prefs.data!.getString('3BClass') ?? '';
                threeRoom = prefs.data!.getString('3BRoom') ?? '';
              }
              String fiveClass = prefs.data!.getString('5AClass') ?? '';
              String sixClass = prefs.data!.getString('6AClass') ?? '';
              String sixRoom = prefs.data!.getString('6ARoom') ?? '';
              if (sixClass == 'Lunch') {
                sixClass = prefs.data!.getString('6BClass') ?? '';
                sixRoom = prefs.data!.getString('6BRoom') ?? '';
              }
              String sevenClass = prefs.data!.getString('7AClass') ?? '';
              String sevenRoom = prefs.data!.getString('7ARoom') ?? '';
              if (sevenClass == 'Lunch') {
                sevenClass = prefs.data!.getString('7BClass') ?? '';
                sevenRoom = prefs.data!.getString('7BRoom') ?? '';
              }
              String eightClass = prefs.data!.getString('8AClass') ?? '';

              if (_1aClassController.text == '') {
                _1aClassController.text = oneClass;
                _1aRoomController.text = oneRoom;
              }

              if (_1bClassController.text == '') {
                _1bClassController.text = twoClass;
                _1bRoomController.text = twoRoom;
              }

              if (_2aClassController.text == '') {
                _2aClassController.text = threeClass;
                _2aRoomController.text = threeRoom;
              }

              if (_3bClassController.text == '') {
                _3bClassController.text = fiveClass;
                _3bRoomController.text = prefs.data!.getString('5ARoom') ?? '';
              }

              if (_4aClassController.text == '') {
                _4aClassController.text = sixClass;
                _4aRoomController.text = sixRoom;
              }

              if (_4bClassController.text == '') {
                _4bClassController.text = sevenClass;
                _4bRoomController.text = sevenRoom;
              }

              if (_8ClassController.text == '') {
                _8ClassController.text = eightClass;
                _8RoomController.text = prefs.data!.getString('8ARoom') ?? '';
              }
              hasUpdated = true;
            }

            return Column(
              children: [
                const Text('Anchor Day Schedule',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: NewTrierColors.yellow,
                    fontSize: 18.0,
                  ),
                ),
                const Text('Leave free periods blank.',
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                  ),
                ),
                Table(
                  defaultVerticalAlignment: TableCellVerticalAlignment
                      .middle,
                  border: TableBorder.all(color: NewTrierColors.yellow),
                  columnWidths: const <int, TableColumnWidth>{
                    0: IntrinsicColumnWidth(),
                    1: FlexColumnWidth(2),
                    2: FlexColumnWidth(1)
                  },
                  children: [
                    TableRow(
                        children: [
                          const AnchorDayScheduleEntryPeriodText(periodName: 'Adv'),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 0.0),
                            child: TextField(
                              controller: _adviseryClassController,
                              focusNode: _adviseryClassFocusNode,
                              textCapitalization: TextCapitalization.words,
                              textInputAction: TextInputAction.next,
                              decoration: const InputDecoration(
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none,
                                //labelText: 'Advisery',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 0.0),
                            child: TextField(
                              controller: _adviseryRoomController,
                              focusNode: _adviseryRoomFocusNode,
                              textCapitalization: TextCapitalization.words,
                              textInputAction: TextInputAction.next,
                              decoration: const InputDecoration(
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none,
                                labelText: 'Room #',
                              ),
                            ),
                          ),
                        ]
                    ),
                    TableRow(
                        children: [
                          const AnchorDayScheduleEntryPeriodText(periodName: '1'),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 0.0),
                            child: TextField(
                              controller: _1aClassController,
                              focusNode: _1aClassFocusNode,
                              textCapitalization: TextCapitalization.words,
                              textInputAction: TextInputAction.next,
                              decoration: const InputDecoration(
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none,
                                labelText: 'Class Name',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 0.0),
                            child: TextField(
                              controller: _1aRoomController,
                              focusNode: _1aRoomFocusNode,
                              textCapitalization: TextCapitalization.words,
                              textInputAction: TextInputAction.next,
                              decoration: const InputDecoration(
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none,
                                labelText: 'Room #',
                              ),
                            ),
                          ),
                        ]
                    ),
                    TableRow(
                        children: [
                          const AnchorDayScheduleEntryPeriodText(periodName: '2'),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 0.0),
                            child: TextField(
                              controller: _1bClassController,
                              focusNode: _1bClassFocusNode,
                              textCapitalization: TextCapitalization.words,
                              textInputAction: TextInputAction.next,
                              decoration: const InputDecoration(
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none,
                                labelText: 'Class Name',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 0.0),
                            child: TextField(
                              controller: _1bRoomController,
                              focusNode: _1bRoomFocusNode,
                              textCapitalization: TextCapitalization.words,
                              textInputAction: TextInputAction.next,
                              decoration: const InputDecoration(
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none,
                                labelText: 'Room #',
                              ),
                            ),
                          ),
                        ]
                    ),
                    TableRow(
                        children: [
                          const AnchorDayScheduleEntryPeriodText(periodName: '3'),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 0.0),
                            child: TextField(
                              controller: _2aClassController,
                              focusNode: _2aClassFocusNode,
                              textCapitalization: TextCapitalization.words,
                              textInputAction: TextInputAction.next,
                              decoration: const InputDecoration(
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none,
                                labelText: 'Class Name',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 0.0),
                            child: TextField(
                              controller: _2aRoomController,
                              focusNode: _2aRoomFocusNode,
                              textCapitalization: TextCapitalization.words,
                              textInputAction: TextInputAction.next,
                              decoration: const InputDecoration(
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none,
                                labelText: 'Room #',
                              ),
                            ),
                          ),
                        ]
                    ),
                    TableRow(
                        children: [
                          const AnchorDayScheduleEntryPeriodText(
                              periodName: '4A'),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 0.0),
                            child: TextField(
                              controller: _2bClassController,
                              focusNode: _2bClassFocusNode,
                              textCapitalization: TextCapitalization.words,
                              textInputAction: TextInputAction.next,
                              decoration: const InputDecoration(
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none,
                                labelText: 'Class Name',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 0.0),
                            child: TextField(
                              controller: _2bRoomController,
                              focusNode: _2bRoomFocusNode,
                              textCapitalization: TextCapitalization.words,
                              textInputAction: TextInputAction.next,
                              decoration: const InputDecoration(
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none,
                                labelText: 'Room #',
                              ),
                            ),
                          ),
                        ]
                    ),
                    TableRow(
                        children: [
                          const AnchorDayScheduleEntryPeriodText(
                              periodName: '4B'),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 0.0),
                            child: TextField(
                              controller: _2cClassController,
                              focusNode: _2cClassFocusNode,
                              textCapitalization: TextCapitalization.words,
                              textInputAction: TextInputAction.next,
                              decoration: const InputDecoration(
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none,
                                labelText: 'Class Name',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 0.0),
                            child: TextField(
                              controller: _2cRoomController,
                              focusNode: _2cRoomFocusNode,
                              textCapitalization: TextCapitalization.words,
                              textInputAction: TextInputAction.next,
                              decoration: const InputDecoration(
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none,
                                labelText: 'Room #',
                              ),
                            ),
                          ),
                        ]
                    ),
                    TableRow(
                        children: [
                          const AnchorDayScheduleEntryPeriodText(
                              periodName: '4C'),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 0.0),
                            child: TextField(
                              controller: _3aClassController,
                              focusNode: _3aClassFocusNode,
                              textCapitalization: TextCapitalization.words,
                              textInputAction: TextInputAction.next,
                              decoration: const InputDecoration(
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none,
                                labelText: 'Class Name',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 0.0),
                            child: TextField(
                              controller: _3aRoomController,
                              focusNode: _3aRoomFocusNode,
                              textCapitalization: TextCapitalization.words,
                              textInputAction: TextInputAction.next,
                              decoration: const InputDecoration(
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none,
                                labelText: 'Room #',
                              ),
                            ),
                          ),
                        ]
                    ),
                    TableRow(
                        children: [
                          const AnchorDayScheduleEntryPeriodText(periodName: '5'),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 0.0),
                            child: TextField(
                              controller: _3bClassController,
                              focusNode: _3bClassFocusNode,
                              textCapitalization: TextCapitalization.words,
                              textInputAction: TextInputAction.next,
                              decoration: const InputDecoration(
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none,
                                labelText: 'Class Name',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 0.0),
                            child: TextField(
                              controller: _3bRoomController,
                              focusNode: _3bRoomFocusNode,
                              textCapitalization: TextCapitalization.words,
                              textInputAction: TextInputAction.next,
                              decoration: const InputDecoration(
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none,
                                labelText: 'Room #',
                              ),
                            ),
                          ),
                        ]
                    ),
                    TableRow(
                        children: [
                          const AnchorDayScheduleEntryPeriodText(periodName: '6'),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 0.0),
                            child: TextField(
                              controller: _4aClassController,
                              focusNode: _4aClassFocusNode,
                              textCapitalization: TextCapitalization.words,
                              textInputAction: TextInputAction.next,
                              decoration: const InputDecoration(
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none,
                                labelText: 'Class Name',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 0.0),
                            child: TextField(
                              controller: _4aRoomController,
                              focusNode: _4aRoomFocusNode,
                              textCapitalization: TextCapitalization.words,
                              textInputAction: TextInputAction.next,
                              decoration: const InputDecoration(
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none,
                                labelText: 'Room #',
                              ),
                            ),
                          ),
                        ]
                    ),
                    TableRow(
                        children: [
                          const AnchorDayScheduleEntryPeriodText(periodName: '7'),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 0.0),
                            child: TextField(
                              controller: _4bClassController,
                              focusNode: _4bClassFocusNode,
                              textCapitalization: TextCapitalization.words,
                              textInputAction: TextInputAction.next,
                              decoration: const InputDecoration(
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none,
                                labelText: 'Class Name',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 0.0),
                            child: TextField(
                              controller: _4bRoomController,
                              focusNode: _4bRoomFocusNode,
                              textCapitalization: TextCapitalization.words,
                              textInputAction: TextInputAction.done,
                              decoration: const InputDecoration(
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none,
                                labelText: 'Room #',
                              ),
                            ),
                          ),
                        ]
                    ),
                    TableRow(
                        children: [
                          const AnchorDayScheduleEntryPeriodText(periodName: '8'),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 0.0),
                            child: TextField(
                              controller: _8ClassController,
                              focusNode: _8ClassFocusNode,
                              textCapitalization: TextCapitalization.words,
                              textInputAction: TextInputAction.next,
                              decoration: const InputDecoration(
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none,
                                labelText: 'Class Name',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 0.0),
                            child: TextField(
                              controller: _8RoomController,
                              focusNode: _8RoomFocusNode,
                              textCapitalization: TextCapitalization.words,
                              textInputAction: TextInputAction.done,
                              decoration: const InputDecoration(
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none,
                                labelText: 'Room #',
                              ),
                            ),
                          ),
                        ]
                    ),
                  ],
                ),
                const SizedBox(height: 12.0,),
                Center(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          NewTrierColors.yellow),
                    ),
                    child: const Text('Save Anchor Day Schedule',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),),
                    onPressed: () async {
                      await saveClassData();
                      widget.onComplete();
                    },
                  ),
                ),
              ],
            );
          } else {
            return const SizedBox.shrink();
          }
        }
    );
  }
}

class BlueDayScheduleEntryPeriodText extends StatelessWidget {
  final String periodName;
  const BlueDayScheduleEntryPeriodText({Key? key, required this.periodName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(periodName,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: NewTrierColors.blue,
        ),
      ),
    );
  }
}

class GreenDayScheduleEntryPeriodText extends StatelessWidget {
  final String periodName;
  const GreenDayScheduleEntryPeriodText({Key? key, required this.periodName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(periodName,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: NewTrierColors.green,
        ),
      ),
    );
  }
}

class AnchorDayScheduleEntryPeriodText extends StatelessWidget {
  final String periodName;
  const AnchorDayScheduleEntryPeriodText({Key? key, required this.periodName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(periodName,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: NewTrierColors.yellow,
        ),
      ),
    );
  }
}

