
#import "UICollectionViewDelegateChain.h"

@implementation UICollectionViewDelegateChain
@dynamic delegate;

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunguarded-availability"
// All methods must be included in the build result, whatever the deployment target version is.
// As a target which includes this library may be build with a higher deployment version.

- (BOOL)respondsToSelector:(SEL)aSelector {
    _RFDelegateChainHasBlockPropertyRespondsToSelector(shouldSelectItem, collectionView:shouldSelectItemAtIndexPath:)
    _RFDelegateChainHasBlockPropertyRespondsToSelector(didSelectItem, collectionView:didSelectItemAtIndexPath:)
    _RFDelegateChainHasBlockPropertyRespondsToSelector(shouldDeselectItem, collectionView:shouldDeselectItemAtIndexPath:)
    _RFDelegateChainHasBlockPropertyRespondsToSelector(didDeselectItem, collectionView:didDeselectItemAtIndexPath:)
    _RFDelegateChainHasBlockPropertyRespondsToSelector(shouldBeginMultipleSelectionInteraction, collectionView:shouldBeginMultipleSelectionInteractionAtIndexPath:)
    _RFDelegateChainHasBlockPropertyRespondsToSelector(didBeginMultipleSelectionInteraction, collectionView:didBeginMultipleSelectionInteractionAtIndexPath:)
    _RFDelegateChainHasBlockPropertyRespondsToSelector(didEndMultipleSelectionInteraction, collectionViewDidEndMultipleSelectionInteraction:)
    _RFDelegateChainHasBlockPropertyRespondsToSelector(shouldHighlightItem, collectionView:shouldHighlightItemAtIndexPath:)
    _RFDelegateChainHasBlockPropertyRespondsToSelector(didHighlightItem, collectionView:didHighlightItemAtIndexPath:)
    _RFDelegateChainHasBlockPropertyRespondsToSelector(didUnhighlightItem, collectionView:didUnhighlightItemAtIndexPath:)
    _RFDelegateChainHasBlockPropertyRespondsToSelector(willDisplayCell, collectionView:willDisplayCell:forItemAtIndexPath:)
    _RFDelegateChainHasBlockPropertyRespondsToSelector(willDisplaySupplementaryView, collectionView:willDisplaySupplementaryView:forElementKind:atIndexPath:)
    _RFDelegateChainHasBlockPropertyRespondsToSelector(didEndDisplayingCell, collectionView:didEndDisplayingCell:forItemAtIndexPath:)
    _RFDelegateChainHasBlockPropertyRespondsToSelector(didEndDisplayingSupplementaryView, collectionView:didEndDisplayingSupplementaryView:forElementOfKind:atIndexPath:)
    _RFDelegateChainHasBlockPropertyRespondsToSelector(transitionLayout, collectionView:transitionLayoutForOldLayout:newLayout:)
    _RFDelegateChainHasBlockPropertyRespondsToSelector(targetContentOffset, collectionView:targetContentOffsetForProposedContentOffset:)
    _RFDelegateChainHasBlockPropertyRespondsToSelector(targetIndexPathForMoveFromItem, collectionView:targetIndexPathForMoveFromItemAtIndexPath:toProposedIndexPath:)
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    _RFDelegateChainHasBlockPropertyRespondsToSelector(shouldShowMenuForItem, collectionView:shouldShowMenuForItemAtIndexPath:)
    _RFDelegateChainHasBlockPropertyRespondsToSelector(canPerformAction, collectionView:canPerformAction:forItemAtIndexPath:withSender:)
    _RFDelegateChainHasBlockPropertyRespondsToSelector(performAction, collectionView:performAction:forItemAtIndexPath:withSender:)
#pragma clang diagnostic pop

#if defined(__IPHONE_13_0) && __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_13_0
    _RFDelegateChainHasBlockPropertyRespondsToSelector(contextMenuConfigurationForItem, collectionView:contextMenuConfigurationForItemAtIndexPath:point:)
    _RFDelegateChainHasBlockPropertyRespondsToSelector(previewForHighlightingContextMenu, collectionView:previewForHighlightingContextMenuWithConfiguration:)
    _RFDelegateChainHasBlockPropertyRespondsToSelector(previewForDismissingContextMenu, collectionView:previewForDismissingContextMenuWithConfiguration:)
    _RFDelegateChainHasBlockPropertyRespondsToSelector(willPerformPreviewActionForMenu, collectionView:willPerformPreviewActionForMenuWithConfiguration:animator:)
#endif
    _RFDelegateChainHasBlockPropertyRespondsToSelector(canFocusItem, collectionView:canFocusItemAtIndexPath:)
    _RFDelegateChainHasBlockPropertyRespondsToSelector(indexPathForPreferredFocusedView, indexPathForPreferredFocusedViewInCollectionView:)
    _RFDelegateChainHasBlockPropertyRespondsToSelector(shouldUpdateFocus, collectionView:shouldUpdateFocusInContext:)
    _RFDelegateChainHasBlockPropertyRespondsToSelector(didUpdateFocus, collectionView:didUpdateFocusInContext:withAnimationCoordinator:)
    _RFDelegateChainHasBlockPropertyRespondsToSelector(shouldSpringLoadItem, collectionView:shouldSpringLoadItemAtIndexPath:withContext:)
    return [super respondsToSelector:aSelector];
}

#pragma mark -

- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.shouldSelectItem) {
        return self.shouldSelectItem(collectionView, indexPath, self.delegate);
    }
    return [self.delegate collectionView:collectionView shouldSelectItemAtIndexPath:indexPath];
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.shouldDeselectItem) {
        return self.shouldDeselectItem(collectionView, indexPath, self.delegate);
    }
    return [self.delegate collectionView:collectionView shouldDeselectItemAtIndexPath:indexPath];
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.didSelectItem) {
        self.didSelectItem(collectionView, indexPath, self.delegate);
        return;
    }
    [self.delegate collectionView:collectionView didSelectItemAtIndexPath:indexPath];
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.didDeselectItem) {
        self.didDeselectItem(collectionView, indexPath, self.delegate);
        return;
    }
    [self.delegate collectionView:collectionView didDeselectItemAtIndexPath:indexPath];
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldBeginMultipleSelectionInteractionAtIndexPath:(NSIndexPath *)indexPath {
    if (self.shouldBeginMultipleSelectionInteraction) {
        return self.shouldBeginMultipleSelectionInteraction(collectionView, indexPath, self.delegate);
    }
    return [self.delegate collectionView:collectionView shouldBeginMultipleSelectionInteractionAtIndexPath:indexPath];
}

- (void)collectionView:(UICollectionView *)collectionView didBeginMultipleSelectionInteractionAtIndexPath:(NSIndexPath *)indexPath {
    if (self.didBeginMultipleSelectionInteraction) {
        return self.didBeginMultipleSelectionInteraction(collectionView, indexPath, self.delegate);
    }
    return [self.delegate collectionView:collectionView didBeginMultipleSelectionInteractionAtIndexPath:indexPath];
}

- (void)collectionViewDidEndMultipleSelectionInteraction:(UICollectionView *)collectionView {
    if (self.didEndMultipleSelectionInteraction) {
        self.didEndMultipleSelectionInteraction(collectionView, self.delegate);
        return;
    }
    [self.delegate collectionViewDidEndMultipleSelectionInteraction:collectionView];
}

#pragma mark -

- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.shouldHighlightItem) {
        return self.shouldHighlightItem(collectionView, indexPath, self.delegate);
    }
    return [self.delegate collectionView:collectionView shouldHighlightItemAtIndexPath:indexPath];
}

- (void)collectionView:(UICollectionView *)collectionView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.didHighlightItem) {
        self.didHighlightItem(collectionView, indexPath, self.delegate);
        return;
    }
    [self.delegate collectionView:collectionView didHighlightItemAtIndexPath:indexPath];
}

- (void)collectionView:(UICollectionView *)collectionView didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.didUnhighlightItem) {
        self.didUnhighlightItem(collectionView, indexPath, self.delegate);
        return;
    }
    [self.delegate collectionView:collectionView didUnhighlightItemAtIndexPath:indexPath];
}

#pragma mark -

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wpartial-availability"
    if (self.willDisplayCell) {
        self.willDisplayCell(collectionView, cell, indexPath, self.delegate);
        return;
    }
    [self.delegate collectionView:collectionView willDisplayCell:cell forItemAtIndexPath:indexPath];
#pragma clang diagnostic pop
}

- (void)collectionView:(UICollectionView *)collectionView willDisplaySupplementaryView:(UICollectionReusableView *)view forElementKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wpartial-availability"
    if (self.willDisplaySupplementaryView) {
        self.willDisplaySupplementaryView(collectionView, view, elementKind, indexPath, self.delegate);
        return;
    }
    [self.delegate collectionView:collectionView willDisplaySupplementaryView:view forElementKind:elementKind atIndexPath:indexPath];
#pragma clang diagnostic pop
}

- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.didEndDisplayingCell) {
        self.didEndDisplayingCell(collectionView, cell, indexPath, self.delegate);
        return;
    }
    [self.delegate collectionView:collectionView didEndDisplayingCell:cell forItemAtIndexPath:indexPath];
}

- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingSupplementaryView:(UICollectionReusableView *)view forElementOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath {
    if (self.didEndDisplayingSupplementaryView) {
        self.didEndDisplayingSupplementaryView(collectionView, view, elementKind, indexPath, self.delegate);
        return;
    }
    [self.delegate collectionView:collectionView didEndDisplayingSupplementaryView:view forElementOfKind:elementKind atIndexPath:indexPath];
}

#pragma mark -

- (UICollectionViewTransitionLayout *)collectionView:(UICollectionView *)collectionView transitionLayoutForOldLayout:(UICollectionViewLayout *)fromLayout newLayout:(UICollectionViewLayout *)toLayout {
    if (self.transitionLayout) {
        return self.transitionLayout(collectionView, fromLayout, toLayout, self.delegate);
    }
    return (UICollectionViewTransitionLayout *_Nonnull)[self.delegate collectionView:collectionView transitionLayoutForOldLayout:fromLayout newLayout:toLayout];
}

- (CGPoint)collectionView:(UICollectionView *)collectionView targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset {
    if (self.targetContentOffset) {
        return self.targetContentOffset(collectionView, proposedContentOffset, self.delegate);
    }
    return [self.delegate collectionView:collectionView targetContentOffsetForProposedContentOffset:proposedContentOffset];
}

- (NSIndexPath *)collectionView:(UICollectionView *)collectionView targetIndexPathForMoveFromItemAtIndexPath:(NSIndexPath *)originalIndexPath toProposedIndexPath:(NSIndexPath *)proposedIndexPath {
    if (self.targetIndexPathForMoveFromItem) {
        return self.targetIndexPathForMoveFromItem(collectionView, originalIndexPath, proposedIndexPath, self.delegate);
    }
    return [self.delegate collectionView:collectionView targetIndexPathForMoveFromItemAtIndexPath:originalIndexPath toProposedIndexPath:proposedIndexPath];
}

#pragma mark -

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
#pragma clang diagnostic ignored "-Wdeprecated-implementations"

- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.shouldShowMenuForItem) {
        return self.shouldShowMenuForItem(collectionView, indexPath, self.delegate);
    }
    return [self.delegate collectionView:collectionView shouldShowMenuForItemAtIndexPath:indexPath];
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
    if (self.canPerformAction) {
        return self.canPerformAction(collectionView, action, indexPath, sender, self.delegate);
    }
    return [self.delegate collectionView:collectionView canPerformAction:action forItemAtIndexPath:indexPath withSender:sender];
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
    if (self.performAction) {
        self.performAction(collectionView, action, indexPath, sender, self.delegate);
        return;
    }
    [self.delegate collectionView:collectionView performAction:action forItemAtIndexPath:indexPath withSender:sender];
}

#pragma clang diagnostic pop

#if defined(__IPHONE_13_0) && __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_13_0
- (UIContextMenuConfiguration *)collectionView:(UICollectionView *)collectionView contextMenuConfigurationForItemAtIndexPath:(NSIndexPath *)indexPath point:(CGPoint)point {
    if (self.contextMenuConfigurationForItem) {
        return self.contextMenuConfigurationForItem(collectionView, indexPath, point, self.delegate);
    }
    return [self.delegate collectionView:collectionView contextMenuConfigurationForItemAtIndexPath:indexPath point:point];
}

- (nullable UITargetedPreview *)collectionView:(UICollectionView *)collectionView previewForHighlightingContextMenuWithConfiguration:(UIContextMenuConfiguration *)configuration {
    if (self.previewForHighlightingContextMenu) {
        return self.previewForHighlightingContextMenu(collectionView, configuration, self.delegate);
    }
    return [self.delegate collectionView:collectionView previewForHighlightingContextMenuWithConfiguration:configuration];
}

- (nullable UITargetedPreview *)collectionView:(UICollectionView *)collectionView previewForDismissingContextMenuWithConfiguration:(UIContextMenuConfiguration *)configuration {
    if (self.previewForDismissingContextMenu) {
        return self.previewForDismissingContextMenu(collectionView, configuration, self.delegate);
    }
    return [self.delegate collectionView:collectionView previewForDismissingContextMenuWithConfiguration:configuration];
}

- (void)collectionView:(UICollectionView *)collectionView willPerformPreviewActionForMenuWithConfiguration:(UIContextMenuConfiguration *)configuration animator:(id<UIContextMenuInteractionCommitAnimating>)animator {
    if (self.willPerformPreviewActionForMenu) {
        self.willPerformPreviewActionForMenu(collectionView, configuration, animator, self.delegate);
        return;
    }
    [self.delegate collectionView:collectionView willPerformPreviewActionForMenuWithConfiguration:configuration animator:animator];
}
#endif

- (BOOL)collectionView:(UICollectionView *)collectionView canFocusItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.canFocusItem) {
        return self.canFocusItem(collectionView, indexPath, self.delegate);
    }
    return [self.delegate collectionView:collectionView canFocusItemAtIndexPath:indexPath];
}

- (NSIndexPath *)indexPathForPreferredFocusedViewInCollectionView:(UICollectionView *)collectionView {
    if (self.indexPathForPreferredFocusedView) {
        return self.indexPathForPreferredFocusedView(collectionView, self.delegate);
    }
    return [self.delegate indexPathForPreferredFocusedViewInCollectionView:collectionView];
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldUpdateFocusInContext:(UICollectionViewFocusUpdateContext *)context {
    if (self.shouldUpdateFocus) {
        return self.shouldUpdateFocus(collectionView, context, self.delegate);
    }
    return [self.delegate collectionView:collectionView shouldUpdateFocusInContext:context];
}

- (void)collectionView:(UICollectionView *)collectionView didUpdateFocusInContext:(UICollectionViewFocusUpdateContext *)context withAnimationCoordinator:(UIFocusAnimationCoordinator *)coordinator {
    if (self.didUpdateFocus) {
        return self.didUpdateFocus(collectionView, context, coordinator, self.delegate);
    }
    return [self.delegate collectionView:collectionView didUpdateFocusInContext:context withAnimationCoordinator:coordinator];
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldSpringLoadItemAtIndexPath:(NSIndexPath *)indexPath withContext:(id<UISpringLoadedInteractionContext>)context {
    if (self.shouldSpringLoadItem) {
        return self.shouldSpringLoadItem(collectionView, indexPath, context, self.delegate);
    }
    return [self.delegate collectionView:collectionView shouldSpringLoadItemAtIndexPath:indexPath withContext:context];
}

#pragma clang diagnostic pop

@end
