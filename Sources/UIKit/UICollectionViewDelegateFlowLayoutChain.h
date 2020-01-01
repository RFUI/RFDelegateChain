/*
 UICollectionViewDelegateFlowLayoutChain
 RFDelegateChain

 Copyright © 2015, 2019 RFUI
 https://github.com/RFUI/RFDelegateChain

 The MIT License (MIT)
 http://www.opensource.org/licenses/mit-license.php
 */
#import "UICollectionViewDelegateChain.h"

NS_ASSUME_NONNULL_BEGIN

@interface UICollectionViewDelegateFlowLayoutChain : UICollectionViewDelegateChain <
    UICollectionViewDelegateFlowLayout
>

@property (weak, nullable, nonatomic) IBOutlet id<UICollectionViewDelegateFlowLayout> delegate;

#pragma mark Getting the Size of Items

@property (nullable) CGSize (^sizeForItem)(UICollectionView *collectionView, UICollectionViewLayout *collectionViewLayout, NSIndexPath *indexPath, id<UICollectionViewDelegateFlowLayout> __nullable delegate);

#pragma mark Getting the Section Spacing

@property (nullable) UIEdgeInsets (^insetForSection)(UICollectionView *collectionView, UICollectionViewLayout *collectionViewLayout, NSInteger section, id<UICollectionViewDelegateFlowLayout> __nullable delegate);

@property (nullable) CGFloat (^minimumLineSpacingForSection)(UICollectionView *collectionView, UICollectionViewLayout *collectionViewLayout, NSInteger section, id<UICollectionViewDelegateFlowLayout> __nullable delegate);

@property (nullable) CGFloat (^minimumInteritemSpacingForSection)(UICollectionView *collectionView, UICollectionViewLayout *collectionViewLayout, NSInteger section, id<UICollectionViewDelegateFlowLayout> __nullable delegate);

#pragma mark Getting the Header and Footer Sizes

@property (nullable) CGSize (^referenceSizeForHeaderInSection)(UICollectionView *collectionView, UICollectionViewLayout *collectionViewLayout, NSInteger section, id<UICollectionViewDelegateFlowLayout> __nullable delegate);

@property (nullable) CGSize (^referenceSizeForFooterInSection)(UICollectionView *collectionView, UICollectionViewLayout *collectionViewLayout, NSInteger section, id<UICollectionViewDelegateFlowLayout> __nullable delegate);

@end

NS_ASSUME_NONNULL_END
