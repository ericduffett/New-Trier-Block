//
//  NewTrierColors.swift
//  NT Block Schedule
//
//  Created by Duffett, Eric on 9/3/21.
//

import SwiftUI

//TODO: Would like to change anchor back to yellow once it's clear that yellow isn't being used for finals, etc.

struct NTColorSwiftUI {
    let blue: Color = Color.init(red: 0/255, green: 88/255, blue: 138/255)
    let green:Color = Color.init(red: 0/255, green: 140/255, blue: 79/255)
    let gray: Color = Color.gray
    let anchor: Color = Color.init(red: 207/255, green: 160/255, blue: 19/255)
    let openingDay: Color = Color.init(red: 207/255, green: 160/255, blue: 19/255)
    let testing: Color = Color.orange //State testing
    let brown: Color = Color.init(red: 162/255, green: 132/255, blue: 94/255) //Final Exams
}

enum NewTrierColors {
    case blue
    case green
    case gray
    case anchor
    case openingDay
    case testing
    case brown
}

enum Campus {
    case Winnetka
    case Northfield
}



