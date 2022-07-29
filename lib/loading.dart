import 'package:flutter/material.dart';
import 'package:flutter_widgetkit/flutter_widgetkit.dart';
import 'package:nt_block_android/main.dart';
import 'package:nt_block_android/new_trier_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'bell_schedule.dart';



class LoadingWidget extends StatefulWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  _LoadingWidgetState createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> {
  
  var campus = Campus.winnetka;

  getSavedCampus() async {
    final prefs = await SharedPreferences.getInstance();
    final savedCampus = prefs.getString('campus') ?? 'Winnetka';
    if (savedCampus == 'Northfield') {
      campus = Campus.northfield;
    } else {
      campus = Campus.winnetka;
    }
  } 

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getSavedCampus(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return BellScheduleHome(savedCampus: campus,);
        } else if (snapshot.connectionState == ConnectionState.waiting) {
         return Material(
           child: Container(
              color: NewTrierColors.blue,
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Container(
                    height: 275,
                    width: 275,
                    color: NewTrierColors.green,
                    child: const Center(
                      child: Text('NT\nBLOCK',
                        textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 64.0,
                        height: 0.9,
                      ),),
                    ),
                  ),
                ),
              ),
            ),
         );
        } else {
          return BellScheduleHome(savedCampus: campus,);
        }
      },
    );
  }
}
