Pod::Spec.new do |ss|
  ss.name       = 'RFDelegateChain'
  ss.version    = '2.1.0'
  ss.summary    = 'DelegateChain allows the implementation of delegation to be distributed across multiple objects.'
  ss.homepage   = 'https://github.com/RFUI/RFDelegateChain'
  ss.license    = { :type => 'MIT' }
  ss.authors    = { 'BB9z' => 'BB9z@me.com' }
  ss.source     = {
    :git => 'https://github.com/RFUI/RFDelegateChain.git',
    :tag => ss.version.to_s
  }
  
  ss.osx.deployment_target = '10.8'
  ss.ios.deployment_target = '9.0'
  ss.tvos.deployment_target = '9.0'
  ss.watchos.deployment_target = '2.0'

  ss.requires_arc = true

  ss.subspec 'Chain' do |s|
    s.dependency 'RFKit/Runtime', '>=1.7.1'
    s.dependency 'RFInitializing', '>=1.1'
    s.source_files = 'Sources/RFDelegateChain/*.{h,m}'
    s.public_header_files = 'Sources/RFDelegateChain/*.h'
  end

  ss.subspec 'UICollectionViewDataSource' do |s|
    s.ios.deployment_target = '8.0'
    s.tvos.deployment_target = '9.0'
    s.dependency 'RFDelegateChain/Chain'
    s.source_files = 'Sources/UIKit/UICollectionViewDataSourceChain.{h,m}'
    s.public_header_files = 'Sources/UIKit/UICollectionViewDataSourceChain.h'
  end

  ss.subspec 'UICollectionViewDelegate' do |s|
    s.ios.deployment_target = '8.0'
    s.tvos.deployment_target = '9.0'
    s.dependency 'RFDelegateChain/UIScrollViewDelegate'
    s.source_files = 'Sources/UIKit/UICollectionViewDelegateChain.{h,m}'
    s.public_header_files = 'Sources/UIKit/UICollectionViewDelegateChain.h'
  end

  ss.subspec 'UICollectionViewDelegateFlowLayout' do |s|
    s.ios.deployment_target = '8.0'
    s.tvos.deployment_target = '9.0'
    s.dependency 'RFDelegateChain/UICollectionViewDelegate'
    s.source_files = 'Sources/UIKit/UICollectionViewDelegateFlowLayoutChain.{h,m}'
    s.public_header_files = 'Sources/UIKit/UICollectionViewDelegateFlowLayoutChain.h'
  end

  ss.subspec 'UIScrollViewDelegate' do |s|
    s.ios.deployment_target = '8.0'
    s.tvos.deployment_target = '9.0'
    s.dependency 'RFDelegateChain/Chain'
    s.source_files = 'Sources/UIKit/UIScrollViewDelegateChain.{h,m}'
    s.public_header_files = 'Sources/UIKit/UIScrollViewDelegateChain.h'
  end

  ss.subspec 'UISearchBarDelegate' do |s|
    s.ios.deployment_target = '8.0'
    s.dependency 'RFDelegateChain/Chain'
    s.source_files = 'Sources/UIKit/UISearchBarDelegateChain.{h,m}'
    s.public_header_files = 'Sources/UIKit/UISearchBarDelegateChain.h'
  end

  ss.subspec 'UITextFieldDelegate' do |s|
    s.ios.deployment_target = '8.0'
    s.tvos.deployment_target = '9.0'
    s.dependency 'RFDelegateChain/Chain'
    s.source_files = 'Sources/UIKit/UITextFiledDelegateChain.{h,m}'
    s.public_header_files = 'Sources/UIKit/UITextFiledDelegateChain.h'
  end

  ss.subspec 'UITextViewDelegate' do |s|
    s.ios.deployment_target = '8.0'
    s.tvos.deployment_target = '9.0'
    s.dependency 'RFDelegateChain/Chain'
    s.source_files = 'Sources/UIKit/UITextViewDelegateChain.{h,m}'
    s.public_header_files = 'Sources/UIKit/UITextViewDelegateChain.h'
  end
end
