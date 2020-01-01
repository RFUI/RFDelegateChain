/*
 UISearchBarDelegateChain
 RFDelegateChain

 Copyright © 2014, 2019 RFUI
 https://github.com/RFUI/RFDelegateChain

 The MIT License (MIT)
 http://www.opensource.org/licenses/mit-license.php
 */
#import "RFDelegateChain.h"

NS_ASSUME_NONNULL_BEGIN

@interface UISearchBarDelegateChain : RFDelegateChain <
    UISearchBarDelegate
>

@property (weak, nullable, nonatomic) IBOutlet id<UISearchBarDelegate> delegate;

#pragma mark Managing the Search Text

@property (nullable) void (^textDidChange)(UISearchBar *searchBar, NSString *searchText, id<UISearchBarDelegate> __nullable delegate);
@property (nullable) BOOL (^shouldChangeTextInRange)(UISearchBar *searchBar, NSRange range, NSString *replacementText, id<UISearchBarDelegate> __nullable delegate);
@property (nullable) BOOL (^shouldBeginEditing)(UISearchBar *searchBar, id<UISearchBarDelegate> __nullable delegate);
@property (nullable) void (^didBeginEditing)(UISearchBar *searchBar, id<UISearchBarDelegate> __nullable delegate);
@property (nullable) BOOL (^shouldEndEditing)(UISearchBar *searchBar, id<UISearchBarDelegate> __nullable delegate);
@property (nullable) void (^didEndEditing)(UISearchBar *searchBar, id<UISearchBarDelegate> __nullable delegate);

#pragma mark Responding to Clicks in Search Controls

@property (nullable) void (^bookmarkButtonClicked)(UISearchBar *searchBar, id<UISearchBarDelegate> __nullable delegate);
@property (nullable) void (^cancelButtonClicked)(UISearchBar *searchBar, id<UISearchBarDelegate> __nullable delegate);
@property (nullable) void (^searchButtonClicked)(UISearchBar *searchBar, id<UISearchBarDelegate> __nullable delegate);
@property (nullable) void (^resultsListButtonClicked)(UISearchBar *searchBar, id<UISearchBarDelegate> __nullable delegate);

#pragma mark Responding to Scope Button Changes

@property (nullable) void (^selectedScopeButtonIndexDidChange)(UISearchBar *searchBar, NSInteger selectedScope, id<UISearchBarDelegate> __nullable delegate);

@end

NS_ASSUME_NONNULL_END
