/*
 UIScrollViewDelegateChain
 RFDelegateChain

 Copyright © 2015, 2019 RFUI
 https://github.com/RFUI/RFDelegateChain

 The MIT License (MIT)
 http://www.opensource.org/licenses/mit-license.php
 */

#import "RFDelegateChain.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIScrollViewDelegateChain : RFDelegateChain <
    UIScrollViewDelegate
>

@property (weak, nullable, nonatomic) IBOutlet id<UIScrollViewDelegate> delegate;

#pragma mark Responding to Scrolling and Dragging

@property (nullable) void (^didScroll)(UIScrollView *scrollView, id<UIScrollViewDelegate> __nullable delegate);

@property (nullable) void (^willBeginDragging)(UIScrollView *scrollView, id<UIScrollViewDelegate> __nullable delegate);

@property (nullable) void (^willEndDragging)(UIScrollView *scrollView, CGPoint velocity, CGPoint *targetContentOffset, id<UIScrollViewDelegate> __nullable delegate);

@property (nullable) void (^didEndDragging)(UIScrollView *scrollView, BOOL decelerate, id<UIScrollViewDelegate> __nullable delegate);

@property (nullable) BOOL (^shouldScrollToTop)(UIScrollView *scrollView, id<UIScrollViewDelegate> __nullable delegate);

@property (nullable) void (^didScrollToTop)(UIScrollView *scrollView, id<UIScrollViewDelegate> __nullable delegate);

@property (nullable) void (^willBeginDecelerating)(UIScrollView *scrollView, id<UIScrollViewDelegate> __nullable delegate);

@property (nullable) void (^didEndDecelerating)(UIScrollView *scrollView, id<UIScrollViewDelegate> __nullable delegate);

#pragma mark Managing Zooming

@property (nullable) UIView* (^viewForZooming)(UIScrollView *scrollView, id<UIScrollViewDelegate> __nullable delegate);

@property (nullable) void (^willBeginZoomingView)(UIScrollView *scrollView, UIView *__nullable view, id<UIScrollViewDelegate> __nullable delegate);

@property (nullable) void (^didEndZoomingView)(UIScrollView *scrollView, UIView *__nullable view, CGFloat scale, id<UIScrollViewDelegate> __nullable delegate);

@property (nullable) void (^didZoom)(UIScrollView *scrollView, id<UIScrollViewDelegate> __nullable delegate);

#pragma mark Responding to Scrolling Animations

@property (nullable) void (^didEndScrollingAnimation)(UIScrollView *scrollView, id<UIScrollViewDelegate> __nullable delegate);

#pragma mark Responding to Inset Changes

@property (nullable) void (^didChangeAdjustedContentInset)(UIScrollView *scrollView, id<UIScrollViewDelegate> __nullable delegate) API_AVAILABLE(ios(11.0), tvos(11.0));

@end

NS_ASSUME_NONNULL_END

