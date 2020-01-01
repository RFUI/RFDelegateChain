
#import "UITextFiledDelegateChain.h"

@implementation UITextFiledDelegateChain
@dynamic delegate;

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    if (self.shouldBeginEditing) {
        return self.shouldBeginEditing(textField, self.delegate);
    }

    if ([self.delegate respondsToSelector:@selector(textFieldShouldBeginEditing:)]) {
        return [self.delegate textFieldShouldBeginEditing:textField];
    }
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    if (self.didBeginEditing) {
        self.didBeginEditing(textField, self.delegate);
        return;
    }

    if ([self.delegate respondsToSelector:@selector(textFieldDidBeginEditing:)]) {
        [self.delegate textFieldDidBeginEditing:textField];
    }
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    if (self.shouldEndEditing) {
        return self.shouldEndEditing(textField, self.delegate);
    }

    if ([self.delegate respondsToSelector:@selector(textFieldShouldEndEditing:)]) {
        return [self.delegate textFieldShouldEndEditing:textField];
    }
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    if (self.didEndEditing) {
        self.didEndEditing(textField, self.delegate);
        return;
    }

    if ([self.delegate respondsToSelector:@selector(textFieldDidEndEditing:)]) {
        [self.delegate textFieldDidEndEditing:textField];
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if (self.shouldChangeCharacters) {
        return self.shouldChangeCharacters(textField, range, string, self.delegate);
    }

    if ([self.delegate respondsToSelector:@selector(textField:shouldChangeCharactersInRange:replacementString:)]) {
        return [self.delegate textField:textField shouldChangeCharactersInRange:range replacementString:string];
    }
    return YES;
}

- (BOOL)textFieldShouldClear:(UITextField *)textField {
    if (self.shouldClear) {
        return self.shouldClear(textField, self.delegate);
    }

    if ([self.delegate respondsToSelector:@selector(textFieldShouldClear:)]) {
        return [self.delegate textFieldShouldClear:textField];
    }
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (self.shouldReturn) {
        return self.shouldReturn(textField, self.delegate);
    }

    if ([self.delegate respondsToSelector:@selector(textFieldShouldReturn:)]) {
        return [self.delegate textFieldShouldReturn:textField];
    }
    return YES;
}

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunguarded-availability"
// All methods must be included in the build result, whatever the deployment target version is.
// As a target which includes this library may be build with a higher deployment version.

- (void)textFieldDidChangeSelection:(UITextField *)textField {
    if (self.didChangeSelection) {
        self.didChangeSelection(textField, self.delegate);
        return;
    }
    if ([self.delegate respondsToSelector:@selector(textFieldDidChangeSelection:)]) {
        [self.delegate textFieldDidChangeSelection:textField];
    }
}

#pragma clang diagnostic pop

@end
