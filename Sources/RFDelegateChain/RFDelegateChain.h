/*
 RFDelegateChain

 Copyright © 2014-2016, 2019 RFUI
 https://github.com/RFUI/RFDelegateChain

 The MIT License (MIT)
 http://www.opensource.org/licenses/mit-license.php
 */
#import <RFInitializing/RFInitializing.h>
#import <RFKit/RFRuntime.h>

@interface RFDelegateChain : NSObject <
    RFInitializing
>
@property (weak, nullable, nonatomic) IBOutlet id delegate;

@end

#define RFDelegateChainForwardMethods(FROM, TO) \
- (BOOL)conformsToProtocol:(Protocol *)aProtocol {\
    if ([FROM conformsToProtocol:aProtocol]) return YES;\
    if ([TO conformsToProtocol:aProtocol]) return YES;\
    return NO;\
}\
- (BOOL)respondsToSelector:(SEL)aSelector {\
    if ([FROM respondsToSelector:aSelector]) return YES;\
    if ([TO respondsToSelector:aSelector]) return YES;\
    return NO;\
}\
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {\
    NSMethodSignature *signature = [FROM methodSignatureForSelector:aSelector];\
    if (signature) return signature;\
    return [TO methodSignatureForSelector:aSelector];\
}\
- (void)forwardInvocation:(NSInvocation *)anInvocation {\
    [anInvocation invokeWithTarget:TO];\
}\
- (id)forwardingTargetForSelector:(SEL)aSelector {\
    return TO;\
}

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wreserved-id-macro"
/**
 This should be private.
 */
#define _RFDelegateChainHasBlockPropertyRespondsToSelector(PROPERTY, SELECTOR) \
    if (@selector(SELECTOR) == aSelector) {\
        return (self.PROPERTY) || [self.delegate respondsToSelector:aSelector];\
    }

#pragma clang diagnostic pop
