# RFDelegateChain

[![Build Status](https://img.shields.io/travis/RFUI/RFDelegateChain.svg?style=flat-square&colorA=333333&colorB=6600cc)](https://travis-ci.org/RFUI/RFDelegateChain)
[![Codecov](https://img.shields.io/codecov/c/github/RFUI/RFDelegateChain.svg?style=flat-square&colorA=333333&colorB=6600cc)](https://codecov.io/gh/RFUI/RFDelegateChain)
[![CocoaPods](https://img.shields.io/cocoapods/v/RFDelegateChain.svg?style=flat-square&colorA=333333&colorB=6600cc)](https://cocoapods.org/pods/RFDelegateChain)

DelegateChain allows the implementation of delegation to be distributed across multiple objects, compared to the traditional delegate mechanism.

## Requirements

Xcode 10+.

## CocoaPods Install

```ruby
pod 'RFDelegateChain'
```

With specified subspecs:

```ruby
pod 'RFDelegateChain', :subspecs => ['UICollectionViewDataSource', 'UITextFieldDelegate']
```

Subspec available:

* UICollectionViewDataSource
* UICollectionViewDelegate
* UICollectionViewDelegateFlowLayout
* UIScrollViewDelegate
* UISearchBarDelegate
* UITextFieldDelegate
* UITextViewDelegate
* UIWebViewDelegate
