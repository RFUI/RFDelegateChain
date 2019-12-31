/*
 UIWebViewDelegateChain
 RFDelegateChain

 Copyright © 2014, 2019 RFUI
 https://github.com/RFUI/RFDelegateChain

 The MIT License (MIT)
 http://www.opensource.org/licenses/mit-license.php
 */
#import "RFDelegateChain.h"

@interface UIWebViewDelegateChain : RFDelegateChain <
    UIWebViewDelegate
>

@property (weak, nonatomic) IBOutlet id<UIWebViewDelegate> delegate;

/// If thest property set, delegate methods wont called.
#pragma mark Loading Content
@property (copy, nonatomic) BOOL (^shouldStartLoadRequest)(UIWebView *webView, NSURLRequest *request, UIWebViewNavigationType navigationType, id<UIWebViewDelegate> delegate);
@property (copy, nonatomic) void (^didStartLoad)(UIWebView *webView, id<UIWebViewDelegate> delegate);
@property (copy, nonatomic) void (^didFinishLoad)(UIWebView *webView, id<UIWebViewDelegate> delegate);
@property (copy, nonatomic) void (^didFailLoad)(UIWebView *webView, NSError *error, id<UIWebViewDelegate> delegate);

@end
