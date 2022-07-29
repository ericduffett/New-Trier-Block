//
//  BellSchedule.swift
//  NT Block Schedule
//
//  Created by Duffett, Eric on 8/29/21.
//

import Foundation

let cal = Calendar(identifier: .gregorian)

var startOfAdvisery = Date()
var endOfAdvisery = Date()
var start1a = Date()
var end1a = Date()
var start1b = Date()
var end1b = Date()
var start2a = Date()
var end2a = Date()
var start2b = Date()
var end2b = Date()
var start2c = Date()
var end2c = Date()
var start3a = Date()
var end3a = Date()
var start3b = Date()
var end3b = Date()
var start4a = Date()
var end4a = Date()
var start4b = Date()
var end4b = Date()
var startAnchor8 = Date()
var endAnchor8 = Date()
var openingSpecialAdviseryWinnetkaStart = Date()
var openingSpecialAdviseryWinnetkaEnd = Date()
var assemblyStart = Date()
var assemblyEnd = Date()
var adviseryLogisticsNFStart = Date()
var adviseryLogisticsNFEnd = Date()
var lunchStart = Date()
var lunchEnd = Date()
let afterSchool = cal.date(from: DateComponents(year:1999))!

var periods = ["5A", "5B", "6A", "6B", "6C", "7A", "7B", "8A", "8B"]



var campus:Campus = .Winnetka


func setBellSchedule() {
    
    let date = Date()
    
    let calendar = Calendar.current
    
    let todaysSchedule = todaysScheduleType()
    
    
    if campus == .Winnetka {
        
        //No if statement. Just set regular bell schedule here. Make sure no else at the end.
        startOfAdvisery = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 8, minute: 20, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
        
        endOfAdvisery = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 8, minute: 45, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
        
        start1a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 8, minute: 50, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
        
        end1a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 9, minute: 30, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
        
        start1b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 9, minute: 35, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
        
        end1b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 10, minute: 15, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
        
        start2a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 10, minute: 20, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
        
        end2a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 11, minute: 0, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
        
        start2b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 11, minute: 05, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
        
        end2b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 11, minute: 45, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
        
        start2c = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 11, minute: 50, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
        
        end2c = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 12, minute: 30, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
        
        start3a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 12, minute: 35, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
        
        end3a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 13, minute: 15, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
        
        start3b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 13, minute: 20, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
        
        end3b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 14, minute: 00, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
        
        start4a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 14, minute: 05, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
        
        end4a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 14, minute: 45, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
        
        start4b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 14, minute: 50, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
        
        end4b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 15, minute: 30, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
        
        if todaysSchedule == .anchor {
            //Set bell schedule for anchor day at Winnetka.
            startOfAdvisery = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 8, minute: 20, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            endOfAdvisery = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 8, minute: 50, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            start1a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 8, minute: 55, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            end1a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 9, minute: 30, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            start1b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 9, minute: 35, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            end1b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 10, minute: 10, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            start2a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 10, minute: 15, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            end2a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 10, minute: 50, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            start2b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 10, minute: 55, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            end2b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 11, minute: 30, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            start2c = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 11, minute: 35, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            end2c = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 12, minute: 10, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            start3a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 12, minute: 15, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            end3a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 12, minute: 50, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            start3b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 12, minute: 55, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            end3b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 13, minute: 30, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            start4a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 13, minute: 35, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            end4a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 14, minute: 10, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            start4b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 14, minute: 15, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            end4b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 14, minute: 50, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            startAnchor8 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 14, minute: 55, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            endAnchor8 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 15, minute: 30, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
        }
        
        //Late Start was listed twice.
        
        //        if todaysSchedule == .lateStart {
        //            startOfAdvisery = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 11, minute: 20, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
        //
        //            endOfAdvisery = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 11, minute: 45, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
        //
        //            start1a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 11, minute: 50, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
        //
        //            end1a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 12, minute: 10, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
        //
        //            start1b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 12, minute: 15, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
        //
        //            end1b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 12, minute: 35, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
        //
        //            start2a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 12, minute: 40, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
        //
        //            end2a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 13, minute: 0, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
        //
        //            start2b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 13, minute: 05, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
        //
        //            end2b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 13, minute: 25, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
        //
        //            start2c = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 13, minute: 30, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
        //
        //            end2c = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 13, minute: 50, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
        //
        //            start3a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 13, minute: 55, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
        //
        //            end3a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 14, minute: 15, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
        //
        //            start3b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 14, minute: 20, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
        //
        //            end3b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 14, minute: 40, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
        //
        //            start4a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 14, minute: 45, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
        //
        //            end4a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 15, minute: 05, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
        //
        //            start4b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 15, minute: 10, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
        //
        //            end4b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 15, minute: 30, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
        //
        //        }
        
        if todaysSchedule == .earlyDismissal {
            startOfAdvisery = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 8, minute: 20, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            endOfAdvisery = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 8, minute: 45, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            start1a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 8, minute: 50, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            end1a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 9, minute: 10, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            start1b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 9, minute: 15, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            end1b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 9, minute: 35, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            start2a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 9, minute: 40, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            end2a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 10, minute: 0, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            start2b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 10, minute: 05, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            end2b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 10, minute: 25, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            start2c = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 10, minute: 30, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            end2c = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 10, minute: 50, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            start3a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 10, minute: 55, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            end3a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 11, minute: 15, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            start3b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 11, minute: 20, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            end3b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 11, minute: 40, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            start4a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 11, minute: 45, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            end4a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 12, minute: 05, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            start4b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 12, minute: 10, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            end4b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 12, minute: 30, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
        }
        
        
        
        if todaysSchedule == .lateStart {
            startOfAdvisery = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 11, minute: 20, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            endOfAdvisery = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 11, minute: 45, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            start1a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 11, minute: 50, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            end1a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 12, minute: 10, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            start1b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 12, minute: 15, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            end1b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 12, minute: 35, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            start2a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 12, minute: 40, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            end2a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 13, minute: 0, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            start2b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 13, minute: 05, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            end2b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 13, minute: 25, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            start2c = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 13, minute: 30, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            end2c = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 13, minute: 50, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            start3a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 13, minute: 55, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            end3a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 14, minute: 15, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            start3b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 14, minute: 20, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            end3b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 14, minute: 40, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            start4a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 14, minute: 45, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            end4a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 15, minute: 05, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            start4b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 15, minute: 10, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            end4b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 15, minute: 30, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
        }
        
        //Anchor early dismissal at Winnetka campus.
        
        if todaysSchedule == .anchorEarly {
            startOfAdvisery = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 8, minute: 20, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            endOfAdvisery = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 8, minute: 40, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            start1a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 8, minute: 45, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            end1a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 9, minute: 05, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            start1b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 9, minute: 10, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            end1b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 9, minute: 30, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            start2a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 9, minute: 35, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            end2a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 9, minute: 55, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            start2b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 10, minute: 00, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            end2b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 10, minute: 20, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            start2c = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 10, minute: 25, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            end2c = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 10, minute: 45, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            start3a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 10, minute: 50, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            end3a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 11, minute: 10, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            start3b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 11, minute: 15, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            end3b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 11, minute: 35, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            start4a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 11, minute: 40, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            end4a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 12, minute: 00, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            start4b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 12, minute: 05, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            end4b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 12, minute: 25, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            startAnchor8 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 12, minute: 30, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            endAnchor8 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 12, minute: 50, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
        }
        
        if todaysSchedule == .extendedAdvisery {
            startOfAdvisery = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 8, minute: 20, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            endOfAdvisery = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 9, minute: 15, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            start1a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 9, minute: 20, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            end1a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 9, minute: 55, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            start1b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 10, minute: 00, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            end1b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 10, minute: 35, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            start2a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 10, minute: 40, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            end2a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 11, minute: 20, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            start2b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 11, minute: 25, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            end2b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 12, minute: 05, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            start2c = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 12, minute: 10, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            end2c = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 12, minute: 50, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            start3a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 12, minute: 55, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            end3a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 13, minute: 30, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            start3b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 13, minute: 35, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            end3b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 14, minute: 10, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            start4a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 14, minute: 15, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            end4a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 14, minute: 50, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            start4b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 14, minute: 55, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            end4b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 15, minute: 30, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
        }
        
        if todaysSchedule == .openingDay {
            //TODO: Bell schedule is correct below. Now update updatetext function to match extra advisery.
            startOfAdvisery = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 8, minute: 20, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            endOfAdvisery = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 10, minute: 10, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            start1a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 10, minute: 15, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            end1a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 10, minute: 40, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            start1b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 10, minute: 45, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            end1b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 11, minute: 10, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            start2a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 11, minute: 15, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            end2a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 11, minute: 40, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            start2b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 11, minute: 45, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            end2b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 12, minute: 10, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            start2c = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 12, minute: 15, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            end2c = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 12, minute: 40, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            start3a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 12, minute: 45, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            end3a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 13, minute: 10, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            start3b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 13, minute: 15, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            end3b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 13, minute: 40, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            start4a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 13, minute: 45, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            end4a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 14, minute: 10, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            start4b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 14, minute: 15, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            end4b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 14, minute: 40, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            startAnchor8 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 14, minute: 45, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            endAnchor8 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 15, minute: 10, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            openingSpecialAdviseryWinnetkaStart = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 15, minute: 15, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            openingSpecialAdviseryWinnetkaEnd = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 15, minute: 30, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
        }
        
    } else {
        //Northfield Bell Schedule
        
        startOfAdvisery = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 8, minute: 00, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
        
        endOfAdvisery = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 8, minute: 25, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
        
        start1a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 8, minute: 30, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
        
        end1a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 9, minute: 10, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
        
        start1b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 9, minute: 15, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
        
        end1b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 9, minute: 55, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
        
        start2a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 10, minute: 00, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
        
        end2a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 10, minute: 40, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
        
        start2b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 10, minute: 45, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
        
        end2b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 11, minute: 25, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
        
        start2c = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 11, minute: 30, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
        
        end2c = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 12, minute: 10, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
        
        start3a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 12, minute: 15, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
        
        end3a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 12, minute: 55, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
        
        start3b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 13, minute: 00, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
        
        end3b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 13, minute: 40, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
        
        start4a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 13, minute: 45, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
        
        end4a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 14, minute: 25, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
        
        start4b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 14, minute: 30, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
        
        end4b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 15, minute: 10, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
        
        //Northfield anchor day
        
        if todaysSchedule == .anchor {
            startOfAdvisery = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 8, minute: 00, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            endOfAdvisery = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 8, minute: 30, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            start1a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 8, minute: 35, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            end1a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 9, minute: 10, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            start1b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 9, minute: 15, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            end1b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 9, minute: 50, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            start2a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 9, minute: 55, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            end2a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 10, minute: 30, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            start2b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 10, minute: 35, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            end2b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 11, minute: 10, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            start2c = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 11, minute: 15, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            end2c = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 11, minute: 50, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            start3a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 11, minute: 55, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            end3a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 12, minute: 30, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            start3b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 12, minute: 35, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            end3b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 13, minute: 10, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            start4a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 13, minute: 15, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            end4a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 13, minute: 50, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            start4b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 13, minute: 55, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            end4b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 14, minute: 30, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            startAnchor8 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 14, minute: 35, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            endAnchor8 = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 15, minute: 10, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
        }
        
        //Northfield Early Dismissal.
        if todaysSchedule == .earlyDismissal {
            startOfAdvisery = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 8, minute: 00, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            endOfAdvisery = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 8, minute: 25, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            start1a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 8, minute: 30, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            end1a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 8, minute: 50, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            start1b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 8, minute: 55, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            end1b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 9, minute: 15, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            start2a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 9, minute: 20, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            end2a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 9, minute: 40, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            start2b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 9, minute: 45, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            end2b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 10, minute: 05, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            start2c = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 10, minute: 10, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            end2c = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 10, minute: 30, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            start3a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 10, minute: 35, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            end3a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 10, minute: 55, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            start3b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 11, minute: 00, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            end3b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 11, minute: 20, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            start4a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 11, minute: 25, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            end4a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 11, minute: 45, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            start4b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 11, minute: 50, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            end4b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 12, minute: 10, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
        }
        
        //Northfield Late Start
        if todaysSchedule == .lateStart {
            startOfAdvisery = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 11, minute: 00, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            endOfAdvisery = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 11, minute: 25, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            start1a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 11, minute: 30, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            end1a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 11, minute: 50, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            start1b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 11, minute: 55, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            end1b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 12, minute: 15, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            start2a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 12, minute: 20, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            end2a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 12, minute: 40, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            start2b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 12, minute: 45, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            end2b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 13, minute: 05, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            start2c = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 13, minute: 10, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            end2c = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 13, minute: 30, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            start3a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 13, minute: 35, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            end3a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 13, minute: 55, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            start3b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 14, minute: 0, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            end3b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 14, minute: 20, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            start4a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 14, minute: 25, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            end4a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 14, minute: 45, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            start4b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 14, minute: 50, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            end4b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 15, minute: 10, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
        }
        
        //Northfield Extended Advisery
        if todaysSchedule == .extendedAdvisery {
            
            startOfAdvisery = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 8, minute: 00, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            endOfAdvisery = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 8, minute: 55, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            start1a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 9, minute: 00, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            end1a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 9, minute: 35, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            start1b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 9, minute: 40, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            end1b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 10, minute: 15, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            start2a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 10, minute: 20, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            end2a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 10, minute: 55, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            start2b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 11, minute: 00, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            end2b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 11, minute: 35, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            start2c = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 11, minute: 40, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            end2c = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 12, minute: 20, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            start3a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 12, minute: 25, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            end3a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 13, minute: 05, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            start3b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 13, minute: 10, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            end3b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 13, minute: 50, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            start4a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 13, minute: 55, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            end4a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 14, minute: 30, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            start4b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 14, minute: 35, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            end4b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 15, minute: 10, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
        } //End NF Extended Advisery
        
        else if todaysSchedule == .openingDay {
            //Northfield Opening Day Schedule
            //TODO: Bell schedule is correct below. Now update updatetext function to match extra advisery.
            startOfAdvisery = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 8, minute: 00, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            endOfAdvisery = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 8, minute: 30, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            assemblyStart = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 8, minute: 45, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            assemblyEnd = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 9, minute: 15, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            adviseryLogisticsNFStart = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 9, minute: 25, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            adviseryLogisticsNFEnd = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 10, minute: 30, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            lunchStart = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 10, minute: 40, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            lunchEnd = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 11, minute: 10, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            start1a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 11, minute: 15, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            end1a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 11, minute: 40, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            start1b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 11, minute: 45, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            end1b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 12, minute: 10, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            start2a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 12, minute: 15, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            end2a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 12, minute: 40, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            start2b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 12, minute: 45, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            end2b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 13, minute: 10, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            start2c = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 13, minute: 15, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            end2c = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 13, minute: 40, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            start3a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 13, minute: 45, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            end3a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 14, minute: 10, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            start3b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 14, minute: 15, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            end3b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 14, minute: 40, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            start4a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 14, minute: 45, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            end4a = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 15, minute: 10, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            start4b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 15, minute: 10, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            end4b = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 15, minute: 10, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
            
            //TODO: NF Schedule ends at 4a because lunch was condensed to a single period. Make sure to check in create updateText.
            
        }
        
    }
}


func setPeriods() {
    let dayColor = determineDayColor()
    
    //Winnetka
    if dayColor == .anchor {
        periods = ["1st", "2nd", "3rd", "4A", "4B", "4C", "5th", "6th", "7th", "8th"]
    }
    
    else if dayColor == .openingDay {
        if campus == .Winnetka {
            periods = ["1st", "2nd", "3rd", "4A", "4B", "4C", "5th", "6th", "7th", "8th", "Advisery"]
        }
    
    }
    else if dayColor == .blue {
        periods = ["1A", "1B", "2A", "2B", "2C", "3A", "3B", "4A", "4B"]
    } else {
        periods = ["5A", "5B", "6A", "6B", "6C", "7A", "7B", "8A", "8B"]
    }
    
    //Northfield Periods
    if campus == .Northfield {
        if dayColor == .anchor {
            periods = ["1st", "2nd", "3rd", "4th", "5A", "5B", "5C", "6th", "7th", "8th"]
        }
        else if dayColor == .openingDay {
            periods = ["Assembly", "Advisery", "Lunch", "1st", "2nd", "3rd", "4th", "5th", "6th", "7th", "8th"]
        }
        else if dayColor == .blue {
            periods = ["1A", "1B", "2A", "2B", "3A", "3B", "3C", "4A", "4B"]
        } else {
            periods = ["5A", "5B", "6A", "6B", "7A", "7B", "7C", "8A", "8B"]
        }
    }
}

func setCampus() {
    
    if let savedCampus = UserDefaults(suiteName: "group.com.newTrieriOSAppDev.NewTrierBlockSchedule")?.string(forKey: "campus") {
        if savedCampus == "Northfield" {
            campus = .Northfield
        } else {
            campus = .Winnetka
        }
    } else {
        campus = .Winnetka
    }
    
}



//Updated 7.16.22. Should correctly phrases on anchor days.

func createUpdateText(date: Date) -> (String, String, Date) {
    
    
    setPeriods()
    setBellSchedule()
    //TODO: Opening Day of school. Different for each campus.
    
    
    if calendar.isDateInToday(openingDay!) {
        
        if (campus == Campus.Winnetka) {
            if (date < startOfAdvisery) {
                return( "Advisery starting soon.",
                        "Advisery starts at", startOfAdvisery)
            }
            else if date >= startOfAdvisery && date < endOfAdvisery {
                return ("Advisery", "Advisery ends at", endOfAdvisery)
            }
            else if date >= endOfAdvisery && date < start1a {
                return ("Passing Period", "\(periods[0]) starts at", start1a)
            }
            
            else if date >= start1a && date < end1a {
                return ("\(periods[0])", "Period ends at", end1a)
            }
            
            else if date >= end1a && date < start1b {
                return ("Passing Period", "\(periods[1]) starts at", start1b)
            }
            
            else if date >= start1b && date < end1b {
                return ("\(periods[1])", "Period ends at", end1b)
            }
            
            else if date >= end1b && date < start2a {
                return ("Passing Period", "\(periods[2]) starts at", start2a)
            }
            
            else if date >= start2a && date < end2a {
                return ("\(periods[2])", "Period ends at", end2a)
            }
            
            else if date >= end2a && date < start2b {
                return ("Passing Period", "\(periods[3]) starts at", start2b)
            }
            
            else if date >= start2b && date < end2b {
                return ("\(periods[3])", "Period ends at", end2b)
            }
            
            else if date >= end2b && date < start2c {
                return ("Passing Period", "\(periods[4]) starts at", start2c)
            }
            
            else if date >= start2c && date < end2c {
                return ("\(periods[4])", "Period ends at", end2c)
            }
            
            else if date >= end2c && date < start3a {
                return ("Passing Period", "\(periods[5]) starts at", start3a)
            }
            
            else if date >= start3a && date < end3a {
                return ("\(periods[5])", "Period ends at", end3a)
            }
            
            else if date >= end3a && date < start3b {
                return ("Passing Period", "\(periods[6]) starts at", start3b)
            }
            
            else if date >= start3b && date < end3b {
                return ("\(periods[6])", "Period ends at", end3b)
            }
            
            else if date >= end3b && date < start4a {
                return ("Passing Period", "\(periods[7]) starts at", start4a)
            }
            
            else if date >= start4a && date < end4a {
                return ("\(periods[7])", "Period ends at", end4a)
            }
            
            else if date >= end4a && date < start4b {
                return ("Passing Period", "\(periods[8]) starts at", start4b)
            }
            else if date >= start4b && date < end4b {
                return ("\(periods[8])", "Period ends at", end4b)
            }
            else if (date >= end4b && date < startAnchor8) && periods.count == 11 {
                return ("Passing Period", "\(periods[9]) starts at", startAnchor8)
            }
            else if (date >= startAnchor8 && date < endAnchor8) && periods.count == 11 {
                return ("\(periods[9])", "Period ends at", endAnchor8)
            }
            else if (date >= endAnchor8 && date < openingSpecialAdviseryWinnetkaStart) && periods.count == 11 {
                return ("Passing Period", "\(periods[10]) starts at", openingSpecialAdviseryWinnetkaStart)
            }
            else if (date >= openingSpecialAdviseryWinnetkaStart && date < openingSpecialAdviseryWinnetkaEnd) && periods.count == 11 {
                return ("\(periods[10])", "Period ends at", openingSpecialAdviseryWinnetkaEnd)
            }
            else {
                return ("School Day Over", "", afterSchool)
            }
        }
        else {
            //Northfield opening day
            if (date < startOfAdvisery) {
                return( "Advisery starting soon.",
                        "Advisery starts at", startOfAdvisery)
            }
            else if date >= startOfAdvisery && date < endOfAdvisery {
                return ("Advisery", "Advisery ends at", endOfAdvisery)
            }
            else if date >= endOfAdvisery && date < assemblyStart {
                return ("Passing Period", "\(periods[0]) starts at", assemblyStart)
            }
            
            else if date >= assemblyStart && date < assemblyEnd {
                return ("\(periods[0])", "Assembly ends at", assemblyEnd)
            }
            
            else if date >= assemblyEnd && date < adviseryLogisticsNFStart {
                return ("Passing Period", "\(periods[1]) starts at", adviseryLogisticsNFStart)
            }
            
            else if date >= adviseryLogisticsNFStart && date < adviseryLogisticsNFEnd {
                return ("\(periods[1])", "Period ends at", adviseryLogisticsNFEnd)
            }
            
            else if date >= adviseryLogisticsNFEnd && date < lunchStart {
                return ("Passing Period", "\(periods[2]) starts at", lunchStart)
            }
            
            else if date >= lunchStart && date < lunchEnd {
                return ("\(periods[2])", "Lunch ends at", lunchEnd)
            }
            
            else if date >= lunchEnd && date < start1a {
                return ("Passing Period", "\(periods[3]) starts at", start1a)
            }
            
            else if date >= start1a && date < end1a {
                return ("\(periods[3])", "Period ends at", end1a)
            }
            
            else if date >= end1a && date < start1b {
                return ("Passing Period", "\(periods[4]) starts at", start1b)
            }
            
            else if date >= start1b && date < end1b {
                return ("\(periods[4])", "Period ends at", end1b)
            }
            
            else if date >= end1b && date < start2a {
                return ("Passing Period", "\(periods[5]) starts at", start2a)
            }
            
            else if date >= start2a && date < end2a {
                return ("\(periods[5])", "Period ends at", end2a)
            }
            
            else if date >= end2a && date < start2b {
                return ("Passing Period", "\(periods[6]) starts at", start2b)
            }
            
            else if date >= start2b && date < end2b {
                return ("\(periods[6])", "Period ends at", end2b)
            }
            
            else if date >= end2b && date < start2c {
                return ("Passing Period", "\(periods[7]) starts at", start2c)
            }
            
            else if date >= start2c && date < end2c {
                return ("\(periods[7])", "Period ends at", end2c)
            }
            
            else if date >= end2c && date < start3a {
                return ("Passing Period", "\(periods[8]) starts at", start3a)
            }
            else if date >= start3a && date < end3a {
                return ("\(periods[8])", "Period ends at", end3a)
            }
            else if (date >= end3a && date < start3b) && periods.count == 11 {
                return ("Passing Period", "\(periods[9]) starts at", start3b)
            }
            else if (date >= start3b && date < end3b) && periods.count == 11 {
                return ("\(periods[9])", "Period ends at", end3b)
            }
            else if (date >= end3b && date < start4a) && periods.count == 11 {
                return ("Passing Period", "\(periods[10]) starts at", start4a)
            }
            else if (date >= start4a && date < end4a) && periods.count == 11 {
                return ("\(periods[10])", "Period ends at", end4a)
            }
            else {
                return ("School Day Over", "", afterSchool)
            }
        }
        
        
        
        
    } else {
        
        if (date < startOfAdvisery) {
            return( "Advisery starting soon.",
                    "Advisery starts at", startOfAdvisery)
        }
        
        else if date >= startOfAdvisery && date < endOfAdvisery {
            return ("Advisery", "Advisery ends at", endOfAdvisery)
        }
        
        else if date >= endOfAdvisery && date < start1a {
            return ("Passing Period", "\(periods[0]) starts at", start1a)
        }
        
        else if date >= start1a && date < end1a {
            return ("\(periods[0])", "Period ends at", end1a)
        }
        
        else if date >= end1a && date < start1b {
            return ("Passing Period", "\(periods[1]) starts at", start1b)
        }
        
        else if date >= start1b && date < end1b {
            return ("\(periods[1])", "Period ends at", end1b)
        }
        
        else if date >= end1b && date < start2a {
            return ("Passing Period", "\(periods[2]) starts at", start2a)
        }
        
        else if date >= start2a && date < end2a {
            return ("\(periods[2])", "Period ends at", end2a)
        }
        
        else if date >= end2a && date < start2b {
            return ("Passing Period", "\(periods[3]) starts at", start2b)
        }
        
        else if date >= start2b && date < end2b {
            return ("\(periods[3])", "Period ends at", end2b)
        }
        
        else if date >= end2b && date < start2c {
            return ("Passing Period", "\(periods[4]) starts at", start2c)
        }
        
        else if date >= start2c && date < end2c {
            return ("\(periods[4])", "Period ends at", end2c)
        }
        
        else if date >= end2c && date < start3a {
            return ("Passing Period", "\(periods[5]) starts at", start3a)
        }
        
        else if date >= start3a && date < end3a {
            return ("\(periods[5])", "Period ends at", end3a)
        }
        
        else if date >= end3a && date < start3b {
            return ("Passing Period", "\(periods[6]) starts at", start3b)
        }
        
        else if date >= start3b && date < end3b {
            return ("\(periods[6])", "Period ends at", end3b)
        }
        
        else if date >= end3b && date < start4a {
            return ("Passing Period", "\(periods[7]) starts at", start4a)
        }
        
        else if date >= start4a && date < end4a {
            return ("\(periods[7])", "Period ends at", end4a)
        }
        
        else if date >= end4a && date < start4b {
            return ("Passing Period", "\(periods[8]) starts at", start4b)
        }
        else if date >= start4b && date < end4b {
            return ("\(periods[8])", "Period ends at", end4b)
        }
        else if (date >= end4b && date < startAnchor8) && periods.count == 10 {
            return ("Passing Period", "\(periods[9]) starts at", startAnchor8)
        }
        else if (date >= startAnchor8 && date < endAnchor8) && periods.count == 10 {
            return ("\(periods[9])", "Period ends at", endAnchor8)
        }
        
        else {
            return ("School Day Over", "", afterSchool)
        }
        
    }
    
    
}


//Day color function sets background color and is needed to differentiate between green and blue days.
func determineDayColor() -> NewTrierColors {
    
    
    //let calendar = Calendar.current
    let today = Date()
    
    //Check for weekend and set color to gray
    let weekday = calendar.dateComponents([.weekday], from: today).weekday!
    
    if weekday == 1 || weekday == 7 {
        return .gray
    }
    
    for holiday in holidays {
        if calendar.isDateInToday(holiday!) {
            return .gray
        }
    }
    
    //Check for final exams
    
    for final in finalExamDays {
        if calendar.isDateInToday(final!) {
            return .brown
        }
    }
    
    //Testing dates updated 7.15.22
    
    //April testing fix
    if campus == .Northfield {
        let northfieldTesting = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), year: 2023, month: 4, day: 19))
        
        if calendar.isDateInToday(northfieldTesting!) {
            return .testing
        }
        
    }
    
    //Winnetka testing day
    if campus == .Winnetka {
        let winnetkaTesting = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), year: 2023, month: 4, day: 12))
        
        if calendar.isDateInToday(winnetkaTesting!) {
            return .testing
        }
    }
    
    if calendar.isDateInToday(openingDay!) {
        return .openingDay
    }
    
    for day in anchorDays {
        if calendar.isDateInToday(day!) {
            return .anchor
        }
    }
    
    
    //Set Blue Days
    var isBlueDay = false
    
    for day in blueDays {
        if calendar.isDateInToday(day!) {
            isBlueDay = true
        }
    }
    
    if isBlueDay {
        return .blue
    } else {
        return .green
    }
    
}

enum ScheduleType {
    case openingDay
    case blueOrGreen
    case anchor
    case anchorEarly
    case earlyDismissal
    case lateStart
    case finals
    case extendedAdvisery
}


//Today's schedule type is needed to set when the bells ring and set updates to the widget.

func todaysScheduleType() -> ScheduleType {
    
    //let calendar = Calendar.current
    
    if calendar.isDateInToday(openingDay!) {
        return .openingDay
    }
    
    for day in anchorDays {
        if calendar.isDateInToday(day!) {
            return .anchor
        }
    }
    
    //TODO: check to make sure anchor early is working correctly.
    for day in earlyDismissals {
        if calendar.isDateInToday(day!) {
            for anchorDay in anchorDays {
                if calendar.isDateInToday(anchorDay!) {
                    return .anchorEarly
                }
            }
            
            return .earlyDismissal
            
        }
    }
    
    for day in lateStarts {
        if calendar.isDateInToday(day!) {
            return .lateStart
        }
    }
    
    for day in extendedAdviseries {
        if calendar.isDateInToday(day!) {
            return .extendedAdvisery
        }
    }
    
    //TODO: Check to make sure finals are returned correctly because this was commented out previously and a yellow day was returned someone else.
    for final in finalExamDays {
        if calendar.isDateInToday(final!) {
            return .finals
        }
    }
    
    
    return .blueOrGreen
}
