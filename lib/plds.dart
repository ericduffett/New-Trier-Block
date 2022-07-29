import 'package:timezone/timezone.dart' as tz;

final chicago = tz.getLocation('America/Chicago');


//Applied Arts PLTs
final aa0 = tz.TZDateTime(chicago, 2022, 8, 31);
final aa1 = tz.TZDateTime(chicago, 2022, 11, 30);
final aa2 = tz.TZDateTime(chicago, 2023, 1, 25);
final aa3 = tz.TZDateTime(chicago, 2023, 4, 26);
final aa99 = tz.TZDateTime(chicago, 2022, 7, 8);

final aaPLTs = [
  aa0,
  aa1,
  aa2,
  aa3,
  aa99,
];

//Art PLTs
final art0 = tz.TZDateTime(chicago, 2022, 10, 26);
final art1 = tz.TZDateTime(chicago, 2022, 12, 7);
final art2 = tz.TZDateTime(chicago, 2023, 3, 15);
final art3 = tz.TZDateTime(chicago, 2023, 6, 5);

final artPLTs = [
  art0,
  art1,
  art2,
  art3,
];

//Business PLTs

final business0 = tz.TZDateTime(chicago, 2022, 10, 19);
final business1 = tz.TZDateTime(chicago, 2022, 12, 14);
final business2 = tz.TZDateTime(chicago, 2023, 3, 8);
final business3 = tz.TZDateTime(chicago, 2023, 5, 10);
final business99 = tz.TZDateTime(chicago, 2022, 7, 12);

final businessPLTs = [
  business0,
  business1,
  business2,
  business3,
  business99,
];

//Music & Theatre PLTs
final music0 = tz.TZDateTime(chicago, 2022, 9, 14);
final music1 = tz.TZDateTime(chicago, 2022, 11, 30);
final music2 = tz.TZDateTime(chicago, 2023, 3, 1);
final music3 = tz.TZDateTime(chicago, 2023, 5, 24);

final musicPLTs = [
  music0,
  music1,
  music2,
  music3,
];


//English PLTs

final english0 = tz.TZDateTime(chicago, 2022, 8, 31);
final english1 = tz.TZDateTime(chicago, 2022, 11, 16);
final english2 = tz.TZDateTime(chicago, 2023, 2, 8);
final english3 = tz.TZDateTime(chicago, 2023, 4, 19);

final englishPLTs = [
  english0,
  english1,
  english2,
  english3,
];

//KW PLDs

final kw0 = tz.TZDateTime(chicago, 2022, 11, 2);
final kw1 = tz.TZDateTime(chicago, 2023, 2, 1);
final kw2 = tz.TZDateTime(chicago, 2023, 4, 12);
final kw3 = tz.TZDateTime(chicago, 2023, 6, 5);

final kwPLTs = [
  kw0,
  kw1,
  kw2,
  kw3,
];

//MCL PLTs

final mcl0 = tz.TZDateTime(chicago, 2022, 9, 14);
final mcl1 = tz.TZDateTime(chicago, 2022, 11, 30);
final mcl2 = tz.TZDateTime(chicago, 2023, 2, 1);
final mcl3 = tz.TZDateTime(chicago, 2023, 4, 26);

final mclPLTs = [
  mcl0,
  mcl1,
  mcl2,
  mcl3,
];

//Math PLTs

final math0 = tz.TZDateTime(chicago, 2022, 10, 26);
final math1 = tz.TZDateTime(chicago, 2023, 1, 25);
final math2 = tz.TZDateTime(chicago, 2023, 3, 15);
final math3 = tz.TZDateTime(chicago, 2023, 5, 3);

final mathPLTs = [
  math0,
  math1,
  math2,
  math3,
];


//Science PLDs

final science0 = tz.TZDateTime(chicago, 2022, 11, 2);
final science1 = tz.TZDateTime(chicago, 2022, 12, 14);
final science2 = tz.TZDateTime(chicago, 2023, 3, 1);
final science3 = tz.TZDateTime(chicago, 2023, 5, 3);

final sciencePLDs = [
  science0,
  science1,
  science2,
  science3,
];

//Social Studies PLTs

final socialStudies0 = tz.TZDateTime(chicago, 2022, 10, 19);
final socialStudies1 = tz.TZDateTime(chicago, 2022, 12, 7);
final socialStudies2 = tz.TZDateTime(chicago, 2023, 3, 8);
final socialStudies3 = tz.TZDateTime(chicago, 2023, 5, 10);

final ssPLTs = [
  socialStudies0,
  socialStudies1,
  socialStudies2,
  socialStudies3,
];

//Special Education PLTs

final specialEd0 = tz.TZDateTime(chicago, 2022, 11, 16);
final specialEd1 = tz.TZDateTime(chicago, 2023, 2, 1);
final specialEd2 = tz.TZDateTime(chicago, 2023, 3, 22);
final specialEd3 = tz.TZDateTime(chicago, 2023, 5, 24);

final specialEdPLTs = [
  specialEd0,
  specialEd1,
  specialEd2,
  specialEd3,
];


final allPLT0 = tz.TZDateTime(chicago, 2022, 8, 31);
final allPLT1 = tz.TZDateTime(chicago, 2022, 9, 14);
final allPLT2 = tz.TZDateTime(chicago, 2022, 10, 19);
final allPLT3 = tz.TZDateTime(chicago, 2022, 10, 26);
final allPLT4 = tz.TZDateTime(chicago, 2022, 11, 2);
final allPLT5 = tz.TZDateTime(chicago, 2022, 11, 16);
final allPLT6 = tz.TZDateTime(chicago, 2022, 11, 30);
final allPLT7 = tz.TZDateTime(chicago, 2022, 12, 7);
final allPLT8 = tz.TZDateTime(chicago, 2022, 12, 14);
final allPLT9 = tz.TZDateTime(chicago, 2023, 1, 25);
final allPLT10 = tz.TZDateTime(chicago, 2023, 2, 1);
final allPLT11 = tz.TZDateTime(chicago, 2023, 2, 8);
final allPLT12 = tz.TZDateTime(chicago, 2023, 3, 1);
final allPLT13 = tz.TZDateTime(chicago, 2023, 3, 8);
final allPLT14 = tz.TZDateTime(chicago, 2023, 3, 15);
final allPLT15 = tz.TZDateTime(chicago, 2023, 3, 22);
final allPLT16 = tz.TZDateTime(chicago, 2023, 4, 12);
final allPLT17 = tz.TZDateTime(chicago, 2023, 4, 19);
final allPLT18 = tz.TZDateTime(chicago, 2023, 4, 26);
final allPLT19 = tz.TZDateTime(chicago, 2023, 5, 3);
final allPLT20 = tz.TZDateTime(chicago, 2023, 5, 10);
final allPLT21 = tz.TZDateTime(chicago, 2023, 5, 24);
final allPLT22 = tz.TZDateTime(chicago, 2023, 6, 5);
final allPLT99 = tz.TZDateTime(chicago, 2022, 7, 12);

final allPLTs = [
  allPLT0,
  allPLT1,
  allPLT2,
  allPLT3,
  allPLT4,
  allPLT5,
  allPLT6,
  allPLT7,
  allPLT8,
  allPLT9,
  allPLT10,
  allPLT11,
  allPLT12,
  allPLT13,
  allPLT14,
  allPLT15,
  allPLT16,
  allPLT17,
  allPLT18,
  allPLT19,
  allPLT20,
  allPLT21,
  allPLT22,
  allPLT99
];



