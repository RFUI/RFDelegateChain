/*
 UICollectionViewDelegateChain
 RFDelegateChain

 Copyright © 2015-2016, 2019 RFUI
 https://github.com/RFUI/RFDelegateChain

 The MIT License (MIT)
 http://www.opensource.org/licenses/mit-license.php
 */

#import "UIScrollViewDelegateChain.h"

NS_ASSUME_NONNULL_BEGIN

@interface UICollectionViewDelegateChain : UIScrollViewDelegateChain <
    UICollectionViewDelegate
>

@property (weak, nullable, nonatomic) IBOutlet id<UICollectionViewDelegate> delegate;

#pragma mark Managing the Selected Cells

@property (nullable) BOOL (^shouldSelectItem)(UICollectionView *collectionView, NSIndexPath *indexPath, id<UICollectionViewDelegate> __nullable delegate);

@property (nullable) void (^didSelectItem)(UICollectionView *collectionView, NSIndexPath *indexPath, id<UICollectionViewDelegate> __nullable delegate);

@property (nullable) BOOL (^shouldDeselectItem)(UICollectionView *collectionView, NSIndexPath *indexPath, id<UICollectionViewDelegate> __nullable delegate);

@property (nullable) void (^didDeselectItem)(UICollectionView *collectionView, NSIndexPath *indexPath, id<UICollectionViewDelegate> __nullable delegate);

@property (nullable) BOOL (^shouldBeginMultipleSelectionInteraction)(UICollectionView *collectionView, NSIndexPath *indexPath, id<UICollectionViewDelegate> __nullable delegate) API_AVAILABLE(ios(13.0));

@property (nullable) void (^didBeginMultipleSelectionInteraction)(UICollectionView *collectionView, NSIndexPath *indexPath, id<UICollectionViewDelegate> __nullable delegate) API_AVAILABLE(ios(13.0));

@property (nullable) void (^didEndMultipleSelectionInteraction)(UICollectionView *collectionView, id<UICollectionViewDelegate> __nullable delegate) API_AVAILABLE(ios(13.0));

#pragma mark Managing Cell Highlighting

@property (nullable) BOOL (^shouldHighlightItem)(UICollectionView *collectionView, NSIndexPath *indexPath, id<UICollectionViewDelegate> __nullable delegate);

@property (nullable) void (^didHighlightItem)(UICollectionView *collectionView, NSIndexPath *indexPath, id<UICollectionViewDelegate> __nullable delegate);

@property (nullable) void (^didUnhighlightItem)(UICollectionView *collectionView, NSIndexPath *indexPath, id<UICollectionViewDelegate> __nullable delegate);

#pragma mark Tracking the Addition and Removal of Views

@property (nullable) void (^willDisplayCell)(UICollectionView *collectionView, UICollectionViewCell *cell, NSIndexPath *indexPath, id<UICollectionViewDelegate> __nullable delegate);

@property (nullable) void (^willDisplaySupplementaryView)(UICollectionView *collectionView, UICollectionReusableView *view, NSString *elementKind, NSIndexPath *indexPath, id<UICollectionViewDelegate> __nullable delegate);

@property (nullable) void (^didEndDisplayingCell)(UICollectionView *collectionView, UICollectionViewCell *cell, NSIndexPath *indexPath, id<UICollectionViewDelegate> __nullable delegate);

@property (nullable) void (^didEndDisplayingSupplementaryView)(UICollectionView *collectionView, UICollectionReusableView *view, NSString *elementKind, NSIndexPath *indexPath, id<UICollectionViewDelegate> __nullable delegate);

#pragma mark Handling Layout Changes

@property (nullable) UICollectionViewTransitionLayout* (^transitionLayout)(UICollectionView *collectionView, UICollectionViewLayout *fromLayout, UICollectionViewLayout *toLayout, id<UICollectionViewDelegate> __nullable delegate);

@property (nullable) CGPoint (^targetContentOffset)(UICollectionView *collectionView, CGPoint proposedContentOffset, id<UICollectionViewDelegate> __nullable delegate) API_AVAILABLE(ios(9.0), tvos(9.0));

@property (nullable) NSIndexPath* (^targetIndexPathForMoveFromItem)(UICollectionView *collectionView, NSIndexPath *originalIndexPath, NSIndexPath *proposedIndexPath, id<UICollectionViewDelegate> __nullable delegate) API_AVAILABLE(ios(9.0), tvos(9.0));

#pragma mark Managing Actions for Cells

@property (nullable) BOOL (^shouldShowMenuForItem)(UICollectionView *collectionView, NSIndexPath *indexPath, id<UICollectionViewDelegate> __nullable delegate) API_DEPRECATED_WITH_REPLACEMENT("collectionView:contextMenuConfigurationForRowAtIndexPath:", ios(6.0, 13.0));

@property (nullable) BOOL (^canPerformAction)(UICollectionView *collectionView, SEL action, NSIndexPath *indexPath, id sender, id<UICollectionViewDelegate> __nullable delegate) API_DEPRECATED_WITH_REPLACEMENT("collectionView:contextMenuConfigurationForRowAtIndexPath:", ios(6.0, 13.0));

@property (nullable) BOOL (^performAction)(UICollectionView *collectionView, SEL action, NSIndexPath *indexPath, id sender, id<UICollectionViewDelegate> __nullable delegate) API_DEPRECATED_WITH_REPLACEMENT("collectionView:contextMenuConfigurationForRowAtIndexPath:", ios(6.0, 13.0));

#if defined(__IPHONE_13_0) && __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_13_0
@property (nullable) UIContextMenuConfiguration*__nullable (^contextMenuConfigurationForItem)(UICollectionView *collectionView, NSIndexPath *indexPath, CGPoint point, id<UICollectionViewDelegate> __nullable delegate) API_AVAILABLE(ios(13.0)) API_UNAVAILABLE(watchos, tvos);

@property (nullable) UITargetedPreview*__nullable (^previewForHighlightingContextMenu)(UICollectionView *collectionView, UIContextMenuConfiguration *configuration, id<UICollectionViewDelegate> __nullable delegate) API_AVAILABLE(ios(13.0)) API_UNAVAILABLE(watchos, tvos);

@property (nullable) UITargetedPreview*__nullable (^previewForDismissingContextMenu)(UICollectionView *collectionView, UIContextMenuConfiguration *configuration, id<UICollectionViewDelegate> __nullable delegate) API_AVAILABLE(ios(13.0)) API_UNAVAILABLE(watchos, tvos);

@property (nullable) void (^willPerformPreviewActionForMenu)(UICollectionView *collectionView, UIContextMenuConfiguration *configuration, id<UIContextMenuInteractionCommitAnimating> animator, id<UICollectionViewDelegate> __nullable delegate) API_AVAILABLE(ios(13.0)) API_UNAVAILABLE(watchos, tvos);
#endif

#pragma mark Managing Focus in a Collection View

@property (nullable) BOOL (^canFocusItem)(UICollectionView *collectionView, NSIndexPath *indexPath, id<UICollectionViewDelegate> __nullable delegate) API_AVAILABLE(ios(9.0), tvos(9.0));
@property (nullable) NSIndexPath*__nullable (^indexPathForPreferredFocusedView)(UICollectionView *collectionView, id<UICollectionViewDelegate> __nullable delegate) API_AVAILABLE(ios(9.0), tvos(9.0));
@property (nullable) BOOL (^shouldUpdateFocus)(UICollectionView *collectionView, UICollectionViewFocusUpdateContext *context, id<UICollectionViewDelegate> __nullable delegate) API_AVAILABLE(ios(9.0), tvos(9.0));
@property (nullable) void (^didUpdateFocus)(UICollectionView *collectionView, UICollectionViewFocusUpdateContext *context, UIFocusAnimationCoordinator *coordinator, id<UICollectionViewDelegate> __nullable delegate) API_AVAILABLE(ios(9.0), tvos(9.0));

#pragma mark Controlling the Spring-Loading Behavior

@property (nullable) BOOL (^shouldSpringLoadItem)(UICollectionView *collectionView, NSIndexPath *indexPath, id<UISpringLoadedInteractionContext> context, id<UICollectionViewDelegate> __nullable delegate) API_AVAILABLE(ios(11.0)) API_UNAVAILABLE(tvos, watchos);

@end

NS_ASSUME_NONNULL_END
