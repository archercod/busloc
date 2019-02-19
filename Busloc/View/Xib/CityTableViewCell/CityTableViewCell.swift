//
//  CityTableViewCell.swift
//  Busloc
//
//  Created by Marcin Pietrzak on 19/02/2019.
//  Copyright © 2019 Marcin Pietrzak. All rights reserved.
//

import UIKit

class CityTableViewCell: UITableViewCell {
    
    // MARK: - Configuration
    
    enum ViewConfiguration: String {
        case `default` = "CityTableViewCell"
        
        var nib: UINib? {
            get {
                return UINib(nibName: self.rawValue, bundle: nil)
            }
        }
    }
    
    // MARK: - Outlets
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    // MARK: - View life cycle

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.setupView()
    }
    
    // MARK: - Set selected

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Setups
    
    func setupView() {
        self.containerView.layer.cornerRadius = 8
        self.containerView.clipsToBounds = true
        self.containerView.layer.masksToBounds = false
        
        self.containerView.layer.shadowOffset = CGSize(width: 0, height: 1)
        self.containerView.layer.shadowRadius = 2
        self.containerView.layer.shadowOpacity = 0.5
        self.containerView.layer.shadowColor = UIColor.lightGray.cgColor
        
        self.containerView.layer.borderColor = UIColor.lightGray.cgColor
        self.containerView.layer.borderWidth = 0.5
    }
    
    // MARK: - Fill
    
    func fill(title: String) {
        self.titleLabel.text = title
    }
}
