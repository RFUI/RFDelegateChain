//
//  TestCollectionViewDataSourceChain.swift
//  Test-iOS
//
//  Created by BB9z on 2019/12/31.
//  Copyright © 2019 RFUI. All rights reserved.
//

import XCTest
import UIKit

class TestCollectionViewDataSourceChain: XCTestCase, UICollectionViewDataSource {

    func testInterface() {
        let dc = UICollectionViewDataSourceChain()
        dc.delegate = self
        let cv = UICollectionView(frame: CGRect(x: 0, y: 0, width: 100, height: 100), collectionViewLayout: UICollectionViewFlowLayout())
        cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        cv.dataSource = dc

        XCTAssert(cv.numberOfSections == 1)
        XCTAssert(cv.numberOfItems(inSection: 0) == 2)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        return cell
    }
}
