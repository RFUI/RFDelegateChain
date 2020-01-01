
#import "UICollectionViewDataSourceChain.h"

@implementation UICollectionViewDataSourceChain
@dynamic delegate;

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunguarded-availability"
// All methods must be included in the build result, whatever the deployment target version is.
// As a target which includes this library may be build with a higher deployment version.

- (BOOL)respondsToSelector:(SEL)aSelector {
    _RFDelegateChainHasBlockPropertyRespondsToSelector(numberOfItemsInSection, collectionView:numberOfItemsInSection:)
    _RFDelegateChainHasBlockPropertyRespondsToSelector(cellForItemAtIndexPath, collectionView:cellForItemAtIndexPath:)
    _RFDelegateChainHasBlockPropertyRespondsToSelector(numberOfSections, numberOfSectionsInCollectionView:)
    _RFDelegateChainHasBlockPropertyRespondsToSelector(viewForSupplementaryElement, collectionView:viewForSupplementaryElementOfKind:atIndexPath:)
    _RFDelegateChainHasBlockPropertyRespondsToSelector(canMoveItem, collectionView:canMoveItemAtIndexPath:)
    _RFDelegateChainHasBlockPropertyRespondsToSelector(moveItem, collectionView:moveItemAtIndexPath:toIndexPath:)
    _RFDelegateChainHasBlockPropertyRespondsToSelector(indexTitles, indexTitlesForCollectionView:)
    _RFDelegateChainHasBlockPropertyRespondsToSelector(indexPathForIndexTitle, collectionView:indexPathForIndexTitle:atIndex:)
    return [super respondsToSelector:aSelector];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (self.numberOfItemsInSection) {
        return self.numberOfItemsInSection(collectionView, section, self.delegate);
    }
    return [self.delegate collectionView:collectionView numberOfItemsInSection:section];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.cellForItemAtIndexPath) {
        return self.cellForItemAtIndexPath(collectionView, indexPath, self.delegate);
    }
    return (UICollectionViewCell *_Nonnull)[self.delegate collectionView:collectionView cellForItemAtIndexPath:indexPath];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    if (self.numberOfSections) {
        return self.numberOfSections(collectionView, self.delegate);
    }
    return [self.delegate numberOfSectionsInCollectionView:collectionView];
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if (self.viewForSupplementaryElement) {
        return self.viewForSupplementaryElement(collectionView, kind, indexPath, self.delegate);
    }
    return (UICollectionReusableView *_Nonnull)[self.delegate collectionView:collectionView viewForSupplementaryElementOfKind:kind atIndexPath:indexPath];
}

- (BOOL)collectionView:(UICollectionView *)collectionView canMoveItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.canMoveItem) {
        return self.canMoveItem(collectionView, indexPath, self.delegate);
    }
    return [self.delegate collectionView:collectionView canMoveItemAtIndexPath:indexPath];
}

- (void)collectionView:(UICollectionView *)collectionView moveItemAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    if (self.moveItem) {
        self.moveItem(collectionView, sourceIndexPath, destinationIndexPath, self.delegate);
        return;
    }
    return [self.delegate collectionView:collectionView moveItemAtIndexPath:sourceIndexPath toIndexPath:destinationIndexPath];
}

- (NSArray<NSString *> *)indexTitlesForCollectionView:(UICollectionView *)collectionView {
    if (self.indexTitles) {
        return self.indexTitles(collectionView, self.delegate);
    }
    return [self.delegate indexTitlesForCollectionView:collectionView];
}

- (NSIndexPath *)collectionView:(UICollectionView *)collectionView indexPathForIndexTitle:(NSString *)title atIndex:(NSInteger)index {
    if (self.indexPathForIndexTitle) {
        return self.indexPathForIndexTitle(collectionView, title, index, self.delegate);
    }
    return [self.delegate collectionView:collectionView indexPathForIndexTitle:title atIndex:index];
}

#pragma clang diagnostic pop

@end
