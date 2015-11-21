//
//  File.swift
//  EulerProject
//
//  Created by YG on 11/21/15.
//  Copyright © 2015 YG. All rights reserved.
//

import Foundation

func readFile(filePath: String) -> String {
    let splited = filePath.componentsSeparatedByString(".")
    let file = splited.dropLast().joinWithSeparator(".")
    let ext = splited.last!

    let bundle = NSBundle.mainBundle()
    let path = bundle.pathForResource(file, ofType: ext)!

    do {
        let content = try String(contentsOfFile: path, encoding: NSUTF8StringEncoding)
        return content
    } catch {
        print("error while reading file: \(path)")
    }
    return ""
}