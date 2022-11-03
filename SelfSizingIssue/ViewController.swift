//
//  ViewController.swift
//  selfSizingIssue
//
//  Created by Roi Mulia on 02/11/2022.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet var containerView: UIView!
	@IBOutlet var modContainerView: UIView!
	@IBOutlet var dmContainerView: UIView!

	@IBOutlet var infoLabel: UILabel!
	
	let collectionView = AdaptiveTitleCollectionView()
	let modCollectionView = CodeCellTitleCollectionView()
	let dmCollectionView = DonMagTitleCollectionView()

	override func viewDidLoad() {
        super.viewDidLoad()

		// let's use a longer array of items
		//	so we have a better example of cell scrolling
		let items: [String] = [
			// for "narrow / centering" testing
			"this", "Sunday", "is",
			// un-comment next line for "wide / no-jumping-back" testing
			"Monday", "example", "Tuesday", "for", "Wednesday", "some", "Thursday", "data", "Friday", "in", "Saturday"
		]
		
		collectionView.items = items
		modCollectionView.items = items
		dmCollectionView.items = items
		
//		containerView.addSubview(collectionView)
//		collectionView.bindMarginsToSuperview()
//		
//		modContainerView.addSubview(modCollectionView)
//		modCollectionView.bindMarginsToSuperview()
		
		dmContainerView.addSubview(dmCollectionView)
		dmCollectionView.bindMarginsToSuperview()
		
		// Do any additional setup after loading the view.
    }

	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		var s = "Tap to get selected indexPaths:\n\n"
		if let selPath = collectionView.indexPathsForSelectedItems {
			if selPath.isEmpty {
				s += "collectionView has NO selected item(s)!"
				s += "\n"
				s += "selectedIndexPath property: \(collectionView.selectedIndexPath)"
			} else {
				s += "collectionView selected items: \(selPath)"
			}
		}

		s += "\n\n"

		if let selPath = modCollectionView.indexPathsForSelectedItems {
			if selPath.isEmpty {
				s += "modCollectionView has NO selected item(s)!"
				s += "\n"
				s += "selectedIndexPath property: \(modCollectionView.selectedIndexPath)"
			} else {
				s += "modCollectionView selected items: \(selPath)"
			}
		}

		s += "\n\n"

		if let selPath = dmCollectionView.indexPathsForSelectedItems {
			if selPath.isEmpty {
				s += "dmCollectionView has NO selected item(s)!"
			} else {
				s += "dmCollectionView selected items: \(selPath)"
			}
		}
		infoLabel.text = s
	}

}

public extension UIViewController {
    func addAsChildTo(parentVc: UIViewController, inside container: UIView, insets: UIEdgeInsets = .zero) {
        parentVc.addChild(self)
        self.view.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(self.view)
        
        view.bindMarginsToSuperview(insets: insets)
        didMove(toParent: parentVc)
    }
    
}

extension UIView {
    func bindMarginsToSuperview(insets: UIEdgeInsets = .zero) {
        guard let superview = self.superview else {
            print("Error! `superview` was nil – call `addSubview(view: UIView)` before calling `bindFrameToSuperviewBounds()` to fix this.")
            return
        }
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: insets.left).isActive = true
        self.trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: insets.right).isActive = true
        self.topAnchor.constraint(equalTo: superview.topAnchor, constant: insets.top).isActive = true
        self.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: insets.bottom).isActive = true
    }
}

