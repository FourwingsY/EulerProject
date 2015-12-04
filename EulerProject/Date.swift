//
//  Date.swift
//  EulerProject
//
//  Created by YG on 15/11/25.
//  Copyright © 2015 YG. All rights reserved.
//

private let dayDict = [
    1:31,
    2:28,
    3:31,
    4:30,
    5:31,
    6:30,
    7:31,
    8:31,
    9:30,
    10:31,
    11:30,
    12:31
]

enum Day: Int {
    case Sun = 0, Mon, Tue, Wed, Thr, Fri, Sat
    func next() -> Day {
        let nextValue = (self.rawValue+1) % 7
        return Day(rawValue: nextValue)!
    }
}

struct DateInterval {
    let date: Int
}

struct Date {
    let year: Int
    let month: Int
    let date: Int
    var day: Day {
        // doomsday algorithm
        let lastTwoDigit = self.year % 100
        func anchor(year: Int) -> Int {
            let anchorDay: [Day] = [.Tue, .Sun, .Fri, .Wed]
            return anchorDay[year / 100 % 4].rawValue
        }
        let doom = lastTwoDigit / 12 + lastTwoDigit % 12 + (lastTwoDigit % 12) / 4 + anchor(self.year)
        let doomsDay = Day(rawValue: doom % 7)!
        let doomsDayAtMarch = Date(year: year, month: 3, date: 7)
        let temp = (doomsDay.rawValue + (self.nthDayOfYear - doomsDayAtMarch.nthDayOfYear) % 7 + 7) % 7
        let day = Day(rawValue: temp)!
        return day
    }
    
    var daysInYear: Int {
        return (self.isLeapYear ? 366 : 365)
    }
    var nthDayOfYear: Int {
        return self.date + (1..<self.month).map {
            return (($0 == 2) && self.isLeapYear)
                ? 29
                : dayDict[$0]!
        }.reduce(0, combine: (+))
    }
    var isLeapYear: Bool {
        return (self.year % 4 == 0) && ((self.year % 100 != 0) || (self.year % 400 == 0))
    }
    
    init(year: Int, month: Int, date: Int) {
        self.year = year
        self.month = month
        self.date = date
    }
    
    func tomorrow() -> Date {
        var d = self.date + 1
        var m = self.month
        var y = self.year
        
        let daysInMonth =
        ((self.month == 2) && self.isLeapYear)
            ? 29
            : dayDict[self.month]
        if d > daysInMonth {
            d = 1
            m += 1
        }
        if m > 12 {
            m = 1
            y += 1
        }
        return Date(year: y, month: m, date: d)
    }
    
    func dateInvervalWith(date: Date) -> DateInterval {
        let days = (date.daysInYear - date.nthDayOfYear + 1)
            + (date.year..<self.year).map {
                Date(year: $0, month: 1, date: 1).daysInYear
                }.reduce(0, combine: (+))
            + self.nthDayOfYear
        return DateInterval(date: days)
    }
}

infix operator != { }
func != (a: Date, b: Date) -> Bool {
    if a.year != b.year {
        return true
    }
    if a.month != b.month {
        return true
    }
    if a.date != b.date {
        return true
    }
    return false
}

infix operator == { }
func == (a: Date, b: Date) -> Bool {
    return !(a != b)
}
