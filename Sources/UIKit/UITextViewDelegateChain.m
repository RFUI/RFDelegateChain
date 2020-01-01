
#import "UITextViewDelegateChain.h"


@implementation UITextViewDelegateChain
@dynamic delegate;

- (BOOL)respondsToSelector:(SEL)aSelector {
    if (@available(iOS 10.0, tvOS 10.0, *)) {
        // Force use new API on newer OS.
        if (aSelector == @selector(textView:shouldInteractWithURL:inRange:)) return NO;
        if (aSelector == @selector(textView:shouldInteractWithTextAttachment:inRange:)) return NO;
    }
    else {
        // Any shouldInteractWithURL and shouldInteractWithTextAttachment methods is available.
    }
    return [super respondsToSelector:aSelector];
}

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView {
    if (self.shouldBeginEditing) {
        return self.shouldBeginEditing(textView, self.delegate);
    }

    if ([self.delegate respondsToSelector:@selector(textViewShouldBeginEditing:)]) {
        return [self.delegate textViewShouldBeginEditing:textView];
    }
    return YES;
}

- (BOOL)textViewShouldEndEditing:(UITextView *)textView {
    if (self.shouldEndEditing) {
        return self.shouldEndEditing(textView, self.delegate);
    }

    if ([self.delegate respondsToSelector:@selector(textViewShouldEndEditing:)]) {
        return [self.delegate textViewShouldEndEditing:textView];
    }
    return YES;
}

- (void)textViewDidBeginEditing:(UITextView *)textView {
    if (self.didBeginEditing) {
        self.didBeginEditing(textView, self.delegate);
        return;
    }

    if ([self.delegate respondsToSelector:@selector(textViewDidBeginEditing:)]) {
        [self.delegate textViewDidBeginEditing:textView];
    }
}
- (void)textViewDidEndEditing:(UITextView *)textView {
    if (self.didEndEditing) {
        self.didEndEditing(textView, self.delegate);
        return;
    }

    if ([self.delegate respondsToSelector:@selector(textViewDidEndEditing:)]) {
        [self.delegate textViewDidEndEditing:textView];
    }
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if (self.shouldChangeTextInRange) {
        return self.shouldChangeTextInRange(textView, range, text, self.delegate);
    }

    if ([self.delegate respondsToSelector:@selector(textView:shouldChangeTextInRange:replacementText:)]) {
        return [self.delegate textView:textView shouldChangeTextInRange:range replacementText:text];
    }
    return YES;
}

- (void)textViewDidChange:(UITextView *)textView {
    if (self.didChange) {
        self.didChange(textView, self.delegate);
        return;
    }

    if ([self.delegate respondsToSelector:@selector(textViewDidChange:)]) {
        [self.delegate textViewDidChange:textView];
    }
}

- (void)textViewDidChangeSelection:(UITextView *)textView {
    if (self.didChangeSelection) {
        self.didChangeSelection(textView, self.delegate);
        return;
    }

    if ([self.delegate respondsToSelector:@selector(textViewDidChangeSelection:)]) {
        [self.delegate textViewDidChangeSelection:textView];
    }
}

#pragma mark -

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunguarded-availability"

- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(nonnull NSURL *)URL inRange:(NSRange)characterRange interaction:(UITextItemInteraction)interaction {
    if (self.shouldInteractWithURL) {
        return self.shouldInteractWithURL(textView, URL, characterRange, interaction, self.delegate);
    }
    if ([self.delegate respondsToSelector:@selector(textView:shouldInteractWithURL:inRange:interaction:)]) {
        return [self.delegate textView:textView shouldInteractWithURL:URL inRange:characterRange interaction:interaction];
    }
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    else if ([self.delegate respondsToSelector:@selector(textView:shouldInteractWithURL:inRange:)]) {
        return [self.delegate textView:textView shouldInteractWithURL:URL inRange:characterRange];
#pragma clang diagnostic pop
    }
    return YES;
}

- (BOOL)textView:(UITextView *)textView shouldInteractWithTextAttachment:(NSTextAttachment *)textAttachment inRange:(NSRange)characterRange interaction:(UITextItemInteraction)interaction {
    if (self.shouldInteractWithTextAttachment) {
        return self.shouldInteractWithTextAttachment(textView, textAttachment, characterRange, interaction, self.delegate);
    }

    if ([self.delegate respondsToSelector:@selector(textView:shouldInteractWithTextAttachment:inRange:interaction:)]) {
        return [self.delegate textView:textView shouldInteractWithTextAttachment:textAttachment inRange:characterRange interaction:interaction];
    }
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    else if ([self.delegate respondsToSelector:@selector(textView:shouldInteractWithTextAttachment:inRange:)]) {
        return [self.delegate textView:textView shouldInteractWithTextAttachment:textAttachment inRange:characterRange];
#pragma clang diagnostic pop
    }
    return YES;
}

#pragma clang diagnostic pop

#if defined(__IPHONE_10_0) && __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_10_0
    // No old methods.
#else
- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange {
    if (self.shouldInteractWithURL) {
        return self.shouldInteractWithURL(textView, URL, characterRange, 0, self.delegate);
    }

    if ([self.delegate respondsToSelector:@selector(textView:shouldInteractWithURL:inRange:)]) {
        return [self.delegate textView:textView shouldInteractWithURL:URL inRange:characterRange];
    }
    return YES;
}

- (BOOL)textView:(UITextView *)textView shouldInteractWithTextAttachment:(NSTextAttachment *)textAttachment inRange:(NSRange)characterRange {
    if (self.shouldInteractWithTextAttachment) {
        return self.shouldInteractWithTextAttachment(textView, textAttachment, characterRange, 0, self.delegate);
    }

    if ([self.delegate respondsToSelector:@selector(textView:shouldInteractWithTextAttachment:inRange:)]) {
        return [self.delegate textView:textView shouldInteractWithTextAttachment:textAttachment inRange:characterRange];
    }
    return YES;
}

#endif

@end
