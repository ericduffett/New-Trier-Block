import 'package:timezone/timezone.dart' as tz;

enum Campus {
  winnetka,
  northfield
}

enum ScheduleType {
  regular,
  anchor,
  earlyDismissal,
  anchorEarlyDismissal, //TODO: Set dates when this applies
  openingDay,
  treviaDay, //TODO: Both Campuses - Check with Mike on date. Also - identity project?
  freshmanGTSN, //TODO: Bell schedule.
  lateStart,
  extendedAdv,
  testing,
  finals, //TODO: Set schedule type and update main graphics for finals.
}

final chicago = tz.getLocation('America/Chicago');


var startOfAdvisery = DateTime.now();
var endOfAdvisery = DateTime.now();
var start1A = DateTime.now();
var end1A = DateTime.now();
var start1B = DateTime.now();
var end1B = DateTime.now();
var start2A = DateTime.now();
var end2A = DateTime.now();
var start2B = DateTime.now();
var end2B = DateTime.now();
var start2C = DateTime.now();
var end2C = DateTime.now();
var start3A = DateTime.now();
var end3A = DateTime.now();
var start3B = DateTime.now();
var end3B = DateTime.now();
var start4A = DateTime.now();
var end4A = DateTime.now();
var start4B = DateTime.now();
var end4B = DateTime.now();
var anchor8Start = DateTime.now();
var anchor8End = DateTime.now();
var endOfDayAdvStart = DateTime.now();
var endOfDayAdvEnd = DateTime.now();

void setBellSchedule(Campus campus, ScheduleType scheduleType) {
  final today = DateTime.now();

  //If Campus == Winnetka
  if (campus == Campus.winnetka) {

    if (scheduleType == ScheduleType.regular) {
      startOfAdvisery =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 8, 20);
      endOfAdvisery =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 8, 45);
      start1A = tz.TZDateTime(chicago, today.year, today.month, today.day, 8, 50);
      end1A = tz.TZDateTime(chicago, today.year, today.month, today.day, 9, 30);
      start1B = tz.TZDateTime(chicago, today.year, today.month, today.day, 9, 35);
      end1B = tz.TZDateTime(chicago, today.year, today.month, today.day, 10, 15);
      start2A =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 10, 20);
      end2A = tz.TZDateTime(chicago, today.year, today.month, today.day, 11, 00);
      start2B =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 11, 05);
      end2B = tz.TZDateTime(chicago, today.year, today.month, today.day, 11, 45);
      start2C =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 11, 50);
      end2C = tz.TZDateTime(chicago, today.year, today.month, today.day, 12, 30);
      start3A =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 12, 35);
      end3A = tz.TZDateTime(chicago, today.year, today.month, today.day, 13, 15);
      start3B =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 13, 20);
      end3B = tz.TZDateTime(chicago, today.year, today.month, today.day, 14, 00);
      start4A =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 14, 05);
      end4A = tz.TZDateTime(chicago, today.year, today.month, today.day, 14, 45);
      start4B =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 14, 50);
      end4B = tz.TZDateTime(chicago, today.year, today.month, today.day, 15, 30);
    }
    else if (scheduleType == ScheduleType.anchor) {
      startOfAdvisery =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 8, 20);
      endOfAdvisery =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 8, 50);
      start1A = tz.TZDateTime(chicago, today.year, today.month, today.day, 8, 55);
      end1A = tz.TZDateTime(chicago, today.year, today.month, today.day, 9, 30);
      start1B = tz.TZDateTime(chicago, today.year, today.month, today.day, 9, 35);
      end1B = tz.TZDateTime(chicago, today.year, today.month, today.day, 10, 10);
      start2A =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 10, 15);
      end2A = tz.TZDateTime(chicago, today.year, today.month, today.day, 10, 50);
      start2B =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 10, 55);
      end2B = tz.TZDateTime(chicago, today.year, today.month, today.day, 11, 30);
      start2C =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 11, 35);
      end2C = tz.TZDateTime(chicago, today.year, today.month, today.day, 12, 10);
      start3A =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 12, 15);
      end3A = tz.TZDateTime(chicago, today.year, today.month, today.day, 12, 50);
      start3B =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 12, 55);
      end3B = tz.TZDateTime(chicago, today.year, today.month, today.day, 13, 30);
      start4A =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 13, 35);
      end4A = tz.TZDateTime(chicago, today.year, today.month, today.day, 14, 10);
      start4B =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 14, 15);
      end4B = tz.TZDateTime(chicago, today.year, today.month, today.day, 14, 50);
      anchor8Start =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 14, 55);
      anchor8End = tz.TZDateTime(chicago, today.year, today.month, today.day, 15, 30);

    }
    else if (scheduleType == ScheduleType.earlyDismissal) {
      startOfAdvisery =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 8, 20);
      endOfAdvisery =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 8, 45);
      start1A = tz.TZDateTime(chicago, today.year, today.month, today.day, 8, 50);
      end1A = tz.TZDateTime(chicago, today.year, today.month, today.day, 9, 10);
      start1B = tz.TZDateTime(chicago, today.year, today.month, today.day, 9, 15);
      end1B = tz.TZDateTime(chicago, today.year, today.month, today.day, 9, 35);
      start2A =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 9, 40);
      end2A = tz.TZDateTime(chicago, today.year, today.month, today.day, 10, 00);
      start2B =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 10, 05);
      end2B = tz.TZDateTime(chicago, today.year, today.month, today.day, 10, 25);
      start2C =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 10, 30);
      end2C = tz.TZDateTime(chicago, today.year, today.month, today.day, 10, 50);
      start3A =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 10, 55);
      end3A = tz.TZDateTime(chicago, today.year, today.month, today.day, 11, 15);
      start3B =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 11, 20);
      end3B = tz.TZDateTime(chicago, today.year, today.month, today.day, 11, 40);
      start4A =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 11, 45);
      end4A = tz.TZDateTime(chicago, today.year, today.month, today.day, 12, 05);
      start4B =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 12, 10);
      end4B = tz.TZDateTime(chicago, today.year, today.month, today.day, 12, 30);

    }
    else if (scheduleType == ScheduleType.anchorEarlyDismissal) {
      startOfAdvisery =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 8, 20);
      endOfAdvisery =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 8, 40);
      start1A = tz.TZDateTime(chicago, today.year, today.month, today.day, 8, 45);
      end1A = tz.TZDateTime(chicago, today.year, today.month, today.day, 9, 05);
      start1B = tz.TZDateTime(chicago, today.year, today.month, today.day, 9, 10);
      end1B = tz.TZDateTime(chicago, today.year, today.month, today.day, 9, 30);
      start2A =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 9, 35);
      end2A = tz.TZDateTime(chicago, today.year, today.month, today.day, 9, 55);
      start2B =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 10, 00);
      end2B = tz.TZDateTime(chicago, today.year, today.month, today.day, 10, 20);
      start2C =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 10, 25);
      end2C = tz.TZDateTime(chicago, today.year, today.month, today.day, 10, 45);
      start3A =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 10, 50);
      end3A = tz.TZDateTime(chicago, today.year, today.month, today.day, 11, 10);
      start3B =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 11, 15);
      end3B = tz.TZDateTime(chicago, today.year, today.month, today.day, 11, 35);
      start4A =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 11, 40);
      end4A = tz.TZDateTime(chicago, today.year, today.month, today.day, 12, 00);
      start4B =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 12, 05);
      end4B = tz.TZDateTime(chicago, today.year, today.month, today.day, 12, 25);
      anchor8Start =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 12, 30);
      anchor8End = tz.TZDateTime(chicago, today.year, today.month, today.day, 12, 50);
    }
    else if (scheduleType == ScheduleType.lateStart) {
      startOfAdvisery =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 11, 20);
      endOfAdvisery =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 11, 45);
      start1A = tz.TZDateTime(chicago, today.year, today.month, today.day, 11, 50);
      end1A = tz.TZDateTime(chicago, today.year, today.month, today.day, 12, 10);
      start1B = tz.TZDateTime(chicago, today.year, today.month, today.day, 12, 15);
      end1B = tz.TZDateTime(chicago, today.year, today.month, today.day, 12, 35);
      start2A =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 12, 40);
      end2A = tz.TZDateTime(chicago, today.year, today.month, today.day, 13, 00);
      start2B =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 13, 05);
      end2B = tz.TZDateTime(chicago, today.year, today.month, today.day, 13, 25);
      start2C =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 13, 30);
      end2C = tz.TZDateTime(chicago, today.year, today.month, today.day, 13, 50);
      start3A =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 13, 55);
      end3A = tz.TZDateTime(chicago, today.year, today.month, today.day, 14, 15);
      start3B =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 14, 20);
      end3B = tz.TZDateTime(chicago, today.year, today.month, today.day, 14, 40);
      start4A =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 14, 45);
      end4A = tz.TZDateTime(chicago, today.year, today.month, today.day, 15, 05);
      start4B =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 15, 10);
      end4B = tz.TZDateTime(chicago, today.year, today.month, today.day, 15, 30);

    }
    else if (scheduleType == ScheduleType.extendedAdv) {
      startOfAdvisery =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 8, 20);
      endOfAdvisery =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 9, 15);
      start1A = tz.TZDateTime(chicago, today.year, today.month, today.day, 9, 20);
      end1A = tz.TZDateTime(chicago, today.year, today.month, today.day, 9, 55);
      start1B = tz.TZDateTime(chicago, today.year, today.month, today.day, 10, 00);
      end1B = tz.TZDateTime(chicago, today.year, today.month, today.day, 10, 35);
      start2A =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 10, 40);
      end2A = tz.TZDateTime(chicago, today.year, today.month, today.day, 11, 20);
      start2B =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 11, 25);
      end2B = tz.TZDateTime(chicago, today.year, today.month, today.day, 12, 05);
      start2C =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 12, 10);
      end2C = tz.TZDateTime(chicago, today.year, today.month, today.day, 12, 50);
      start3A =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 12, 55);
      end3A = tz.TZDateTime(chicago, today.year, today.month, today.day, 13, 30);
      start3B =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 13, 35);
      end3B = tz.TZDateTime(chicago, today.year, today.month, today.day, 14, 10);
      start4A =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 14, 15);
      end4A = tz.TZDateTime(chicago, today.year, today.month, today.day, 14, 50);
      start4B =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 14, 55);
      end4B = tz.TZDateTime(chicago, today.year, today.month, today.day, 15, 30);
    }
    else if (scheduleType == ScheduleType.openingDay) {
      startOfAdvisery =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 8, 20);
      endOfAdvisery =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 10, 10);
      start1A = tz.TZDateTime(chicago, today.year, today.month, today.day, 10, 15);
      end1A = tz.TZDateTime(chicago, today.year, today.month, today.day, 10, 40);
      start1B = tz.TZDateTime(chicago, today.year, today.month, today.day, 10, 45);
      end1B = tz.TZDateTime(chicago, today.year, today.month, today.day, 11, 10);
      start2A =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 11, 15);
      end2A = tz.TZDateTime(chicago, today.year, today.month, today.day, 11, 40);
      start2B =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 11, 45);
      end2B = tz.TZDateTime(chicago, today.year, today.month, today.day, 12, 10);
      start2C =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 12, 15);
      end2C = tz.TZDateTime(chicago, today.year, today.month, today.day, 12, 40);
      start3A =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 12, 45);
      end3A = tz.TZDateTime(chicago, today.year, today.month, today.day, 13, 10);
      start3B =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 13, 15);
      end3B = tz.TZDateTime(chicago, today.year, today.month, today.day, 13, 40);
      start4A =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 13, 45);
      end4A = tz.TZDateTime(chicago, today.year, today.month, today.day, 14, 10);
      start4B =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 14, 15);
      end4B = tz.TZDateTime(chicago, today.year, today.month, today.day, 14, 40);
      anchor8Start =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 14, 45);
      anchor8End = tz.TZDateTime(chicago, today.year, today.month, today.day, 15, 10);
      endOfDayAdvStart =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 15, 15);
      endOfDayAdvEnd = tz.TZDateTime(chicago, today.year, today.month, today.day, 15, 30);
    }

  }

  //Northfield Campus
  if (campus == Campus.northfield) {

    if (scheduleType == ScheduleType.regular) {
      startOfAdvisery =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 8, 00);
      endOfAdvisery =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 8, 25);
      start1A = tz.TZDateTime(chicago, today.year, today.month, today.day, 8, 30);
      end1A = tz.TZDateTime(chicago, today.year, today.month, today.day, 9, 10);
      start1B = tz.TZDateTime(chicago, today.year, today.month, today.day, 9, 15);
      end1B = tz.TZDateTime(chicago, today.year, today.month, today.day, 9, 55);
      start2A =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 10, 00);
      end2A = tz.TZDateTime(chicago, today.year, today.month, today.day, 10, 40);
      start2B =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 10, 45);
      end2B = tz.TZDateTime(chicago, today.year, today.month, today.day, 11, 25);
      start2C =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 11, 30);
      end2C = tz.TZDateTime(chicago, today.year, today.month, today.day, 12, 10);
      start3A =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 12, 15);
      end3A = tz.TZDateTime(chicago, today.year, today.month, today.day, 12, 55);
      start3B =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 13, 00);
      end3B = tz.TZDateTime(chicago, today.year, today.month, today.day, 13, 40);
      start4A =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 13, 45);
      end4A = tz.TZDateTime(chicago, today.year, today.month, today.day, 14, 25);
      start4B =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 14, 30);
      end4B = tz.TZDateTime(chicago, today.year, today.month, today.day, 15, 10);
    }
    else if(scheduleType == ScheduleType.anchor) {
      startOfAdvisery =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 8, 00);
      endOfAdvisery =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 8, 30);
      start1A = tz.TZDateTime(chicago, today.year, today.month, today.day, 8, 35);
      end1A = tz.TZDateTime(chicago, today.year, today.month, today.day, 9, 10);
      start1B = tz.TZDateTime(chicago, today.year, today.month, today.day, 9, 15);
      end1B = tz.TZDateTime(chicago, today.year, today.month, today.day, 9, 50);
      start2A =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 9, 55);
      end2A = tz.TZDateTime(chicago, today.year, today.month, today.day, 10, 30);
      start2B =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 10, 35);
      end2B = tz.TZDateTime(chicago, today.year, today.month, today.day, 11, 10);
      start2C =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 11, 15);
      end2C = tz.TZDateTime(chicago, today.year, today.month, today.day, 11, 50);
      start3A =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 11, 55);
      end3A = tz.TZDateTime(chicago, today.year, today.month, today.day, 12, 30);
      start3B =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 12, 35);
      end3B = tz.TZDateTime(chicago, today.year, today.month, today.day, 13, 10);
      start4A =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 13, 15);
      end4A = tz.TZDateTime(chicago, today.year, today.month, today.day, 13, 50);
      start4B =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 13, 55);
      end4B = tz.TZDateTime(chicago, today.year, today.month, today.day, 14, 30);
      anchor8Start =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 14, 35);
      anchor8End = tz.TZDateTime(chicago, today.year, today.month, today.day, 15, 10);
    }
    else if (scheduleType == ScheduleType.earlyDismissal) {
      startOfAdvisery =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 8, 00);
      endOfAdvisery =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 8, 25);
      start1A = tz.TZDateTime(chicago, today.year, today.month, today.day, 8, 30);
      end1A = tz.TZDateTime(chicago, today.year, today.month, today.day, 8, 50);
      start1B = tz.TZDateTime(chicago, today.year, today.month, today.day, 8, 55);
      end1B = tz.TZDateTime(chicago, today.year, today.month, today.day, 9, 15);
      start2A =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 9, 20);
      end2A = tz.TZDateTime(chicago, today.year, today.month, today.day, 9, 40);
      start2B =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 9, 45);
      end2B = tz.TZDateTime(chicago, today.year, today.month, today.day, 10, 05);
      start2C =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 10, 10);
      end2C = tz.TZDateTime(chicago, today.year, today.month, today.day, 10, 30);
      start3A =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 10, 35);
      end3A = tz.TZDateTime(chicago, today.year, today.month, today.day, 10, 55);
      start3B =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 11, 00);
      end3B = tz.TZDateTime(chicago, today.year, today.month, today.day, 11, 20);
      start4A =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 11, 25);
      end4A = tz.TZDateTime(chicago, today.year, today.month, today.day, 11, 45);
      start4B =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 11, 50);
      end4B = tz.TZDateTime(chicago, today.year, today.month, today.day, 12, 10);

    }
    else if (scheduleType == ScheduleType.anchorEarlyDismissal) {
      startOfAdvisery =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 8, 00);
      endOfAdvisery =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 8, 20);
      start1A = tz.TZDateTime(chicago, today.year, today.month, today.day, 8, 25);
      end1A = tz.TZDateTime(chicago, today.year, today.month, today.day, 8, 45);
      start1B = tz.TZDateTime(chicago, today.year, today.month, today.day, 8, 50);
      end1B = tz.TZDateTime(chicago, today.year, today.month, today.day, 9, 10);
      start2A =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 9, 15);
      end2A = tz.TZDateTime(chicago, today.year, today.month, today.day, 9, 35);
      start2B =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 9, 40);
      end2B = tz.TZDateTime(chicago, today.year, today.month, today.day, 10, 00);
      start2C =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 10, 05);
      end2C = tz.TZDateTime(chicago, today.year, today.month, today.day, 10, 25);
      start3A =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 10, 30);
      end3A = tz.TZDateTime(chicago, today.year, today.month, today.day, 10, 50);
      start3B =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 10, 55);
      end3B = tz.TZDateTime(chicago, today.year, today.month, today.day, 11, 15);
      start4A =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 11, 20);
      end4A = tz.TZDateTime(chicago, today.year, today.month, today.day, 11, 40);
      start4B =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 11, 45);
      end4B = tz.TZDateTime(chicago, today.year, today.month, today.day, 12, 05);
      anchor8Start =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 12, 10);
      anchor8End = tz.TZDateTime(chicago, today.year, today.month, today.day, 12, 30);
    }
    else if (scheduleType == ScheduleType.lateStart) {
      startOfAdvisery =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 11, 00);
      endOfAdvisery =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 11, 25);
      start1A = tz.TZDateTime(chicago, today.year, today.month, today.day, 11, 30);
      end1A = tz.TZDateTime(chicago, today.year, today.month, today.day, 11, 50);
      start1B = tz.TZDateTime(chicago, today.year, today.month, today.day, 11, 55);
      end1B = tz.TZDateTime(chicago, today.year, today.month, today.day, 12, 15);
      start2A =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 12, 20);
      end2A = tz.TZDateTime(chicago, today.year, today.month, today.day, 12, 40);
      start2B =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 12, 45);
      end2B = tz.TZDateTime(chicago, today.year, today.month, today.day, 13, 05);
      start2C =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 13, 10);
      end2C = tz.TZDateTime(chicago, today.year, today.month, today.day, 13, 30);
      start3A =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 13, 35);
      end3A = tz.TZDateTime(chicago, today.year, today.month, today.day, 13, 55);
      start3B =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 14, 00);
      end3B = tz.TZDateTime(chicago, today.year, today.month, today.day, 14, 20);
      start4A =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 14, 25);
      end4A = tz.TZDateTime(chicago, today.year, today.month, today.day, 14, 45);
      start4B =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 14, 50);
      end4B = tz.TZDateTime(chicago, today.year, today.month, today.day, 15, 10);

    }
    else if (scheduleType == ScheduleType.extendedAdv) {

      startOfAdvisery =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 8, 00);
      endOfAdvisery =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 8, 55);
      start1A = tz.TZDateTime(chicago, today.year, today.month, today.day, 9, 00);
      end1A = tz.TZDateTime(chicago, today.year, today.month, today.day, 9, 35);
      start1B = tz.TZDateTime(chicago, today.year, today.month, today.day, 9, 40);
      end1B = tz.TZDateTime(chicago, today.year, today.month, today.day, 10, 15);
      start2A =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 10, 20);
      end2A = tz.TZDateTime(chicago, today.year, today.month, today.day, 10, 55);
      start2B =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 11, 00);
      end2B = tz.TZDateTime(chicago, today.year, today.month, today.day, 11, 35);
      start2C =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 11, 40);
      end2C = tz.TZDateTime(chicago, today.year, today.month, today.day, 12, 20);
      start3A =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 12, 25);
      end3A = tz.TZDateTime(chicago, today.year, today.month, today.day, 13, 05);
      start3B =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 13, 10);
      end3B = tz.TZDateTime(chicago, today.year, today.month, today.day, 13, 50);
      start4A =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 13, 55);
      end4A = tz.TZDateTime(chicago, today.year, today.month, today.day, 14, 30);
      start4B =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 14, 35);
      end4B = tz.TZDateTime(chicago, today.year, today.month, today.day, 15, 10);
    }
    else if (scheduleType == ScheduleType.openingDay) {
      startOfAdvisery =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 8, 00);
      endOfAdvisery =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 11, 10);
      start1A = tz.TZDateTime(chicago, today.year, today.month, today.day, 11, 15);
      end1A = tz.TZDateTime(chicago, today.year, today.month, today.day, 11, 40);
      start1B = tz.TZDateTime(chicago, today.year, today.month, today.day, 11, 45);
      end1B = tz.TZDateTime(chicago, today.year, today.month, today.day, 12, 10);
      start2A =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 12, 15);
      end2A = tz.TZDateTime(chicago, today.year, today.month, today.day, 12, 40);
      start2B =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 12, 45);
      end2B = tz.TZDateTime(chicago, today.year, today.month, today.day, 13, 10);
      start2C =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 12, 45);
      end2C = tz.TZDateTime(chicago, today.year, today.month, today.day, 13, 10);
      start3A =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 12, 45); //TODO: Figure out how to get rid of ABC lunch at NF
      end3A = tz.TZDateTime(chicago, today.year, today.month, today.day, 13, 10);
      start3B =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 13, 15); //TODO: Figure out how to get rid of ABC lunch at NF
      end3B = tz.TZDateTime(chicago, today.year, today.month, today.day, 13, 40);
      start4A =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 13, 45);
      end4A = tz.TZDateTime(chicago, today.year, today.month, today.day, 14, 10);
      start4B =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 14, 15);
      end4B = tz.TZDateTime(chicago, today.year, today.month, today.day, 14, 40);
      anchor8Start =
          tz.TZDateTime(chicago, today.year, today.month, today.day, 14, 45);
      anchor8End = tz.TZDateTime(chicago, today.year, today.month, today.day, 15, 10);
     //Don't need end of day advisery at Northfield.
    }
    else if (scheduleType == ScheduleType.freshmanGTSN) {
      //TODO: Bell schedule hasn't been released yet.
    }

  }
}



