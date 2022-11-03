//
//  DonMagTitleCollectionView.swift
//  SelfSizingIssue
//
//  Created by Don Mag on 11/3/22.
//

import UIKit

class DonMagTitleCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

	// use var so we can set the data from the controller
	var items: [String] = ["this", "is", "example", "for", "some", "data", "in", "array"]
	
	override var intrinsicContentSize: CGSize {
		return contentSize
	}
	
	override var contentSize: CGSize {
		didSet {
			guard contentSize.width > oldValue.width else {
				return
			}
			print("dm old values \(oldValue). new value \(contentSize)")
			DispatchQueue.main.async {
				self.setNeedsLayout()
				self.layoutIfNeeded()
				self.invalidateIntrinsicContentSize()
			}
			
		}
	}
	
	init() {
		let flowLayout = UICollectionViewFlowLayout()
		
		// using a small width for estimated size
		//		- our cell has a label with 5-points Leading/Trailing
		//		- if our cell's label is empty, the cell will be 10-points wide
		//		- so we need at least that width to avoid auto-layout complaints
		// along with the contentSize / intrinsicContentSize code above
		//	this allows the collection view width to "shrink" when the cells' total width
		//	is less than the allowed space
		flowLayout.estimatedItemSize = CGSize(width: 10.0, height: 24.0)

		flowLayout.scrollDirection = .horizontal
		
		flowLayout.sectionInset = .init(top: 16, left: 8, bottom: 16, right: 8)
		flowLayout.sectionInsetReference = .fromContentInset
		
		flowLayout.minimumLineSpacing = 5
		flowLayout.minimumInteritemSpacing = 5
		
		super.init(frame: .zero, collectionViewLayout: flowLayout)
		
		register(UINib(nibName: "DonMagSampleCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "DonMagSampleCollectionViewCell")
		
		delegate = self
		dataSource = self
		
		contentInset = .zero
		delaysContentTouches = true
		
		allowsMultipleSelection = false
		
		backgroundColor = .systemOrange
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func didMoveToSuperview() {
		super.didMoveToSuperview()
		// if we want to "pre-Select" a cell
		self.selectItem(at: IndexPath(item: 0, section: 0), animated: false, scrollPosition: .left)
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return items.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DonMagSampleCollectionViewCell", for: indexPath) as! DonMagSampleCollectionViewCell
		
		let item = items[indexPath.item]
		cell.myLabel.text = item
		
		return cell
		
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		// do something on cell selection?
	}
	
}


