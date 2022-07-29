//
//  NTBlock.swift
//  NTBlock
//
//  Created by Duffett, Eric on 4/28/22.
//

import WidgetKit
import SwiftUI
import Intents

//
//  NTBlock.swift
//  NTBlock
//
//  Created by Duffett, Eric on 8/28/21.
//

import WidgetKit
import SwiftUI

struct BellScheduleProvider: TimelineProvider {
    
    func placeholder(in context: Context) -> BellScheduleEntry {
        //var calendar = Calendar.current
        calendar.timeZone = TimeZone.init(identifier: "America/Chicago")!
        let date = Date()
        
        var dayColor: Color = .black
        
        switch determineDayColor() {
        case .blue:
            dayColor = NTColorSwiftUI.init().blue
        case .green:
            dayColor = NTColorSwiftUI.init().green
        case .gray:
            dayColor = NTColorSwiftUI.init().gray
        case .anchor:
            dayColor = NTColorSwiftUI.init().anchor
        case .brown:
            dayColor = NTColorSwiftUI.init().brown
        case .testing:
            dayColor = NTColorSwiftUI.init().testing
        case .openingDay:
            dayColor = NTColorSwiftUI.init().openingDay
        }
        
        
        
        let startOfAdvisery = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.init(identifier: "America/Chicago"), era: nil, year: calendar.component(.year, from: date), month: calendar.component(.month, from: date), day: calendar.component(.day, from: date), hour: 8, minute: 20, second: 0, nanosecond: 0, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil))!
        
        return BellScheduleEntry(date: Date(), bellText: BellScheduleText(topText: "Advisery starting soon", bottomText: "Advisery Starts at", time: startOfAdvisery), dayColor: dayColor)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<BellScheduleEntry>) -> Void) {
        
        
        
        @AppStorage("campus", store: UserDefaults(suiteName: "group.com.newTrieriOSAppDev.NewTrierBlockSchedule"))
        var campusName: String = String()
        setCampus()
        print("printing campus name in timeline")
        print(campusName)
            if campusName == "Northfield" {
                campus = .Northfield
            } else {
                campus = .Winnetka
            }
        
        var entries:[BellScheduleEntry] = []
        
        let date = Date()
        //var calendar = Calendar.current
        calendar.timeZone = TimeZone.init(identifier: "America/Chicago")!
        var updates:[Date] = []
        
        let scheduleType = todaysScheduleType()
        
       // setCampus()
        
        if scheduleType == .blueOrGreen {
            
            // Generate a timeline consisting of five entries an hour apart, starting from the current date.
            let startOfDay = calendar.startOfDay(for: date)
            var startUpdates = calendar.date(byAdding: .hour, value: 8, to: startOfDay)!
            var startAdv = calendar.date(byAdding: .minute, value: 20, to: startUpdates)!
            
            if campus == .Northfield {
                startUpdates = calendar.date(byAdding: .hour, value: 7, to: startOfDay)!
                startAdv = calendar.date(byAdding: .hour, value: 1, to: startUpdates)!
            }
            
            
            let endAdv = calendar.date(byAdding: .minute, value: 25, to: startAdv)!
            let s1a = calendar.date(byAdding: .minute, value: 5, to: endAdv)!
            let e1a = calendar.date(byAdding: .minute, value: 40, to: s1a)!
            let s1b = calendar.date(byAdding: .minute, value: 5, to: e1a)!
            let e1b = calendar.date(byAdding: .minute, value: 40, to: s1b)!
            let s2a = calendar.date(byAdding: .minute, value: 5, to: e1b)!
            let e2a = calendar.date(byAdding: .minute, value: 40, to: s2a)!
            let s2b = calendar.date(byAdding: .minute, value: 5, to: e2a)!
            let e2b = calendar.date(byAdding: .minute, value: 40, to: s2b)!
            let s2c = calendar.date(byAdding: .minute, value: 5, to: e2b)!
            let e2c = calendar.date(byAdding: .minute, value: 40, to: s2c)!
            let s3a = calendar.date(byAdding: .minute, value: 5, to: e2c)!
            let e3a = calendar.date(byAdding: .minute, value: 40, to: s3a)!
            let s3b = calendar.date(byAdding: .minute, value: 5, to: e3a)!
            let e3b = calendar.date(byAdding: .minute, value: 40, to: s3b)!
            let s4a = calendar.date(byAdding: .minute, value: 5, to: e3b)!
            let e4a = calendar.date(byAdding: .minute, value: 40, to: s4a)!
            let s4b = calendar.date(byAdding: .minute, value: 5, to: e4a)!
            let e4b = calendar.date(byAdding: .minute, value: 40, to: s4b)!
            let midnight = calendar.date(byAdding: .day, value: 1, to: startOfDay)!
            
            updates = [startOfDay, startAdv, endAdv, s1a, e1a, s1b, e1b, s2a, e2a, s2b, e2b, s2c, e2c, s3a, e3a, s3b, e3b, s4a, e4a, s4b, e4b, midnight]
            
        }
        
        else if scheduleType == .anchor {
            //TODO: Test anchor day widget.
            // Generate a timeline consisting of five entries an hour apart, starting from the current date.
            let startOfDay = calendar.startOfDay(for: date)
            var startUpdates = calendar.date(byAdding: .hour, value: 8, to: startOfDay)!
            var startAdv = calendar.date(byAdding: .minute, value: 20, to: startUpdates)!
            
            if campus == .Northfield {
                startUpdates = calendar.date(byAdding: .hour, value: 7, to: startOfDay)!
                startAdv = calendar.date(byAdding: .hour, value: 1, to: startUpdates)!
            }
            
            
            let endAdv = calendar.date(byAdding: .minute, value: 30, to: startAdv)!
            let s1a = calendar.date(byAdding: .minute, value: 5, to: endAdv)!
            let e1a = calendar.date(byAdding: .minute, value: 35, to: s1a)!
            let s1b = calendar.date(byAdding: .minute, value: 5, to: e1a)!
            let e1b = calendar.date(byAdding: .minute, value: 35, to: s1b)!
            let s2a = calendar.date(byAdding: .minute, value: 5, to: e1b)!
            let e2a = calendar.date(byAdding: .minute, value: 35, to: s2a)!
            let s2b = calendar.date(byAdding: .minute, value: 5, to: e2a)!
            let e2b = calendar.date(byAdding: .minute, value: 35, to: s2b)!
            let s2c = calendar.date(byAdding: .minute, value: 5, to: e2b)!
            let e2c = calendar.date(byAdding: .minute, value: 35, to: s2c)!
            let s3a = calendar.date(byAdding: .minute, value: 5, to: e2c)!
            let e3a = calendar.date(byAdding: .minute, value: 35, to: s3a)!
            let s3b = calendar.date(byAdding: .minute, value: 5, to: e3a)!
            let e3b = calendar.date(byAdding: .minute, value: 35, to: s3b)!
            let s4a = calendar.date(byAdding: .minute, value: 5, to: e3b)!
            let e4a = calendar.date(byAdding: .minute, value: 35, to: s4a)!
            let s4b = calendar.date(byAdding: .minute, value: 5, to: e4a)!
            let e4b = calendar.date(byAdding: .minute, value: 35, to: s4b)!
            let sAnchor8 = calendar.date(byAdding: .minute, value: 5, to: e4b)!
            let eAnchor8 = calendar.date(byAdding: .minute, value: 35, to: sAnchor8)!
            let midnight = calendar.date(byAdding: .day, value: 1, to: startOfDay)!
            
            updates = [startOfDay, startAdv, endAdv, s1a, e1a, s1b, e1b, s2a, e2a, s2b, e2b, s2c, e2c, s3a, e3a, s3b, e3b, s4a, e4a, s4b, e4b, sAnchor8, eAnchor8, midnight]
        }
        
        else if scheduleType == .earlyDismissal {
            let startOfDay = calendar.startOfDay(for: date)
            
            var startUpdates = calendar.date(byAdding: .hour, value: 8, to: startOfDay)!
            var startAdv = calendar.date(byAdding: .minute, value: 20, to: startUpdates)!
            
            if campus == .Northfield {
                startUpdates = calendar.date(byAdding: .hour, value: 7, to: startOfDay)!
                startAdv = calendar.date(byAdding: .hour, value: 1, to: startUpdates)!
            }
            
            
            
            let endAdv = calendar.date(byAdding: .minute, value: 25, to: startAdv)!
            let s1a = calendar.date(byAdding: .minute, value: 5, to: endAdv)!
            let e1a = calendar.date(byAdding: .minute, value: 20, to: s1a)!
            let s1b = calendar.date(byAdding: .minute, value: 5, to: e1a)!
            let e1b = calendar.date(byAdding: .minute, value: 20, to: s1b)!
            let s2a = calendar.date(byAdding: .minute, value: 5, to: e1b)!
            let e2a = calendar.date(byAdding: .minute, value: 20, to: s2a)!
            let s2b = calendar.date(byAdding: .minute, value: 5, to: e2a)!
            let e2b = calendar.date(byAdding: .minute, value: 20, to: s2b)!
            let s2c = calendar.date(byAdding: .minute, value: 5, to: e2b)!
            let e2c = calendar.date(byAdding: .minute, value: 20, to: s2c)!
            let s3a = calendar.date(byAdding: .minute, value: 5, to: e2c)!
            let e3a = calendar.date(byAdding: .minute, value: 20, to: s3a)!
            let s3b = calendar.date(byAdding: .minute, value: 5, to: e3a)!
            let e3b = calendar.date(byAdding: .minute, value: 20, to: s3b)!
            let s4a = calendar.date(byAdding: .minute, value: 5, to: e3b)!
            let e4a = calendar.date(byAdding: .minute, value: 20, to: s4a)!
            let s4b = calendar.date(byAdding: .minute, value: 5, to: e4a)!
            let e4b = calendar.date(byAdding: .minute, value: 20, to: s4b)!
            let midnight = calendar.date(byAdding: .day, value: 1, to: startOfDay)!
            
            updates = [startOfDay, startAdv, endAdv, s1a, e1a, s1b, e1b, s2a, e2a, s2b, e2b, s2c, e2c, s3a, e3a, s3b, e3b, s4a, e4a, s4b, e4b, midnight]
            
        }
        
        else if scheduleType == .anchorEarly {
            //TODO: Test anchor day early release
            // Generate a timeline consisting of five entries an hour apart, starting from the current date.
            let startOfDay = calendar.startOfDay(for: date)
            var startUpdates = calendar.date(byAdding: .hour, value: 8, to: startOfDay)!
            var startAdv = calendar.date(byAdding: .minute, value: 20, to: startUpdates)!
            
            if campus == .Northfield {
                startUpdates = calendar.date(byAdding: .hour, value: 7, to: startOfDay)!
                startAdv = calendar.date(byAdding: .hour, value: 1, to: startUpdates)!
            }
            
            
            let endAdv = calendar.date(byAdding: .minute, value: 20, to: startAdv)!
            let s1a = calendar.date(byAdding: .minute, value: 5, to: endAdv)!
            let e1a = calendar.date(byAdding: .minute, value: 20, to: s1a)!
            let s1b = calendar.date(byAdding: .minute, value: 5, to: e1a)!
            let e1b = calendar.date(byAdding: .minute, value: 20, to: s1b)!
            let s2a = calendar.date(byAdding: .minute, value: 5, to: e1b)!
            let e2a = calendar.date(byAdding: .minute, value: 20, to: s2a)!
            let s2b = calendar.date(byAdding: .minute, value: 5, to: e2a)!
            let e2b = calendar.date(byAdding: .minute, value: 20, to: s2b)!
            let s2c = calendar.date(byAdding: .minute, value: 5, to: e2b)!
            let e2c = calendar.date(byAdding: .minute, value: 20, to: s2c)!
            let s3a = calendar.date(byAdding: .minute, value: 5, to: e2c)!
            let e3a = calendar.date(byAdding: .minute, value: 20, to: s3a)!
            let s3b = calendar.date(byAdding: .minute, value: 5, to: e3a)!
            let e3b = calendar.date(byAdding: .minute, value: 20, to: s3b)!
            let s4a = calendar.date(byAdding: .minute, value: 5, to: e3b)!
            let e4a = calendar.date(byAdding: .minute, value: 20, to: s4a)!
            let s4b = calendar.date(byAdding: .minute, value: 5, to: e4a)!
            let e4b = calendar.date(byAdding: .minute, value: 20, to: s4b)!
            let sAnchor8 = calendar.date(byAdding: .minute, value: 5, to: e4b)!
            let eAnchor8 = calendar.date(byAdding: .minute, value: 20, to: sAnchor8)!
            let midnight = calendar.date(byAdding: .day, value: 1, to: startOfDay)!
            
            updates = [startOfDay, startAdv, endAdv, s1a, e1a, s1b, e1b, s2a, e2a, s2b, e2b, s2c, e2c, s3a, e3a, s3b, e3b, s4a, e4a, s4b, e4b, sAnchor8, eAnchor8, midnight]
            
        }
        
        else if scheduleType == .lateStart {
            
            let startOfDay = calendar.startOfDay(for: date)
            
            var startUpdates = calendar.date(byAdding: .hour, value: 11, to: startOfDay)!
            var startAdv = calendar.date(byAdding: .minute, value: 20, to: startUpdates)!
            
            if campus == .Northfield {
                startUpdates = calendar.date(byAdding: .hour, value: 7, to: startOfDay)!
                startAdv = calendar.date(byAdding: .hour, value: 4, to: startUpdates)!
            }
            
            
            let endAdv = calendar.date(byAdding: .minute, value: 25, to: startAdv)!
            let s1a = calendar.date(byAdding: .minute, value: 5, to: endAdv)!
            let e1a = calendar.date(byAdding: .minute, value: 20, to: s1a)!
            let s1b = calendar.date(byAdding: .minute, value: 5, to: e1a)!
            let e1b = calendar.date(byAdding: .minute, value: 20, to: s1b)!
            let s2a = calendar.date(byAdding: .minute, value: 5, to: e1b)!
            let e2a = calendar.date(byAdding: .minute, value: 20, to: s2a)!
            let s2b = calendar.date(byAdding: .minute, value: 5, to: e2a)!
            let e2b = calendar.date(byAdding: .minute, value: 20, to: s2b)!
            let s2c = calendar.date(byAdding: .minute, value: 5, to: e2b)!
            let e2c = calendar.date(byAdding: .minute, value: 20, to: s2c)!
            let s3a = calendar.date(byAdding: .minute, value: 5, to: e2c)!
            let e3a = calendar.date(byAdding: .minute, value: 20, to: s3a)!
            let s3b = calendar.date(byAdding: .minute, value: 5, to: e3a)!
            let e3b = calendar.date(byAdding: .minute, value: 20, to: s3b)!
            let s4a = calendar.date(byAdding: .minute, value: 5, to: e3b)!
            let e4a = calendar.date(byAdding: .minute, value: 20, to: s4a)!
            let s4b = calendar.date(byAdding: .minute, value: 5, to: e4a)!
            let e4b = calendar.date(byAdding: .minute, value: 20, to: s4b)!
            let midnight = calendar.date(byAdding: .day, value: 1, to: startOfDay)!
            
            updates = [startOfDay, startAdv, endAdv, s1a, e1a, s1b, e1b, s2a, e2a, s2b, e2b, s2c, e2c, s3a, e3a, s3b, e3b, s4a, e4a, s4b, e4b, midnight]
            
        } else if scheduleType == .extendedAdvisery {
            let startOfDay = calendar.startOfDay(for: date)
            
            var startUpdates = calendar.date(byAdding: .hour, value: 8, to: startOfDay)!
            var startAdv = calendar.date(byAdding: .minute, value: 20, to: startUpdates)!
            
            if campus == .Northfield {
                startUpdates = calendar.date(byAdding: .hour, value: 7, to: startOfDay)!
                startAdv = calendar.date(byAdding: .hour, value: 1, to: startUpdates)!
                let endAdv = calendar.date(byAdding: .minute, value: 55, to: startAdv)!
                let s1a = calendar.date(byAdding: .minute, value: 5, to: endAdv)!
                let e1a = calendar.date(byAdding: .minute, value: 35, to: s1a)!
                let s1b = calendar.date(byAdding: .minute, value: 5, to: e1a)!
                let e1b = calendar.date(byAdding: .minute, value: 35, to: s1b)!
                let s2a = calendar.date(byAdding: .minute, value: 5, to: e1b)!
                let e2a = calendar.date(byAdding: .minute, value: 35, to: s2a)!
                let s2b = calendar.date(byAdding: .minute, value: 5, to: e2a)!
                let e2b = calendar.date(byAdding: .minute, value: 35, to: s2b)!
                let s2c = calendar.date(byAdding: .minute, value: 5, to: e2b)!
                let e2c = calendar.date(byAdding: .minute, value: 40, to: s2c)!
                let s3a = calendar.date(byAdding: .minute, value: 5, to: e2c)!
                let e3a = calendar.date(byAdding: .minute, value: 40, to: s3a)!
                let s3b = calendar.date(byAdding: .minute, value: 5, to: e3a)!
                let e3b = calendar.date(byAdding: .minute, value: 40, to: s3b)!
                let s4a = calendar.date(byAdding: .minute, value: 5, to: e3b)!
                let e4a = calendar.date(byAdding: .minute, value: 35, to: s4a)!
                let s4b = calendar.date(byAdding: .minute, value: 5, to: e4a)!
                let e4b = calendar.date(byAdding: .minute, value: 35, to: s4b)!
                let midnight = calendar.date(byAdding: .day, value: 1, to: startOfDay)!
                
                updates = [startOfDay, startAdv, endAdv, s1a, e1a, s1b, e1b, s2a, e2a, s2b, e2b, s2c, e2c, s3a, e3a, s3b, e3b, s4a, e4a, s4b, e4b, midnight]
            }
            
            
            if campus == .Winnetka {
                let endAdv = calendar.date(byAdding: .minute, value: 55, to: startAdv)!
                let s1a = calendar.date(byAdding: .minute, value: 5, to: endAdv)!
                let e1a = calendar.date(byAdding: .minute, value: 35, to: s1a)!
                let s1b = calendar.date(byAdding: .minute, value: 5, to: e1a)!
                let e1b = calendar.date(byAdding: .minute, value: 35, to: s1b)!
                let s2a = calendar.date(byAdding: .minute, value: 5, to: e1b)!
                let e2a = calendar.date(byAdding: .minute, value: 40, to: s2a)!
                let s2b = calendar.date(byAdding: .minute, value: 5, to: e2a)!
                let e2b = calendar.date(byAdding: .minute, value: 40, to: s2b)!
                let s2c = calendar.date(byAdding: .minute, value: 5, to: e2b)!
                let e2c = calendar.date(byAdding: .minute, value: 40, to: s2c)!
                let s3a = calendar.date(byAdding: .minute, value: 5, to: e2c)!
                let e3a = calendar.date(byAdding: .minute, value: 35, to: s3a)!
                let s3b = calendar.date(byAdding: .minute, value: 5, to: e3a)!
                let e3b = calendar.date(byAdding: .minute, value: 35, to: s3b)!
                let s4a = calendar.date(byAdding: .minute, value: 5, to: e3b)!
                let e4a = calendar.date(byAdding: .minute, value: 35, to: s4a)!
                let s4b = calendar.date(byAdding: .minute, value: 5, to: e4a)!
                let e4b = calendar.date(byAdding: .minute, value: 35, to: s4b)!
                let midnight = calendar.date(byAdding: .day, value: 1, to: startOfDay)!
                
                updates = [startOfDay, startAdv, endAdv, s1a, e1a, s1b, e1b, s2a, e2a, s2b, e2b, s2c, e2c, s3a, e3a, s3b, e3b, s4a, e4a, s4b, e4b, midnight]
            }
        } //End else-if for extended advisery
        
        else if scheduleType == .openingDay {
            if campus == .Winnetka {
                //Winnetka campus opening day updates
                let startOfDay = calendar.startOfDay(for: date)
                var startUpdates = calendar.date(byAdding: .hour, value: 8, to: startOfDay)!
                var startAdv = calendar.date(byAdding: .minute, value: 20, to: startUpdates)!
                
                if campus == .Northfield {
                    startUpdates = calendar.date(byAdding: .hour, value: 7, to: startOfDay)!
                    startAdv = calendar.date(byAdding: .hour, value: 1, to: startUpdates)!
                }
                
                
                let endAdv = calendar.date(byAdding: .minute, value: 110, to: startAdv)!
                let s1a = calendar.date(byAdding: .minute, value: 5, to: endAdv)!
                let e1a = calendar.date(byAdding: .minute, value: 25, to: s1a)!
                let s1b = calendar.date(byAdding: .minute, value: 5, to: e1a)!
                let e1b = calendar.date(byAdding: .minute, value: 25, to: s1b)!
                let s2a = calendar.date(byAdding: .minute, value: 5, to: e1b)!
                let e2a = calendar.date(byAdding: .minute, value: 25, to: s2a)!
                let s2b = calendar.date(byAdding: .minute, value: 5, to: e2a)!
                let e2b = calendar.date(byAdding: .minute, value: 25, to: s2b)!
                let s2c = calendar.date(byAdding: .minute, value: 5, to: e2b)!
                let e2c = calendar.date(byAdding: .minute, value: 25, to: s2c)!
                let s3a = calendar.date(byAdding: .minute, value: 5, to: e2c)!
                let e3a = calendar.date(byAdding: .minute, value: 25, to: s3a)!
                let s3b = calendar.date(byAdding: .minute, value: 5, to: e3a)!
                let e3b = calendar.date(byAdding: .minute, value: 25, to: s3b)!
                let s4a = calendar.date(byAdding: .minute, value: 5, to: e3b)!
                let e4a = calendar.date(byAdding: .minute, value: 25, to: s4a)!
                let s4b = calendar.date(byAdding: .minute, value: 5, to: e4a)!
                let e4b = calendar.date(byAdding: .minute, value: 25, to: s4b)!
                let sAnchor8 = calendar.date(byAdding: .minute, value: 5, to: e4b)!
                let eAnchor8 = calendar.date(byAdding: .minute, value: 25, to: sAnchor8)!
                let sSpecialAdv = calendar.date(byAdding: .minute, value: 5, to: eAnchor8)!
                let eSpecialAdv = calendar.date(byAdding: .minute, value: 15, to: sSpecialAdv)!
                let midnight = calendar.date(byAdding: .day, value: 1, to: startOfDay)!
                
                updates = [startOfDay, startAdv, endAdv, s1a, e1a, s1b, e1b, s2a, e2a, s2b, e2b, s2c, e2c, s3a, e3a, s3b, e3b, s4a, e4a, s4b, e4b, sAnchor8, eAnchor8, sSpecialAdv, eSpecialAdv, midnight]
                
            }
            else if campus == .Northfield {
                //Northfield campus opening day updates.
                let startOfDay = calendar.startOfDay(for: date)
                
           
                let startUpdates = calendar.date(byAdding: .hour, value: 7, to: startOfDay)!
                let startAdv = calendar.date(byAdding: .hour, value: 1, to: startUpdates)!
            
                let endAdv = calendar.date(byAdding: .minute, value: 30, to: startAdv)!
                let s1a = calendar.date(byAdding: .minute, value: 15, to: endAdv)!
                let e1a = calendar.date(byAdding: .minute, value: 30, to: s1a)!
                let s1b = calendar.date(byAdding: .minute, value: 10, to: e1a)!
                let e1b = calendar.date(byAdding: .minute, value: 65, to: s1b)!
                let s2a = calendar.date(byAdding: .minute, value: 10, to: e1b)!
                let e2a = calendar.date(byAdding: .minute, value: 30, to: s2a)!
                let s2b = calendar.date(byAdding: .minute, value: 5, to: e2a)!
                let e2b = calendar.date(byAdding: .minute, value: 25, to: s2b)!
                let s2c = calendar.date(byAdding: .minute, value: 5, to: e2b)!
                let e2c = calendar.date(byAdding: .minute, value: 25, to: s2c)!
                let s3a = calendar.date(byAdding: .minute, value: 5, to: e2c)!
                let e3a = calendar.date(byAdding: .minute, value: 25, to: s3a)!
                let s3b = calendar.date(byAdding: .minute, value: 5, to: e3a)!
                let e3b = calendar.date(byAdding: .minute, value: 25, to: s3b)!
                let s4a = calendar.date(byAdding: .minute, value: 5, to: e3b)!
                let e4a = calendar.date(byAdding: .minute, value: 25, to: s4a)!
                let s4b = calendar.date(byAdding: .minute, value: 5, to: e4a)!
                let e4b = calendar.date(byAdding: .minute, value: 25, to: s4b)!
                let sAnchor8 = calendar.date(byAdding: .minute, value: 5, to: e4b)!
                let eAnchor8 = calendar.date(byAdding: .minute, value: 25, to: sAnchor8)!
                let sSpecialAdv = calendar.date(byAdding: .minute, value: 5, to: eAnchor8)!
                let eSpecialAdv = calendar.date(byAdding: .minute, value: 25, to: sSpecialAdv)!
                let midnight = calendar.date(byAdding: .day, value: 1, to: startOfDay)!
                
                updates = [startOfDay, startAdv, endAdv, s1a, e1a, s1b, e1b, s2a, e2a, s2b, e2b, s2c, e2c, s3a, e3a, s3b, e3b, s4a, e4a, s4b, e4b, sAnchor8, eAnchor8, sSpecialAdv, eSpecialAdv, midnight]
                
                
            }
        }
        
        //TODO: Trevia Day schedule
        //TODO: Didn't see any updates for testing or finals schedules.
        
        
        for index in 0..<updates.count {
            
            var nextBell = index + 1
            if index == updates.count - 1 {
                nextBell = 0
            }
            
            var dayColor: Color = .black
            
            switch determineDayColor() {
            case .blue:
                dayColor = NTColorSwiftUI.init().blue
            case .green:
                dayColor = NTColorSwiftUI.init().green
            case .gray:
                dayColor = NTColorSwiftUI.init().gray
            case .anchor:
                dayColor = NTColorSwiftUI.init().anchor
            case .brown:
                dayColor = NTColorSwiftUI.init().brown
            case .testing:
                dayColor = NTColorSwiftUI.init().testing
            case .openingDay:
                dayColor = NTColorSwiftUI.init().openingDay
            }
            
            
            let entry = BellScheduleEntry(date: updates[index], bellText: BellScheduleText(topText: createUpdateText(date: updates[index]).0, bottomText: createUpdateText(date: updates[index]).1, time: updates[nextBell]), dayColor: dayColor)
            entries.append(entry)
        }
        
        
        
        let timeline = Timeline(entries: entries, policy: .atEnd)
        
        completion(timeline)
    }
    
    
    func getSnapshot(in context: Context, completion: @escaping (BellScheduleEntry) -> Void) {
        
        let date = Date()
        let entry: BellScheduleEntry
        
        if context.isPreview {
            entry = BellScheduleEntry(date: date, bellText: BellScheduleText(topText: "2A", bottomText: "Period ends at", time: date), dayColor: NTColorSwiftUI.init().blue)
        } else {
            entry = BellScheduleEntry(date: date, bellText: BellScheduleText(topText: "2A", bottomText: "Period ends at", time: date), dayColor: NTColorSwiftUI.init().blue)
        }
        
        
        completion(entry)
        
    }
    
    
    
}

struct BellScheduleEntry: TimelineEntry {
    let date: Date
    let bellText: BellScheduleText
    let dayColor: Color
}

struct BellScheduleText {
    let topText: String
    let bottomText: String
    let time: Date
}


struct NTBlockEntryView : View {
    var entry: BellScheduleProvider.Entry
    
    @AppStorage("campus", store: UserDefaults(suiteName: "group.com.newTrieriOSAppDev.NewTrierBlockSchedule"))
    var campusData: String = String()
   
    
    @Environment(\.widgetFamily) var widgetFamily
    
    //TODO: If before first day of school change widget to gray
    
    var body: some View {
       // let calendar = Calendar.current
        let year = calendar.component(.year, from: entry.bellText.time)
        let dayColor = entry.dayColor
        let startOfDay = calendar.startOfDay(for: Date())
        let midnight = calendar.date(byAdding: .day, value: 1, to: startOfDay)!
        
        ZStack{
            entry.dayColor
                .ignoresSafeArea()
            VStack{
                if widgetFamily != .systemSmall {
                    campusData == "Northfield" ? Text("Northfield Campus")
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .font(Font.custom("Poppins-Bold", size: 12).weight(.bold))
                        .padding(EdgeInsets(top: 16, leading: 0, bottom: 0, trailing: 0))
                        : Text("Winnetka Campus")
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .font(Font.custom("Poppins-Bold", size: 12).weight(.bold))
                        .padding(EdgeInsets(top: 16, leading: 0, bottom: 0, trailing: 0))
                } else {
                    campusData == "Northfield" ? Text("Northfield Campus")
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .font(Font.custom("Poppins-Bold", size: 8).weight(.bold))
                        .padding(EdgeInsets(top:16, leading: 0, bottom: 0, trailing: 0))
                        
                        : Text("Winnetka Campus")
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .font(Font.custom("Poppins-Bold", size: 8).weight(.bold))
                        .padding(EdgeInsets(top: 16, leading: 0, bottom: 0, trailing: 0))
                }
                Spacer()
                if dayColor == NTColorSwiftUI.init().testing { //TODO: Figure out how to differentiate between finals and state testing. Right now only one color avaiable. Check against flutter.
                    if widgetFamily != .systemSmall {
                        Text("State Testing").multilineTextAlignment(.center)
                            .foregroundColor(.white)
                            .font(Font.custom("Poppins-Bold", size: 24).weight(.bold))
                        Text("Check the New Trier website for details.").multilineTextAlignment(.center)
                            .foregroundColor(.white)
                            .font(Font.custom("Poppins-Light", size: 16).weight(.light))
                            .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
                    } else {
                        Text("State Testing").multilineTextAlignment(.center)
                            .foregroundColor(.white)
                            .font(Font.custom("Poppins-Bold", size: 18).weight(.bold))
                        Text("Check the New Trier website for details.").multilineTextAlignment(.center)
                            .foregroundColor(.white)
                            .font(Font.custom("Poppins-Light", size: 12).weight(.light))
                            .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                    }
                }
               else if dayColor == NTColorSwiftUI.init().brown { //TODO:No such thing anymore. This needs changed.
                    if widgetFamily != .systemSmall {
                        Text("Final Exams").multilineTextAlignment(.center)
                            .foregroundColor(.white)
                            .font(Font.custom("Poppins-Bold", size: 24).weight(.bold))
                        Text("Check the New Trier website for the exam schedule.").multilineTextAlignment(.center)
                            .foregroundColor(.white)
                            .font(Font.custom("Poppins-Light", size: 16).weight(.light))
                            .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
                    } else {
                        Text("Final Exams").multilineTextAlignment(.center)
                            .foregroundColor(.white)
                            .font(Font.custom("Poppins-Bold", size: 18).weight(.bold))
                        Text("Check the New Trier website for the exam schedule.").multilineTextAlignment(.center)
                            .foregroundColor(.white)
                            .font(Font.custom("Poppins-Light", size: 12).weight(.light))
                            .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                    }
                    
                } else {
                    if widgetFamily != .systemSmall {
                        if (dayColor != Color.gray) {
                            Text(entry.bellText.topText).multilineTextAlignment(.center)
                                .foregroundColor(.white)
                                .font(Font.custom("Poppins-Bold", size: 24).weight(.bold))
                            if (year != 1999 && entry.bellText.time != midnight) {
                                Text(entry.bellText.bottomText).multilineTextAlignment(.center)
                                    .foregroundColor(.white)
                                    .font(Font.custom("Poppins-Light", size: 16).weight(.light))
                                Text(entry.bellText.time, style: .time)
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.white)
                                    .font(Font.custom("Poppins-Bold", size: 16).weight(.bold))
                            }
                        } else {
                            Text("No School Today").multilineTextAlignment(.center)
                                .foregroundColor(.white)
                                .font(Font.custom("Poppins-Bold", size: 24).weight(.bold))
                        }
                    } else {
                        if (dayColor != Color.gray) {
                            Text(entry.bellText.topText).multilineTextAlignment(.center)
                                .foregroundColor(.white)
                                .font(Font.custom("Poppins-Bold", size: 16).weight(.bold))
                            if (year != 1999 && entry.bellText.time != midnight) {
                                Text(entry.bellText.bottomText).multilineTextAlignment(.center)
                                    .foregroundColor(.white)
                                    .font(Font.custom("Poppins-Light", size: 12).weight(.light))
                                Text(entry.bellText.time, style: .time)
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.white)
                                    .font(Font.custom("Poppins-Bold", size: 12).weight(.bold))
                            }
                        } else {
                            Text("No School Today").multilineTextAlignment(.center)
                                .foregroundColor(.white)
                                .font(Font.custom("Poppins-Bold", size: 16).weight(.bold))
                        }
                    }
                }
                Rectangle()
                    .fill(Color.clear)
                    .frame(width: 10, height: 0, alignment: .center)
//
                Spacer()
            }
//            VStack(alignment: .center, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
//                if widgetFamily != .systemSmall {
//                    campusData == "Northfield" ? Text("Northfield Campus")
//                        .multilineTextAlignment(.center)
//                        .foregroundColor(.white)
//                        .font(Font.custom("Poppins-Bold", size: 12).weight(.bold))
//                        .padding(EdgeInsets(top: 12, leading: 0, bottom: 0, trailing: 0))
//                        : Text("Winnetka Campus")
//                        .multilineTextAlignment(.center)
//                        .foregroundColor(.white)
//                        .font(Font.custom("Poppins-Bold", size: 12).weight(.bold))
//                        .padding(EdgeInsets(top: 12, leading: 0, bottom: 0, trailing: 0))
//                } else {
//                    campusData == "Northfield" ? Text("Northfield Campus")
//                        .multilineTextAlignment(.center)
//                        .foregroundColor(.white)
//                        .font(Font.custom("Poppins-Bold", size: 8).weight(.bold))
//                        .padding(EdgeInsets(top: 6, leading: 0, bottom: 0, trailing: 0))
//
//                        : Text("Winnetka Campus")
//                        .multilineTextAlignment(.center)
//                        .foregroundColor(.white)
//                        .font(Font.custom("Poppins-Bold", size: 8).weight(.bold))
//                        .padding(EdgeInsets(top: 6, leading: 0, bottom: 0, trailing: 0))
//                }
//
//                Spacer()
//                Text("Last Update: \(Text(entry.date, style: .time))")
//                    .multilineTextAlignment(.center)
//                    .foregroundColor(.white)
//                    .font(Font.custom("Poppins-Bold", size: 8).weight(.bold))
  //          })
        }
        
    }
}


@main
struct NTBlock: Widget {
    let kind: String = "NTBlock"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: BellScheduleProvider()) { entry in
            NTBlockEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct NTBlock_Previews: PreviewProvider {
   
    static var previews: some View {
       
        NTBlockEntryView(entry: BellScheduleEntry(date: Date(), bellText: BellScheduleText(topText: "Advisery starting soon.", bottomText: "Advisery starts at", time: Date()), dayColor: NTColorSwiftUI.init().blue))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}


//struct Provider: IntentTimelineProvider {
//    func placeholder(in context: Context) -> SimpleEntry {
//        SimpleEntry(date: Date(), configuration: ConfigurationIntent())
//    }
//
//    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
//        let entry = SimpleEntry(date: Date(), configuration: configuration)
//        completion(entry)
//    }
//
//    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
//        var entries: [SimpleEntry] = []
//
//        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
//        let currentDate = Date()
//        for hourOffset in 0 ..< 5 {
//            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
//            let entry = SimpleEntry(date: entryDate, configuration: configuration)
//            entries.append(entry)
//        }
//
//        let timeline = Timeline(entries: entries, policy: .atEnd)
//        completion(timeline)
//    }
//}
//
//struct SimpleEntry: TimelineEntry {
//    let date: Date
//    let configuration: ConfigurationIntent
//}
//
//struct NTBlockEntryView : View {
//    var entry: Provider.Entry
//
//    var body: some View {
//        Text(entry.date, style: .time)
//    }
//}
//
//@main
//struct NTBlock: Widget {
//    let kind: String = "NTBlock"
//
//    var body: some WidgetConfiguration {
//        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
//            NTBlockEntryView(entry: entry)
//        }
//        .configurationDisplayName("My Widget")
//        .description("This is an example widget.")
//    }
//}
//
//struct NTBlock_Previews: PreviewProvider {
//    static var previews: some View {
//        NTBlockEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
//            .previewContext(WidgetPreviewContext(family: .systemSmall))
//    }
//}
