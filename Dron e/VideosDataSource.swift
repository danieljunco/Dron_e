//
//  VideosDataSource.swift
//  Dron e
//
//  Created by Daniel Junco on 5/4/17.
//  Copyright © 2017 Daniel Junco. All rights reserved.
//

import UIKit

class VideosDataSource: NSObject, UICollectionViewDataSource {
    var photos = [Photo]()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let identifier = "UICollectionView"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
        return cell
    }
}
