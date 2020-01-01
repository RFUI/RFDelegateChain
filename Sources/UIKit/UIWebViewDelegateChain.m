
#import "UIWebViewDelegateChain.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
#pragma clang diagnostic ignored "-Wdeprecated-implementations"

@implementation UIWebViewDelegateChain
@dynamic delegate;

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    if (self.shouldStartLoadRequest) {
        return self.shouldStartLoadRequest(webView, request, navigationType, self.delegate);
    }

    if ([self.delegate respondsToSelector:@selector(webView:shouldStartLoadWithRequest:navigationType:)]) {
        [self.delegate webView:webView shouldStartLoadWithRequest:request navigationType:navigationType];
    }
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    if (self.didStartLoad) {
        self.didStartLoad(webView, self.delegate);
        return;
    }

    if ([self.delegate respondsToSelector:@selector(webViewDidStartLoad:)]) {
        [self.delegate webViewDidStartLoad:webView];
    }
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    if (self.didFinishLoad) {
        self.didFinishLoad(webView, self.delegate);
        return;
    }

    if ([self.delegate respondsToSelector:@selector(webViewDidFinishLoad:)]) {
        [self.delegate webViewDidFinishLoad:webView];
    }
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    if (self.didFailLoad) {
        self.didFailLoad(webView, error, self.delegate);
        return;
    }

    if ([self.delegate respondsToSelector:@selector(webView:didFailLoadWithError:)]) {
        [self.delegate webView:webView didFailLoadWithError:error];
    }
}

@end

#pragma clang diagnostic pop
