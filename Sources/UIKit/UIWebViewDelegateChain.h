/*
 UIWebViewDelegateChain
 RFDelegateChain

 Copyright © 2014, 2019 RFUI
 https://github.com/RFUI/RFDelegateChain

 The MIT License (MIT)
 http://www.opensource.org/licenses/mit-license.php
 */
#import "RFDelegateChain.h"

NS_ASSUME_NONNULL_BEGIN

API_DEPRECATED("UIWebView is deprecated.", ios(8.0, 12.0))
@interface UIWebViewDelegateChain : RFDelegateChain <
    UIWebViewDelegate
>

@property (weak, nullable, nonatomic) IBOutlet id<UIWebViewDelegate> delegate;

#pragma mark Loading Content

@property (nullable) BOOL (^shouldStartLoadRequest)(UIWebView *webView, NSURLRequest *request, UIWebViewNavigationType navigationType, id<UIWebViewDelegate> __nullable delegate);
@property (nullable) void (^didStartLoad)(UIWebView *webView, id<UIWebViewDelegate> __nullable delegate);
@property (nullable) void (^didFinishLoad)(UIWebView *webView, id<UIWebViewDelegate> __nullable delegate);
@property (nullable) void (^didFailLoad)(UIWebView *webView, NSError *error, id<UIWebViewDelegate> __nullable delegate);

@end

NS_ASSUME_NONNULL_END
