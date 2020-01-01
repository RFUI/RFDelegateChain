/*
 UITextFiledDelegateChain
 RFDelegateChain

 Copyright © 2014, 2019 RFUI
 https://github.com/RFUI/RFDelegateChain

 The MIT License (MIT)
 http://www.opensource.org/licenses/mit-license.php
 */
#import "RFDelegateChain.h"

NS_ASSUME_NONNULL_BEGIN

@interface UITextFiledDelegateChain : RFDelegateChain <
    UITextFieldDelegate
>

@property (weak, nullable, nonatomic) IBOutlet id<UITextFieldDelegate> delegate;

#pragma mark Managing Editing

@property (nullable) BOOL (^shouldBeginEditing)(UITextField *textField, id<UITextFieldDelegate> __nullable delegate);
@property (nullable) void (^didBeginEditing)(UITextField *textField, id<UITextFieldDelegate> __nullable delegate);
@property (nullable) BOOL (^shouldEndEditing)(UITextField *textField, id<UITextFieldDelegate> __nullable delegate);
@property (nullable) void (^didEndEditing)(UITextField *textField, id<UITextFieldDelegate> __nullable delegate);

#pragma mark Editing the Text Field’s Text

@property (nullable) BOOL (^shouldChangeCharacters)(UITextField *textField, NSRange inRange, NSString *replacementString, id<UITextFieldDelegate> __nullable delegate);
@property (nullable) BOOL (^shouldClear)(UITextField *textField, id<UITextFieldDelegate> __nullable delegate);
@property (nullable) BOOL (^shouldReturn)(UITextField *textField, id<UITextFieldDelegate> __nullable delegate);

#pragma mark -

#if (defined(__IPHONE_13_0) && __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_13_0) || (defined(__TVOS_13_0) && __TV_OS_VERSION_MAX_ALLOWED >= __TVOS_13_0)
@property (nullable) void (^didChangeSelection)(UITextField *textField, id<UITextFieldDelegate> __nullable delegate) API_AVAILABLE(ios(13.0), tvos(13.0));
#endif

@end

NS_ASSUME_NONNULL_END
