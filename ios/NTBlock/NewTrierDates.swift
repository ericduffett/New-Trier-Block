//
//  NewTrierDates.swift
//  NT Block Schedule
//
//  Created by Duffett, Eric on 12/10/21.
//

import UIKit

var calendar = Calendar(identifier: .gregorian)

//Define Holidays
let holiday0 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 9, day: 5))
let holiday1 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 9, day: 23))
let holiday2 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 9, day: 26))
let holiday3 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 10, day: 5))
let holiday4 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 11, day: 8))
let holiday5 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 11, day: 10))
let holiday6 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 11, day: 11))
let holiday7 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 11, day: 23))
let holiday8 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 11, day: 24))
let holiday9 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 11, day: 25))
let holiday10 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 12, day: 21))
let holiday11 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 12, day: 23))
let holiday12 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 12, day: 26))
let holiday13 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 12, day: 27))
let holiday14 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 12, day: 28))
let holiday15 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 12, day: 29))
let holiday16 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 12, day: 30))
let holiday17 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2023, month: 1, day: 2))
let holiday18 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2023, month: 1, day: 3))
let holiday19 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2023, month: 1, day: 4))
let holiday20 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2023, month: 1, day: 5))
let holiday21 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2023, month: 1, day: 6))
let holiday22 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2023, month: 1, day: 16))
let holiday23 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2023, month: 2, day: 17))
let holiday24 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2023, month: 2, day: 20))
let holiday25 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2023, month: 3, day: 27))
let holiday26 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2023, month: 3, day: 28))
let holiday27 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2023, month: 3, day: 29))
let holiday28 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2023, month: 3, day: 30))
let holiday29 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2023, month: 3, day: 31))
let holiday30 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2023, month: 4, day: 7))
let holiday31 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2023, month: 5, day: 29))
let holiday32 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2023, month: 6, day: 8))


//Holiday for testing
let holiday99 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2021, month: 9, day: 3))

let holidays = [holiday0, holiday1, holiday2, holiday3, holiday4, holiday5, holiday6, holiday7, holiday8, holiday9, holiday10, holiday11, holiday12, holiday13, holiday14, holiday15, holiday16, holiday17, holiday18, holiday19, holiday20, holiday21, holiday22, holiday23, holiday24, holiday25, holiday26, holiday27, holiday28, holiday29, holiday30, holiday31, holiday32, holiday99]


/*
 //Define days off for students that may not be for staff
 let gradingDay1 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2023, month: 6, day: 8))
 let gradingDay99 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 6, day: 10))
 
 let gradingDays = [gradingDay1, gradingDay99]
 
 
 let institute1 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 11, day: 11))
 
 
 //Add another grading day
 let makeUpDay1 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 1, day: 20))
 
 //Add more specificity to breaks
 let winterBreak1 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2021, month: 12, day: 17))
 let winterBreak2 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2021, month: 12, day: 20))
 let winterBreak3 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2021, month: 12, day: 21))
 let winterBreak4 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2021, month: 12, day: 22))
 let winterBreak5 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2021, month: 12, day: 23))
 let winterBreak6 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2021, month: 12, day: 24))
 let winterBreak7 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2021, month: 12, day: 27))
 let winterBreak8 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2021, month: 12, day: 28))
 let winterBreak9 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2021, month: 12, day: 29))
 let winterBreak10 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2021, month: 12, day: 30))
 let winterBreak11 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2021, month: 12, day: 31))
 
 let winterBreak = [
 winterBreak1,
 winterBreak2,
 winterBreak3,
 winterBreak4,
 winterBreak5,
 winterBreak6,
 winterBreak7,
 winterBreak8,
 winterBreak9,
 winterBreak10,
 winterBreak11,
 ]
 
 //Spring Break
 
 let springBreak1 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 3, day: 28))
 let springBreak2 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 3, day: 29))
 let springBreak3 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 3, day: 30))
 let springBreak4 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 3, day: 31))
 let springBreak5 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 4, day: 1))
 
 let springBreak = [
 springBreak1,
 springBreak2,
 springBreak3,
 springBreak4,
 springBreak5
 ]
 
 
 */

//Define Final Exams
let finals0 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 12, day: 19))
let finals1 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 12, day: 20))
//let finals2 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 1, day: 19))
//let finals3 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 1, day: 20))
let finals2 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2023, month: 6, day: 6))
let finals3 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2023, month: 6, day: 7))
//let finals6 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 6, day: 9))
let finals99 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2021, month: 12, day: 12))

let finalExamDays = [finals0, finals1, finals2, finals3, finals99]

//Define Blue Days
let blue0 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 8, day: 23))
let blue1 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 8, day: 25))
let blue2 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 8, day: 29))
let blue3 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 9, day: 1))
let blue4 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 9, day: 6))
let blue5 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 9, day: 8))
let blue6 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 9, day: 12))
let blue7 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 9, day: 15))
let blue8 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 9, day: 19))
let blue9 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 9, day: 21))
let blue10 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 9, day: 27))
let blue11 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 9, day: 29))
let blue12 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 10, day: 3))
let blue13 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 10, day: 6))
let blue14 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 10, day: 10))
let blue15 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 10, day: 13))
let blue16 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 10, day: 17))
let blue17 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 10, day: 20))
let blue18 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 10, day: 24))
let blue19 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 10, day: 27))
let blue20 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 10, day: 31))
let blue21 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 11, day: 3))
let blue22 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 11, day: 7))
let blue23 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 11, day: 14))
let blue24 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 11, day: 17))
let blue25 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 11, day: 21))
let blue26 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 12, day: 28))
let blue27 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 12, day: 1))
let blue28 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 12, day: 5))
let blue29 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 12, day: 8))
let blue30 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 12, day: 12))
let blue31 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 12, day: 15))
let blue32 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2023, month: 1, day: 10))
let blue33 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2023, month: 1, day: 12))
let blue34 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2023, month: 1, day: 17))
let blue35 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2023, month: 1, day: 19))
let blue36 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2023, month: 1, day: 23))
let blue37 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2023, month: 1, day: 26))
let blue38 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2023, month: 1, day: 30))
let blue39 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2023, month: 2, day: 2))
let blue40 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2023, month: 2, day: 6))
let blue41 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2023, month: 2, day: 9))
let blue42 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2023, month: 2, day: 13))
let blue43 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2023, month: 2, day: 15))
let blue44 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2023, month: 2, day: 21))
let blue45 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2023, month: 2, day: 23))
let blue46 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2023, month: 2, day: 27))
let blue47 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2023, month: 3, day: 2))
let blue48 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2023, month: 3, day: 6))
let blue49 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2023, month: 3, day: 9))
let blue50 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2023, month: 3, day: 13))
let blue51 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2023, month: 3, day: 16))
let blue52 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2023, month: 3, day: 20))
let blue53 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2023, month: 3, day: 23))
let blue54 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2023, month: 4, day: 3))
let blue55 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2023, month: 4, day: 5))
let blue56 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2023, month: 4, day: 10))
let blue57 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2023, month: 4, day: 13))
let blue58 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2023, month: 4, day: 17))
let blue59 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2023, month: 4, day: 20))
let blue60 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2023, month: 4, day: 24))
let blue61 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2023, month: 4, day: 27))
let blue62 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2023, month: 5, day: 1))
let blue63 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2023, month: 5, day: 4))
let blue64 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2023, month: 5, day: 8))
let blue65 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2023, month: 5, day: 11))
let blue66 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2023, month: 5, day: 15))
let blue67 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2023, month: 5, day: 18))
let blue68 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2023, month: 5, day: 22))
let blue69 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2023, month: 5, day: 25))
let blue70 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2023, month: 5, day: 30))
let blue71 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2023, month: 6, day: 1))
let blue99 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 7, day: 28))


let blueDays = [
    blue0,
    blue1,
    blue2,
    blue3,
    blue4,
    blue5,
    blue6,
    blue7,
    blue8,
    blue9,
    blue10,
    blue11,
    blue12,
    blue13,
    blue14,
    blue15,
    blue16,
    blue17,
    blue18,
    blue19,
    blue20,
    blue21,
    blue22,
    blue23,
    blue24,
    blue25,
    blue26,
    blue27,
    blue28,
    blue29,
    blue30,
    blue31,
    blue32,
    blue33,
    blue34,
    blue35,
    blue36,
    blue37,
    blue38,
    blue39,
    blue40,
    blue41,
    blue42,
    blue43,
    blue44,
    blue45,
    blue46,
    blue47,
    blue48,
    blue49,
    blue50,
    blue51,
    blue52,
    blue53,
    blue54,
    blue55,
    blue56,
    blue57,
    blue58,
    blue59,
    blue60,
    blue61,
    blue62,
    blue63,
    blue64,
    blue65,
    blue66,
    blue67,
    blue68,
    blue69,
    blue70,
    blue71,
    blue99,
]



//Define anchor days
let openingDay = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 8, day: 22))
let anchor1 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 8, day: 31))
let anchor2 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 9, day: 14))
let anchor3 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 10, day: 12))
let anchor4 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 10, day: 19))
let anchor5 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 10, day: 26))
let anchor6 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 11, day: 2))
let anchor7 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 11, day: 16))
let anchor8 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 11, day: 30))
let anchor9 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 12, day: 7))
let anchor10 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 12, day: 14))
let anchor11 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 12, day: 22))
let anchor12 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2023, month: 1, day: 9))
let anchor13 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2023, month: 1, day: 25))
let anchor14 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2023, month: 2, day: 1))
let anchor15 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2023, month: 2, day: 8))
let anchor16 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2023, month: 3, day: 1))
let anchor17 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2023, month: 3, day: 8))
let anchor18 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2023, month: 3, day: 15))
let anchor19 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2023, month: 3, day: 22))
let anchor20 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2023, month: 4, day: 12))
let anchor21 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2023, month: 4, day: 19))
let anchor22 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2023, month: 4, day: 26))
let anchor23 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2023, month: 5, day: 3))
let anchor24 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2023, month: 5, day: 10))
let anchor25 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2023, month: 5, day: 17))
let anchor26 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2023, month: 5, day: 24))
let anchor27 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2023, month: 6, day: 5))
let anchor28 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2023, month: 6, day: 9))
let anchor99 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 7, day: 22))

let anchorDays = [
    //anchor0, Opening Day of school needs to be own thing.
    anchor1,
    anchor2,
    anchor3,
    anchor4,
    anchor5,
    anchor6,
    anchor7,
    anchor8,
    anchor9,
    anchor10,
    anchor11,
    anchor12,
    anchor13,
    anchor14,
    anchor15,
    anchor16,
    anchor17,
    anchor18,
    anchor19,
    anchor20,
    anchor21,
    anchor22,
    anchor23,
    anchor24,
    anchor25,
    anchor26,
    anchor27,
    anchor28,
    anchor99,
]

//Define late start and early dismissals
//TODO: Make sure widget knows difference between anchor early and blue/green early.
let early1 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 10, day: 14))
let early2 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 11, day: 9))
let early3 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 12, day: 1))
let early4 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 12, day: 2))

let early5 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2023, month: 1, day: 9))
let early6 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2023, month: 3, day: 16))
let early7 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2023, month: 3, day: 17))
let early8 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2023, month: 4, day: 20))
let early9 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2023, month: 4, day: 21))
let early10 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2023, month: 6, day: 9))
let early99 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 7, day: 28))

let earlyDismissals = [early1, early2, early3, early4, early5, early6, early7, early8, early9, early10, early99]

let late1 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 10, day: 13))
let late99 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 7, day: 27))

let lateStarts = [late1, late99]


//TODO: When are these in 2022-2023?
let extendedAdv1 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 1, day: 31))
let extendedAdv2 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 2, day: 7))
let extendedAdv3 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 2, day: 16))
let extendedAdv4 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 4, day: 20))
let extendedAdv99 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 1, day: 3))


let extendedAdviseries = [extendedAdv1, extendedAdv2, extendedAdv3, extendedAdv4, extendedAdv99]
