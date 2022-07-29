import 'package:flutter/material.dart';
import 'package:nt_block_android/new_trier_colors.dart';
import 'package:nt_block_android/schedule_entry_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  void promptScheduleEntry() async {
    await Future.delayed(const Duration(milliseconds: 400));
    if (mounted) {
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
                  ],
                ),
                actions: [
                  TextButton(
                    child: const Text('Not Now'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: const Text('Yes, Enter Schedule'),
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const ScheduleEntryScreen()));
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

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: SharedPreferences.getInstance(),
        builder: (BuildContext context, AsyncSnapshot<SharedPreferences> snapshot) {
          if (snapshot.hasData) {
            bool hasSchedule = snapshot.data?.getBool('hasEnteredScheduleInfo') ?? false;
            String campus = snapshot.data?.getString('campus') ?? 'Winnetka';
            String buttonName = hasSchedule ? 'Edit' : 'Add';
            if (!hasSchedule) {
              promptScheduleEntry();
            }
            return Scaffold(
              appBar: AppBar(
                title: const Text('Your Schedule'),
                actions: [
                  TextButton(
                    child: Text(buttonName,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const ScheduleEntryScreen()));
                    },
                  )
                ],
              ),
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text('$campus Campus',
                            style: Theme.of(context).textTheme.headline4!.copyWith(
                              color: NewTrierColors.gray,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.normal,
                              fontSize: 12.0,
                            ),),
                        ),
                        const BlueDayScheduleSection(),
                        const GreenDayScheduleSection(),
                        AnchorDayScheduleSection(campus: campus,),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: Center(
                            child: TextButton(
                              child: const Text('Delete Schedule'),
                              onPressed: () async {
                                showDialog(context: context, builder: (context) {
                                  return AlertDialog(
                                    title: const Text(
                                      'Are you sure you want to delete your schedule data?',
                                      style: TextStyle(
                                        color: NewTrierColors.blue,
                                      ),
                                    ),
                                    content: const Text(
                                        'Schedule data will be deleted for blue, green, and anchor days. You will be able to re-enter your schedule any time by returning to this screen.'),
                                    actions: [
                                      TextButton(
                                        child: const Text('Delete Schedule',
                                          style: TextStyle(
                                            color: Colors.red,
                                          ),
                                        ),
                                        onPressed: () async {
                                          final prefs = await SharedPreferences
                                              .getInstance();
                                          setState(() {
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

                                            prefs.remove('5AAnchorClass');
                                            prefs.remove('5BAnchorClass');
                                            prefs.remove('5CAnchorClass');
                                            prefs.remove('5AAnchorRoom');
                                            prefs.remove('5BAnchorRoom');
                                            prefs.remove('5CAnchorRoom');

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
                                            prefs.remove('4AnchorClass');
                                            prefs.remove('4AnchorRoom');
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
                                          });
                                        },
                                      ),
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.of(context).pop(),
                                        child: const Text('Cancel'),
                                      )
                                    ],
                                  );
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          } else {
            return Container();
          }

        }
    );
  }
}

class BlueDayScheduleSection extends StatelessWidget {
  const BlueDayScheduleSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Blue Day Schedule',
          style: Theme
              .of(context)
              .textTheme
              .headline4!
              .copyWith(color: NewTrierColors.blue),),
        Divider(),
        PeriodBlockColumn(periodNumber: 1),
        Divider(),
        PeriodBlockColumn(periodNumber: 2),
        Divider(),
        PeriodBlockColumn(periodNumber: 3),
        Divider(),
        PeriodBlockColumn(periodNumber: 4),
        Divider(),
      ],
    );
  }
}

class GreenDayScheduleSection extends StatelessWidget {
  const GreenDayScheduleSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Green Day Schedule',
          style: Theme.of(context).textTheme.headline4!.copyWith(
              color: NewTrierColors.green),),
        const Divider(),
        const PeriodBlockColumn(periodNumber: 5),
        const Divider(),
        const PeriodBlockColumn(periodNumber: 6),
        const Divider(),
        const PeriodBlockColumn(periodNumber: 7),
        const Divider(),
        const PeriodBlockColumn(periodNumber: 8),
        const Divider(),
      ],
    );
  }
}

class AnchorDayScheduleSection extends StatelessWidget {

  final String campus;

  const AnchorDayScheduleSection({Key? key, required this.campus}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    if (campus == 'Winnetka') {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('Anchor Day Schedule',
            style: Theme
                .of(context)
                .textTheme
                .headline4!
                .copyWith(color: NewTrierColors.yellow),),
          const Divider(),
          AnchorDayClassColumn(periodNumber: 1),
          const Divider(),
          AnchorDayClassColumn(periodNumber: 2),
          const Divider(),
          AnchorDayClassColumn(periodNumber: 3),
          const Divider(),
          const AnchorDayLunchColumn(lunchPeriod: 4,),
          const Divider(),
          AnchorDayClassColumn(periodNumber: 5),
          const Divider(),
          AnchorDayClassColumn(periodNumber: 6),
          const Divider(),
          AnchorDayClassColumn(periodNumber: 7),
          const Divider(),
          AnchorDayClassColumn(periodNumber: 8),
          Divider(),
        ],
      );
    } else {
      //Northfield Anchor Day Schedule
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('Anchor Day Schedule',
            style: Theme
                .of(context)
                .textTheme
                .headline4!
                .copyWith(color: NewTrierColors.yellow),),
          const Divider(),
          AnchorDayClassColumn(periodNumber: 1),
          const Divider(),
          AnchorDayClassColumn(periodNumber: 2),
          const Divider(),
          AnchorDayClassColumn(periodNumber: 3),
          const Divider(),
          AnchorDayClassColumn(periodNumber: 4),
          const Divider(),
          AnchorDayLunchColumn(lunchPeriod: 5,),
          const Divider(),
          AnchorDayClassColumn(periodNumber: 6),
          const Divider(),
          AnchorDayClassColumn(periodNumber: 7),
          const Divider(),
          AnchorDayClassColumn(periodNumber: 8),
          Divider(),
        ],
      );
    }
  }






}



class PeriodBlockColumn extends StatelessWidget {

  final int periodNumber;

  const PeriodBlockColumn({Key? key, required this.periodNumber}) : super(key: key);

  Future<PeriodInfo> getBlockInfo() async {
    final prefs = await SharedPreferences.getInstance();
    String? aBlock = prefs.getString('${periodNumber}AClass');
    String? aBlockRoom = prefs.getString('${periodNumber}ARoom');
    String? bBlock = prefs.getString('${periodNumber}BClass');
    String? bBlockRoom = prefs.getString('${periodNumber}BRoom');
    String? cBlock = prefs.getString('${periodNumber}CClass');
    String? cBlockRoom = prefs.getString('${periodNumber}CRoom');
    String campus = prefs.getString('campus') ?? 'Winnetka';
    bool hasCBlock = false;

    if (((campus == 'Winnetka' && (periodNumber == 2 || periodNumber == 6)) || (campus == 'Northfield' && (periodNumber == 3 || periodNumber == 7)))) {
      hasCBlock = true;
    }

    //Removed this logic when making profile specific to campus rather than allowing for commuter flexibility.
    // if (cBlock != null) {
    //   print('has C Block because C Block != nil for $periodNumber period.');
    //   hasCBlock = true;
    // }

    if (aBlockRoom != null && aBlockRoom != '') {
      aBlockRoom = ' - Room $aBlockRoom';
    }

    if (bBlockRoom != null && bBlockRoom != '') {
      bBlockRoom = ' - Room $bBlockRoom';
    }

    if (hasCBlock) {
      if (cBlockRoom != null && cBlockRoom != '') {
        cBlockRoom = ' - Room $cBlockRoom';
      }
    }

    PeriodInfo periodInfoToReturn = PeriodInfo(
      aBlockClassName: aBlock ?? '',
      aBlockRoomNumber: aBlockRoom ?? '',
      bBlockClassName: bBlock ?? '',
      bBlockRoomNumber: bBlockRoom ?? '',
      cBlockClassName: cBlock ?? '',
      cBlockRoomNumber: cBlockRoom ?? '',
      hasCBlock: hasCBlock,
    );

    return periodInfoToReturn;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PeriodInfo>(
      future: getBlockInfo(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(text: '${periodNumber}A: ',
                    children: [
                      TextSpan(
                          text: '${snapshot.data!.aBlockClassName}${snapshot.data!.aBlockRoomNumber}',
                          style: const TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ))
                    ]),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: periodNumber < 5 ? NewTrierColors.blue : NewTrierColors.green,
                ),
              ),
              Text.rich(
                TextSpan(text: '${periodNumber}B: ',
                    children: [
                      TextSpan(
                          text: '${snapshot.data!.bBlockClassName}${snapshot.data!.bBlockRoomNumber}',
                          style: const TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ))
                    ]),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: periodNumber < 5 ? NewTrierColors.blue : NewTrierColors.green,
                ),
              ),
              Visibility(
                visible: (snapshot.data?.hasCBlock ?? false),
                child: Text.rich(
                  TextSpan(text: '${periodNumber}C: ',
                      children: [
                        TextSpan(
                            text: '${snapshot.data!.cBlockClassName}${snapshot.data!.cBlockRoomNumber}',
                            style: const TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ))
                      ]),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: periodNumber < 5 ? NewTrierColors.blue : NewTrierColors.green,
                  ),
                ),
              ),
            ],
          );
        } else {
          return const Text('Loading...');
        }

      },
    );
  }
}


class AnchorDayClassColumn extends StatelessWidget {
  final int periodNumber;

  const AnchorDayClassColumn({Key? key, required this.periodNumber}) : super(key: key);

  Future<AnchorDayPeriodInfo> getBlock() async {
    final prefs = await SharedPreferences.getInstance();
    String className = prefs.getString('${periodNumber}AnchorClass') ?? '';
    String roomNumber = prefs.getString('${periodNumber}AnchorRoom') ?? '';

    if (roomNumber != '') {
      roomNumber = ' - Room $roomNumber';
    }

    return AnchorDayPeriodInfo(className: className, roomNumber: roomNumber);

  }

  // Future<PeriodInfo> getBlockInfo() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   String? aBlock = prefs.getString('${periodNumber}AnchorClass');
  //   String? aBlockRoom = prefs.getString('${periodNumber}AnchorRoom');
  //   // String? bBlock = prefs.getString('${periodNumber}BClass');
  //   // String? bBlockRoom = prefs.getString('${periodNumber}BRoom');
  //   // String? cBlock = prefs.getString('${periodNumber}CClass');
  //   // String? cBlockRoom = prefs.getString('${periodNumber}CRoom');
  //   //String? lunchPeriod = prefs.getString('${periodNumber}lunch');
  //   bool hasCBlock = false;
  //   // if (lunchPeriod != null) {
  //   //   hasCBlock = true;
  //   //   if (lunchPeriod == 'A') {
  //   //     aBlock = 'Lunch';
  //   //   }
  //   //   if (lunchPeriod == 'B') {
  //   //     bBlock = 'Lunch';
  //   //   }
  //   //   if (lunchPeriod == 'C') {
  //   //     cBlock = 'Lunch';
  //   //   }
  //   // }
  //
  //   if (aBlockRoom != null && aBlockRoom != '') {
  //     aBlockRoom = ' - Room $aBlockRoom';
  //   }
  //   //
  //   // if (bBlockRoom != null && bBlockRoom != '') {
  //   //   bBlockRoom = ' - Room $bBlockRoom';
  //   // }
  //   //
  //   // if (hasCBlock) {
  //   //   if (cBlockRoom != null && cBlockRoom != '') {
  //   //     cBlockRoom = ' - Room $cBlockRoom';
  //   //   }
  //   // }
  //
  //   PeriodInfo periodInfoToReturn = PeriodInfo(
  //     aBlockClassName: aBlock ?? '',
  //     aBlockRoomNumber: aBlockRoom ?? '',
  //     bBlockClassName: '',
  //     bBlockRoomNumber: '',
  //     cBlockClassName: '',
  //     cBlockRoomNumber: '',
  //     hasCBlock: false,
  //   );
  //
  //   return periodInfoToReturn;
  // }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<AnchorDayPeriodInfo>(
      future: getBlock(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Text('${periodName()} Period'),
              Text.rich(
                TextSpan(text: '$periodNumber: ',
                    children: [
                      TextSpan(
                          text: '${snapshot.data!.className}${snapshot.data!.roomNumber}',
                          style: const TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ))
                    ]),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: NewTrierColors.yellow,
                ),
              ),
            ],
          );
        } else {
          return const Text('Loading...');
        }

      },
    );
  }
}


class AnchorDayLunchColumn extends StatelessWidget {

  final int lunchPeriod;
  //final int periodNumber;

  const AnchorDayLunchColumn({Key? key, required this.lunchPeriod}) : super(key: key);

  // String periodName() {
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

  Future<PeriodInfo> getBlockInfo() async {
    final prefs = await SharedPreferences.getInstance();
    String? aBlock = prefs.getString('${lunchPeriod}AAnchorClass');
    String? bBlock = prefs.getString('${lunchPeriod}BAnchorClass');
    String? cBlock = prefs.getString('${lunchPeriod}CAnchorClass');
    String? aBlockRoom = prefs.getString('${lunchPeriod}AAnchorRoom');
    String? bBlockRoom = prefs.getString('${lunchPeriod}BAnchorRoom');
    String? cBlockRoom = prefs.getString('${lunchPeriod}CAnchorRoom');
    // String? bBlock = prefs.getString('${periodNumber}bClass');
    // String? bBlockRoom = prefs.getString('${periodNumber}bRoom');
    // String? cBlock = prefs.getString('${periodNumber}cClass');
    // String? cBlockRoom = prefs.getString('${periodNumber}cRoom');
    // String? lunchPeriod = prefs.getString('4AnchorLunch');
    bool hasCBlock = true;
    // if (lunchPeriod != null) {
    //   if (lunchPeriod == 'A') {
    //     aBlock = 'Lunch';
    //   }
    //   if (lunchPeriod == 'B') {
    //     bBlock = 'Lunch';
    //   }
    //   if (lunchPeriod == 'C') {
    //     cBlock = 'Lunch';
    //   }
    // }

    if (aBlockRoom != null && aBlockRoom != '') {
      aBlockRoom = ' - Room $aBlockRoom';
    }

    if (bBlockRoom != null && bBlockRoom != '') {
      bBlockRoom = ' - Room $bBlockRoom';
    }

    if (hasCBlock) {
      if (cBlockRoom != null && cBlockRoom != '') {
        cBlockRoom = ' - Room $cBlockRoom';
      }
    }

    PeriodInfo periodInfoToReturn = PeriodInfo(
      aBlockClassName: aBlock ?? '',
      aBlockRoomNumber: aBlockRoom ?? '',
      bBlockClassName: bBlock ?? '',
      bBlockRoomNumber: bBlockRoom ?? '',
      cBlockClassName: cBlock ?? '',
      cBlockRoomNumber: cBlockRoom ?? '',
      hasCBlock: hasCBlock,
    );


    return periodInfoToReturn;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PeriodInfo>(
      future: getBlockInfo(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Text('${periodName()} Period'),
              Text.rich(
                TextSpan(text: '${lunchPeriod}A: ',
                    children: [
                      TextSpan(
                          text: '${snapshot.data!.aBlockClassName}${snapshot.data!.aBlockRoomNumber}',
                          style: const TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ))
                    ]),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: NewTrierColors.yellow,
                ),
              ),
              Text.rich(
                TextSpan(text: '${lunchPeriod}B: ',
                    children: [
                      TextSpan(
                          text: '${snapshot.data!.bBlockClassName}${snapshot.data!.bBlockRoomNumber}',
                          style: const TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ))
                    ]),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: NewTrierColors.yellow,
                ),
              ),
              //Text('${periodNumber}A: ${snapshot.data!.aBlockClassName}${snapshot.data!.aBlockRoomNumber}'),
              //Text('${periodNumber}B: ${snapshot.data!.bBlockClassName}${snapshot.data!.bBlockRoomNumber}'),
              Text.rich(
                TextSpan(text: '${lunchPeriod}C: ',
                    children: [
                      TextSpan(
                          text: '${snapshot.data!.cBlockClassName}${snapshot.data!.cBlockRoomNumber}',
                          style: const TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ))
                    ]),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: NewTrierColors.yellow,
                ),
              ),
            ],
          );
        } else {
          return const Text('Loading...');
        }

      },
    );
  }
}


class PeriodInfo {
  String aBlockClassName;
  String aBlockRoomNumber;
  String bBlockClassName;
  String bBlockRoomNumber;
  String? cBlockClassName;
  String? cBlockRoomNumber;
  bool hasCBlock;

  PeriodInfo({required this.aBlockClassName, required this.aBlockRoomNumber, required this.bBlockClassName, required this.bBlockRoomNumber, this.cBlockClassName, this.cBlockRoomNumber, this.hasCBlock = false});

  bool get isFullPeriodClass {

    if (aBlockClassName == bBlockClassName && cBlockClassName == null) {
      return true;
    } else {
      return false;
    }
  }
}

class AnchorDayPeriodInfo {
  String className;
  String roomNumber;

  AnchorDayPeriodInfo({required this.className, required this.roomNumber});
}

