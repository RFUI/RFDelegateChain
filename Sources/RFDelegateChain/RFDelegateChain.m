
#import "RFDelegateChain.h"

@implementation RFDelegateChain
RFInitializingRootForNSObject

- (void)onInit {
    // Nothing
}

- (void)afterInit {
    // Nothing
}

- (NSString *)description {
    return [NSString stringWithFormat:@"<%@: %p, delegate = %@>", self.class, (void *)self, self.delegate];
}

- (void)setDelegate:(id)delegate {
    if (delegate != self) {
        _delegate = delegate;
    }
    else {
        dout_debug(@"Try set %@ delegtate to itself, ignored.", self);
    }
}

#pragma mark - Methods forward

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    [self.delegate setValue:value forKey:key];
}

- (id)valueForUndefinedKey:(NSString *)key {
    return [self.delegate valueForKey:key];
}

- (BOOL)conformsToProtocol:(Protocol *)aProtocol {
    if ([super conformsToProtocol:aProtocol]) return YES;
    if ([self.delegate conformsToProtocol:aProtocol]) return YES;
    return NO;
}

- (BOOL)respondsToSelector:(SEL)aSelector {
    if ([super respondsToSelector:aSelector]) return YES;
    if ([self.delegate respondsToSelector:aSelector]) return YES;
    return NO;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    NSMethodSignature *signature = [super methodSignatureForSelector:aSelector];
    if (!signature) [self.delegate methodSignatureForSelector:aSelector];
    return signature;
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    [anInvocation invokeWithTarget:self.delegate];
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    return self.delegate;
}

@end
