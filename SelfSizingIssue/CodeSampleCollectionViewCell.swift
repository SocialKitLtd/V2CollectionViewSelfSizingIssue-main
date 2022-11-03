//
//  CodeSampleCollectionViewCell.swift
//  SelfSizingIssue
//
//  Created by Don Mag on 11/3/22.
//

import UIKit

class CodeSampleCollectionViewCell: UICollectionViewCell {
	
	public let myLabel = UILabel()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		commonInit()
	}
	required init?(coder: NSCoder) {
		super.init(coder: coder)
		commonInit()
	}
	private func commonInit() {
		
		myLabel.translatesAutoresizingMaskIntoConstraints = false
		myLabel.font = .systemFont(ofSize: 17.0, weight: .regular)
		myLabel.textAlignment = .center
		
		contentView.addSubview(myLabel)
		
		NSLayoutConstraint.activate([
			// add 5-points "padding" on all sides
			myLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5.0),
			myLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5.0),
			myLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5.0),
			myLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5.0),
		])

	}

}
