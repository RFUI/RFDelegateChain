//
//  TestDetails.m
//  RFDelegateChain
//
//  Created by BB9z on 2020/9/23.
//  Copyright © 2020 RFUI. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "RTObjects.h"

@interface TestDetails : XCTestCase
@end

@implementation TestDetails

- (void)testCheckDetails {
    A *normalObj = A.new;
    Chain *chainObj = Chain.new;
    Chain *chainWithDelegate = Chain.new;
    chainWithDelegate.delegate = normalObj;
    NSArray *allObjects = @[ normalObj, chainObj, chainWithDelegate ];

    SEL responsedSelect = @selector(chainMethod);
    SEL notResponseSelect = @selector(methodOnlyBHas);

    // Test respondsToSelector
    for (id obj in allObjects) {
        XCTAssertTrue([obj respondsToSelector:responsedSelect]);
        XCTAssertFalse([obj respondsToSelector:notResponseSelect]);
    }

    // Test methodSignatureForSelector
    for (id obj in allObjects) {
        XCTAssertNotNil([obj methodSignatureForSelector:responsedSelect]);
        XCTAssertNil([obj methodSignatureForSelector:notResponseSelect]);
    }

    // Test forwardingTargetForSelector
    XCTAssertNil([normalObj forwardingTargetForSelector:responsedSelect]);
    XCTAssertNil([chainObj forwardingTargetForSelector:responsedSelect]);
    XCTAssertEqual([chainWithDelegate forwardingTargetForSelector:responsedSelect], normalObj);

    XCTAssertNil([normalObj forwardingTargetForSelector:notResponseSelect]);
    XCTAssertNil([chainObj forwardingTargetForSelector:notResponseSelect]);
    XCTAssertEqual([chainWithDelegate forwardingTargetForSelector:notResponseSelect], normalObj);
}

- (void)testMethodSignatureMatch {
    A *normalObj = A.new;
    Chain *chainObj = Chain.new;
    Chain *chainWithDelegate = Chain.new;
    chainWithDelegate.delegate = normalObj;

    NSMethodSignature *s1 = [normalObj methodSignatureForSelector:@selector(methodOnlyAHas)];
    NSMethodSignature *s2 = [chainObj methodSignatureForSelector:@selector(methodOnlyAHas)];
    NSMethodSignature *s3 = [chainWithDelegate methodSignatureForSelector:@selector(methodOnlyAHas)];

    XCTAssertNotNil(s1);
    XCTAssertNil(s2);
    XCTAssertEqualObjects(s1, s3);
}

@end
