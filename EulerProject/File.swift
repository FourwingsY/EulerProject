//
//  File.swift
//  EulerProject
//
//  Created by YG on 11/21/15.
//  Copyright © 2015 YG. All rights reserved.
//

import Foundation

func readFile(filePath: String) -> String {
    let splited: [String] = filePath.componentsSeparatedByString(".")
    let file: String = splited.dropLast().joinWithSeparator(".")
    let ext: String = splited.last!

    let bundle = NSBundle.mainBundle()
    let path: String = bundle.pathForResource(file, ofType: ext)!

    do {
        let content = try String(contentsOfFile: path, encoding: NSUTF8StringEncoding)
        return content
    } catch {
        print("error while reading file: \(path)")
    }
    return ""
}