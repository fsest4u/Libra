//
//  CalculatorDate.swift
//  Jotto
//
//  Created by spdevapp on 2020/07/27.
//  Copyright © 2020 hyeon. All rights reserved.
//

import Foundation
import UIKit

class CalculatorDate {
    
//    var fortuneDate: DateComponents?
    var dateElements: [DateComponents] = []
    
    func getCurrentYear() -> Int {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy"
        let year = Int(formatter.string(from: Date())) ?? DATE_LAST_YEAR

        return year
    }
    
    func getCurrentMonth() -> Int {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "MM"
        let month = Int(formatter.string(from: Date())) ?? 01

        return month
    }
    
    func getFortuneIndex() -> Int {
        
        let index = CGFloat.random(in: 0...4)
        
        return Int(index)
    }
    
    func getDateComponent() -> DateComponents {
        
        let curYear = getCurrentYear()
        let curMonth = getCurrentMonth()
        
        var dateComponents = DateComponents()
        if type == TYPE_LEVEL.type_low {
            dateComponents.month = curMonth
            dateComponents.year = curYear
        }
        else if type == TYPE_LEVEL.type_middle {
            dateComponents.month = Int.random(in: 1...12)
            dateComponents.year = curYear
        }
        else {
            dateComponents.month = Int.random(in: 1...12)
            dateComponents.year = Int.random(in: curYear...DATE_LAST_YEAR)
        }
        
        if dateComponents.month == 4
            || dateComponents.month == 6
            || dateComponents.month == 9
            || dateComponents.month == 11 {
            DATE_LAST_DAY = 30
        }
        else if dateComponents.month == 2 {
            DATE_LAST_DAY = 28
        }
        else {
            // 1, 3, 5, 7, 8, 10, 12 month
            DATE_LAST_DAY = 31
        }
        dateComponents.day = Int.random(in: 1...DATE_LAST_DAY)
        
        return dateComponents
                
    }
    
    func isExistDate(dateComponents: DateComponents?) -> Bool {
        
        guard let date = dateComponents else {
            return false
        }
        
        if dateElements.contains(date) {
            return true
        }
        else {
            return false
        }
        
    }

    func insertFortuneDate(dateComponents: DateComponents?) {
        
        guard let date = dateComponents else {
            return
        }
        dateElements.append(date)
        
    }
    
    func getFortuneDateComponent(isPremium: Bool) -> DateComponents? {
        
        var dateComponent: DateComponents?
        
        if isPremium {
            let count = getRemainCount()
            while true {

                if dateElements.count >= count {
                    // initialize
                    dateElements.removeAll()
                    break
                }
                
                dateComponent = getDateComponent()
                if isExistDate(dateComponents: dateComponent) {
                    // continue
                }
                else {
                    insertFortuneDate(dateComponents: dateComponent)
                    break
                }

            }
        }
        else {
            dateComponent = getDateComponent()
        }

        return dateComponent
        
    }
    
    func getFortuneDate(dateComponents: DateComponents?) -> String {
        
        var strDate: String
        
        guard let dateComponents = dateComponents, let year = dateComponents.year, let month = dateComponents.month, let day = dateComponents.day else {
            return ""
        }
        
        strDate = "\(year)년 \(month)월 \(day)일"
        return strDate
    }
    
    func isFortune(dateComponents: DateComponents?) -> Bool {
        
        guard let dateComponents = dateComponents else {
            return false
        }
        let randomDate: Date = Calendar.current.date(from: dateComponents) ?? Date()
        let isFortune = Calendar.current.isDateInToday(randomDate)
        if isFortune {
            // initialize
            dateElements.removeAll()
        }
        return isFortune
    }
    
    func getRemainCount() -> Int {
        var count = 0
        
        if type == TYPE_LEVEL.type_low {
            count = DATE_LAST_DAY
        }
        else if type == TYPE_LEVEL.type_middle {
            count = 365
        }
        else {
            let curYear = getCurrentYear()

            count = 365 * (DATE_LAST_YEAR - curYear)
        }
        return count
    }
    
}