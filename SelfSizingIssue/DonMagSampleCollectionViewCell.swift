//
//  DonMagSampleCollectionViewCell.swift
//  SelfSizingIssue
//
//  Created by Don Mag on 11/3/22.
//

import UIKit

class DonMagSampleCollectionViewCell: UICollectionViewCell {
    
	@IBOutlet var myLabel: UILabel!
	
	override func awakeFromNib() {
		super.awakeFromNib()
		// set backgroundColor here
		backgroundColor = .red
		// set "non-selected" label color here
		myLabel.backgroundColor = .green
	}
	
	// this will be called by the collectionView
	override var isSelected: Bool {
		didSet {
			myLabel.backgroundColor = isSelected ? .yellow : .green
		}
	}
	
}
