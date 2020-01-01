/*
 UICollectionViewDataSourceChain
 RFDelegateChain

 Copyright © 2015, 2019 RFUI
 https://github.com/RFUI/RFDelegateChain

 The MIT License (MIT)
 http://www.opensource.org/licenses/mit-license.php
 */
#import "RFDelegateChain.h"

NS_ASSUME_NONNULL_BEGIN

@interface UICollectionViewDataSourceChain : RFDelegateChain <
    UICollectionViewDataSource
>

@property (weak, nullable, nonatomic) IBOutlet id<UICollectionViewDataSource> delegate;

#pragma mark Getting Item and Section Metrics

@property (nullable) NSInteger (^numberOfItemsInSection)(UICollectionView * collectionView, NSInteger section, id<UICollectionViewDataSource> __nullable delegate);

@property (nullable) NSInteger (^numberOfSections)(UICollectionView * collectionView, id<UICollectionViewDataSource> __nullable delegate);

#pragma mark Getting Views for Items

@property (nullable) __kindof UICollectionViewCell * (^cellForItemAtIndexPath)(UICollectionView * collectionView, NSIndexPath *indexPath, id<UICollectionViewDataSource> __nullable delegate);

@property (nullable) UICollectionReusableView* (^viewForSupplementaryElement)(UICollectionView * collectionView, NSString * kind, NSIndexPath * indexPath, id<UICollectionViewDataSource> __nullable delegate);

#pragma mark Reordering Items

@property (nullable) BOOL (^canMoveItem)(UICollectionView * collectionView, NSIndexPath *indexPath, id<UICollectionViewDataSource> __nullable delegate) API_AVAILABLE(ios(9.0), tvos(9.0));
@property (nullable) BOOL (^moveItem)(UICollectionView * collectionView, NSIndexPath *sourceIndexPath, NSIndexPath *destinationIndexPath, id<UICollectionViewDataSource> __nullable delegate) API_AVAILABLE(ios(9.0), tvos(9.0));

#pragma mark Configuring an Index

@property (nullable) NSArray<NSString *> *__nullable (^indexTitles)(UICollectionView * collectionView, id<UICollectionViewDataSource> __nullable delegate) API_AVAILABLE(ios(10.3), tvos(10.2));
@property (nullable) NSIndexPath* (^indexPathForIndexTitle)(UICollectionView * collectionView, NSString *title, NSInteger index, id<UICollectionViewDataSource> __nullable delegate) API_AVAILABLE(ios(10.3), tvos(10.2));

@end

NS_ASSUME_NONNULL_END
