////
////  PLDs.swift
////  NT Block Schedule
////
////  Created by Duffett, Eric on 12/10/21.
////
//
//import UIKit
//
//
//

////Elective PLDs
//
//let electivePLD1 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 2, day: 9))!
//let electivePLD2 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 2, day: 10))!
//let electivePLD3 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 3, day: 7))!
//let electivePLD4 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 3, day: 8))!
//let electivePLD5 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 3, day: 21))!
//let electivePLD6 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 3, day: 22))!
//let electivePLD7 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 4, day: 21))!
//let electivePLD8 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 4, day: 26))!
//let electivePLD9 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 5, day: 11))!
//let electivePLD10 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 5, day: 12))!
//let electivePLD99 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2021, month: 12, day: 20))!
//
//let electivePLDs = [
//    electivePLD1,
//    electivePLD2,
//    electivePLD3,
//    electivePLD4,
//    electivePLD5,
//    electivePLD6,
//    electivePLD7,
//    electivePLD8,
//    electivePLD9,
//    electivePLD10,
//    electivePLD99
//]
//
////English PLDs
//
//let englishPLD1 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 1, day: 24))!
//let englishPLD2 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 1, day: 25))!
//let englishPLD3 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 2, day: 11))!
//let englishPLD4 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 2, day: 14))!
//let englishPLD5 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 3, day: 9))!
//let englishPLD6 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 3, day: 10))!
//let englishPLD7 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 4, day: 7))!
//let englishPLD8 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 4, day: 8))!
//let englishPLD9 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 5, day: 5))!
//let englishPLD10 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 5, day: 6))!
//let englishPLD11 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 5, day: 27))!
//let englishPLD12 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 5, day: 31))!
//let englishPLD99 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 1, day: 10))!
//
//let englishPLDs = [
//    englishPLD1,
//    englishPLD2,
//    englishPLD3,
//    englishPLD4,
//    englishPLD5,
//    englishPLD6,
//    englishPLD7,
//    englishPLD8,
//    englishPLD9,
//    englishPLD10,
//    englishPLD11,
//    englishPLD12,
//    englishPLD99
//]
//
////KW PLDs
//
//let kwPLD1 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 2, day: 7))!
//let kwPLD2 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 2, day: 8))!
//let kwPLD3 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 3, day: 15))!
//let kwPLD4 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 3, day: 16))!
//let kwPLD5 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 3, day: 25))!
//let kwPLD6 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 4, day: 4))!
//let kwPLD7 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 4, day: 29))!
//let kwPLD8 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 5, day: 2))!
//let kwPLD9 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 5, day: 23))!
//let kwPLD10 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 5, day: 24))!
//let kwPLD11 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 6, day: 3))!
//let kwPLD12 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 6, day: 6))!
//
//let kwPLDs = [
//    kwPLD1,
//    kwPLD2,
//    kwPLD3,
//    kwPLD4,
//    kwPLD5,
//    kwPLD6,
//    kwPLD7,
//    kwPLD8,
//    kwPLD9,
//    kwPLD10,
//    kwPLD11,
//    kwPLD12,
//]
//
////Math PLDs
//
//let mathPLD1 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 1, day: 26))!
//let mathPLD2 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 1, day: 27))!
//let mathPLD3 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 2, day: 15))!
//let mathPLD4 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 2, day: 16))!
//let mathPLD5 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 3, day: 3))!
//let mathPLD6 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 3, day: 4))!
//let mathPLD7 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 5, day: 9))!
//let mathPLD8 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 5, day: 10))!
//let mathPLD9 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 6, day: 1))!
//let mathPLD10 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 6, day: 2))!
//
//let mathPLDs = [
//    mathPLD1,
//    mathPLD2,
//    mathPLD3,
//    mathPLD4,
//    mathPLD5,
//    mathPLD6,
//    mathPLD7,
//    mathPLD8,
//    mathPLD9,
//    mathPLD10,
//]
//
////MCL PLDs
//
//let mclPLD1 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 1, day: 28))!
//let mclPLD2 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 1, day: 31))!
//let mclPLD3 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 2, day: 23))!
//let mclPLD4 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 2, day: 24))!
//let mclPLD5 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 3, day: 17))!
//let mclPLD6 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 3, day: 18))!
//let mclPLD7 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 4, day: 19))!
//let mclPLD8 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 4, day: 20))!
//let mclPLD9 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 5, day: 25))!
//let mclPLD10 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 5, day: 26))!
//
//let mclPLDs = [
//    mclPLD1,
//    mclPLD2,
//    mclPLD3,
//    mclPLD4,
//    mclPLD5,
//    mclPLD6,
//    mclPLD7,
//    mclPLD8,
//    mclPLD9,
//    mclPLD10,
//]
//
////Science PLDs
//
//let sciencePLD1 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 2, day: 1))!
//let sciencePLD2 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 2, day: 2))!
//let sciencePLD3 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 2, day: 25))!
//let sciencePLD4 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 2, day: 28))!
//let sciencePLD5 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 4, day: 5))!
//let sciencePLD6 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 4, day: 6))!
//let sciencePLD7 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 5, day: 3))!
//let sciencePLD8 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 5, day: 4))!
//let sciencePLD9 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 5, day: 17))!
//let sciencePLD10 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 5, day: 18))!
//
//let sciencePLDs = [
//    sciencePLD1,
//    sciencePLD2,
//    sciencePLD3,
//    sciencePLD4,
//    sciencePLD5,
//    sciencePLD6,
//    sciencePLD7,
//    sciencePLD8,
//    sciencePLD9,
//    sciencePLD10,
//]
//
////Social Studies PLDs
//
//let ssPLD1 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 2, day: 3))!
//let ssPLD2 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 2, day: 4))!
//let ssPLD3 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 3, day: 1))!
//let ssPLD4 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 3, day: 2))!
//let ssPLD5 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 3, day: 23))!
//let ssPLD6 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 3, day: 24))!
//let ssPLD7 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 4, day: 27))!
//let ssPLD8 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 4, day: 28))!
////let ssPLD9 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 5, day: 19))!
////let ssPLD10 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 5, day: 20))!
//
//let ssPLDs = [
//    ssPLD1,
//    ssPLD2,
//    ssPLD3,
//    ssPLD4,
//    ssPLD5,
//    ssPLD6,
//    ssPLD7,
//    ssPLD8,
//  //  ssPLD9,
//  //  ssPLD10,
//]
//
//
//func setPLD() -> String {
//    
//    for day in electivePLDs {
//        if calendar.isDateInToday(day) {
//            return "Electives"
//        }
//    }
//    
//    for day in englishPLDs {
//        if calendar.isDateInToday(day) {
//            return "English"
//        }
//    }
//    
//    for day in kwPLDs {
//        if calendar.isDateInToday(day) {
//            return "KW"
//        }
//    }
//    
//    for day in mathPLDs {
//        if calendar.isDateInToday(day) {
//            return "Math"
//        }
//    }
//    
//    for day in mclPLDs {
//        if calendar.isDateInToday(day) {
//            return "MCL"
//        }
//    }
//    
//    for day in sciencePLDs {
//        if calendar.isDateInToday(day) {
//            return "Science"
//        }
//    }
//    
//    for day in ssPLDs {
//        if calendar.isDateInToday(day) {
//            return "Social Studies"
//        }
//    }
//    
//    
//    return "N/A"
//    
//}
//
//func createPLDListOfDates(electives: [Date], english:[Date], kw:[Date], math:[Date], mcl:[Date], science:[Date], ss:[Date]) -> [Date] {
//    
//    var allPLDDates:[Date] = []
//    
//    for day in electives {
//        allPLDDates.append(day)
//    }
//    for day in english {
//        allPLDDates.append(day)
//    }
//    for day in kw {
//        allPLDDates.append(day)
//    }
//    for day in math {
//        allPLDDates.append(day)
//    }
//    for day in mcl {
//        allPLDDates.append(day)
//    }
//    for day in science {
//        allPLDDates.append(day)
//    }
//    
//    for day in ss {
//        allPLDDates.append(day)
//    }
//    
//    return allPLDDates
//    
//}
//
//let allPLDDates = createPLDListOfDates(electives: electivePLDs, english: englishPLDs, kw: kwPLDs, math: mathPLDs, mcl: mclPLDs, science: sciencePLDs, ss: ssPLDs)
//
//
//
//let noPLDTesting1 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 4, day: 11))!
//let noPLDTesting2 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 4, day: 12))!
//let noPLDTesting3 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 4, day: 14))!
//let noPLDTesting4 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 4, day: 18))!
//let noPLDTesting5 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 5, day: 19))! //Last Day for seniors
//let noPLDTesting6 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago")!, year: 2022, month: 5, day: 20))! //Trevia Day
//
//
//let noPLDsTesting = [noPLDTesting1, noPLDTesting2, noPLDTesting3, noPLDTesting4, noPLDTesting5, noPLDTesting6]
