//
//  Subtitle.swift
//  TimeMock
//
//  Created by Julian Scharf on 10/7/17.
//  Copyright © 2017 Julian Scharf. All rights reserved.
//

import UIKit

class Subtitle: NSObject {
    
    
    func getRawStringFromFileInBundle(fileName: String, fileExtension: String) -> String {
        let bundle = Bundle.main
        if let url = bundle.url(forResource: fileName, withExtension: fileExtension) {
            
            do {
                return try String(contentsOf: url, encoding: .utf8)
            } catch {
                return "could not read contents of URL"
            }
            
        }
        return "could not obtain URL"
    }
}
