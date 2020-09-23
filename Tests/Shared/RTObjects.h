//
//  RTObjects.h
//  RFDelegateChain
//
//  Created by BB9z on 2020/9/23.
//  Copyright © 2020 RFUI. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RFDelegateChain/RFDelegateChain.h>

@protocol TestProtocol

- (nonnull NSString *)chainMethod;

@end

@interface A : NSObject <TestProtocol>

@property int intValue;

- (nonnull NSString *)methodOnlyAHas;

@end

@interface B : NSObject

- (nonnull NSString *)methodOnlyBHas;

@end

@interface Chain: RFDelegateChain <TestProtocol>

@end

