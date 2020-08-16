//
//  Threading Functions.swift
//  MoneyboxTest
//
//  Created by Work on 16/08/2020.
//

import Foundation

///Not necessarily for functionality, but added for the purpose of making the invocations of thread a tiny bit more expressive

func mainThread(codeBlock: @escaping () -> Void) {
    DispatchQueue.main.async {
        codeBlock()
    }
}

func backgroundThread(codeBlock: @escaping () -> Void) {
    DispatchQueue.global(qos: .background).async {
        codeBlock()
    }
}
