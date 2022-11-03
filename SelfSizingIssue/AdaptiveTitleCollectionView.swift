//
//  MusicToolsNavigationBar.swift
//  Music
//
//  Created by Roi Mulia on 14/03/2022.
//

import UIKit

class AdaptiveTitleCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
	
	// use var so we can set the data from the controller
	var items = ["this", "is", "example", "for", "some", "data", "in", "array"]
	var selectedIndexPath: IndexPath = .init(item: 0, section: 0)
	
	override var intrinsicContentSize: CGSize {
		return contentSize
	}
	
	override var contentSize: CGSize {
		didSet {
			guard contentSize.width > oldValue.width else {
				return
			}
			print("old values \(oldValue). new value \(contentSize)")
			DispatchQueue.main.async {
				self.setNeedsLayout()
				self.layoutIfNeeded()
				self.invalidateIntrinsicContentSize()
			}
			
		}
	}
	
	init() {
		let flowLayout = UICollectionViewFlowLayout()
		flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
		flowLayout.scrollDirection = .horizontal
		flowLayout.sectionInset = .init(top: 16, left: 8, bottom: 16, right: 8)
		flowLayout.sectionInsetReference = .fromContentInset
		flowLayout.minimumLineSpacing = 5
		flowLayout.minimumInteritemSpacing = 5
		super.init(frame: .zero, collectionViewLayout: flowLayout)
		register(UINib(nibName: "SampleCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SampleCollectionViewCell")
		delegate = self
		dataSource = self
		contentInset = .zero
		delaysContentTouches = true
		
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return items.count
		
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SampleCollectionViewCell", for: indexPath) as! SampleCollectionViewCell

		let item = items[indexPath.item]
		cell.setNeedsLayout()
		cell.layoutIfNeeded()
		cell.myLabel.text = item
		cell.backgroundColor = .red
		cell.myLabel.backgroundColor = indexPath == selectedIndexPath ? .yellow : .green
		collectionView.backgroundColor = .brown
		return cell
		
	}
	
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		selectedIndexPath = indexPath
		reloadData()
	}
	
	// Workaround for undefined layout behaviour to get rid of the warnings
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SampleCollectionViewCell", for: indexPath)
        cell.layoutIfNeeded()
        let size = cell.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        return CGSize(width: size.width + 2000, height: size.height)
        
    }
	
}


