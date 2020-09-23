//
//  RTObjects.m
//  RFDelegateChain
//
//  Created by BB9z on 2020/9/23.
//  Copyright © 2020 RFUI. All rights reserved.
//

#import "RTObjects.h"

@implementation A

- (NSString *)methodOnlyAHas {
    return @"A";
}

- (NSString *)chainMethod {
    return @"method in a";
}

@end

@implementation B

- (NSString *)methodOnlyBHas {
    return @"B";
}

@end

@implementation Chain

- (NSString *)chainMethod {
    return @"method in chain";
}

@end
