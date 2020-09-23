//
//  TestCore.swift
//  Test-Shared
//
//  Created by BB9z on 2019/12/31.
//  Copyright © 2019 RFUI. All rights reserved.
//


import XCTest

class TestCore: XCTestCase {

    func testDescription() {
        let dc = RFDelegateChain()
        XCTAssert(dc.description.contains("delegate = (null)"))
    }

    func testDelegateSet() {
        let dc = RFDelegateChain()
        XCTAssertNil(dc.delegate)
        dc.delegate = dc
        XCTAssertNil(dc.delegate, "Set delegate to itself should have no effec.")
        let aObj = NSObject()
        dc.delegate = aObj;
        XCTAssert(dc.delegate === aObj)
    }

    func testDoubleChain() {
        let aObj = A()
        let chain1 = RFDelegateChain()
        let chain2 = RFDelegateChain()

        let methodSel = #selector(A.methodOnlyAHas)
        chain2.delegate = aObj
        XCTAssertFalse(chain1.responds(to: methodSel))
        XCTAssertTrue(chain2.responds(to: methodSel))
        XCTAssertThrowsError(try RTHelper.catchException {
            chain1.perform(methodSel)
        })
        XCTAssertEqual(chain2.perform(methodSel)?.takeUnretainedValue() as? String, "A")

        chain1.delegate = chain2
        XCTAssertTrue(chain1.responds(to: methodSel))
        XCTAssertEqual(chain1.perform(methodSel)?.takeUnretainedValue() as? String, "A")
    }

    func testMethodChainImplemented() {
        let aObj = A()
        let chain = Chain()
        chain.delegate = aObj;
        XCTAssertEqual(chain.chainMethod(), "method in chain")
    }

    func testValueCoding() {
        let aObj = A()
        let chain = Chain()
        chain.delegate = aObj;
        chain.setValue(123, forKey: "intValue")
        XCTAssertEqual(chain.value(forKey: "intValue") as! NSNumber, NSNumber(value: 123))
    }
}
