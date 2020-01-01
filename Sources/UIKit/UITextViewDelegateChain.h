/*
 UITextViewDelegateChain
 RFDelegateChain

 Copyright © 2014, 2019 RFUI
 https://github.com/RFUI/RFDelegateChain

 The MIT License (MIT)
 http://www.opensource.org/licenses/mit-license.php
 */
#import "RFDelegateChain.h"

NS_ASSUME_NONNULL_BEGIN

@interface UITextViewDelegateChain : RFDelegateChain <
    UITextViewDelegate
>

@property (weak, nullable, nonatomic) IBOutlet id<UITextViewDelegate> delegate;

#pragma mark Responding to Editing Notifications

@property (nullable) BOOL (^shouldBeginEditing)(UITextView *textView, id<UITextViewDelegate> __nullable delegate);
@property (nullable) void (^didBeginEditing)(UITextView *textView, id<UITextViewDelegate> __nullable delegate);
@property (nullable) BOOL (^shouldEndEditing)(UITextView *textView, id<UITextViewDelegate> __nullable delegate);
@property (nullable) void (^didEndEditing)(UITextView *textView, id<UITextViewDelegate> __nullable delegate);

#pragma mark Responding to Text Changes

@property (nullable) BOOL (^shouldChangeTextInRange)(UITextView *textView, NSRange range, NSString *replacementText, id<UITextViewDelegate> __nullable delegate);
@property (nullable) void (^didChange)(UITextView *textView, id<UITextViewDelegate> __nullable delegate);

#pragma mark Responding to Selection Changes

@property (nullable) void (^didChangeSelection)(UITextView *textView, id<UITextViewDelegate> __nullable delegate);

#pragma mark Interacting with Text Data

#if defined(__IPHONE_10_0) && __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_10_0
@property (nullable) BOOL (^shouldInteractWithURL)(UITextView *textView, NSURL *URL, NSRange characterRange, UITextItemInteraction interaction, id<UITextViewDelegate> __nullable delegate) API_AVAILABLE(ios(10.0), tvos(10.0));
@property (nullable) BOOL (^shouldInteractWithTextAttachment)(UITextView *textView, NSTextAttachment *textAttachment, NSRange characterRange, UITextItemInteraction interaction, id<UITextViewDelegate> __nullable delegate) API_AVAILABLE(ios(10.0), tvos(10.0));
#else
@property (nullable) BOOL (^shouldInteractWithURL)(UITextView *textView, NSURL *URL, NSRange characterRange, NSInteger interaction, id<UITextViewDelegate> __nullable delegate);
@property (nullable) BOOL (^shouldInteractWithTextAttachment)(UITextView *textView, NSTextAttachment *textAttachment, NSRange characterRange, NSInteger interaction, id<UITextViewDelegate> __nullable delegate);
#endif

@end

NS_ASSUME_NONNULL_END
