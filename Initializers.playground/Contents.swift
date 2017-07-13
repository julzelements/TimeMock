//: Playground - noun: a place where people can play

import UIKit

enum myEnum {
    
    static func sayHello(myName: String) -> String {
        return addPrefix(input: myName, prefix: "Hello! ")
    }
    
    private static func addPrefix(input: String, prefix: String) -> String {
        return prefix + input
    }
}


print(myEnum.sayHello(myName: "Julian"))