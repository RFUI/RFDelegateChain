/*
 UICollectionViewDataSourceChain
 RFDelegateChain

 Copyright © 2015, 2019 RFUI
 https://github.com/RFUI/RFDelegateChain

 The MIT License (MIT)
 http://www.opensource.org/licenses/mit-license.php
 */
#import "RFDelegateChain.h"

@interface UICollectionViewDataSourceChain : RFDelegateChain <
    UICollectionViewDataSource
>

@property (weak, nonatomic) IBOutlet id<UICollectionViewDataSource> delegate;

#pragma mark Getting Item and Section Metrics

@property (copy, nonatomic) NSInteger (^numberOfItemsInSection)(UICollectionView *collectionView, NSInteger section, id<UICollectionViewDataSource> delegate);

@property (copy, nonatomic) NSInteger (^numberOfSections)(UICollectionView *collectionView, id<UICollectionViewDataSource> delegate);

#pragma mark Getting Views for Items

@property (copy, nonatomic) UICollectionViewCell* (^cellForItemAtIndexPath)(UICollectionView *collectionView, NSIndexPath *indexPath, id<UICollectionViewDataSource> delegate);

@property (copy, nonatomic) UICollectionReusableView* (^viewForSupplementaryElement)(UICollectionView *collectionView, NSString *kind, NSIndexPath *indexPath, id<UICollectionViewDataSource> delegate);

@end
