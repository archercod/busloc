//
//  CityTableViewCell.swift
//  Busloc
//
//  Created by Marcin Pietrzak on 19/02/2019.
//  Copyright © 2019 Marcin Pietrzak. All rights reserved.
//

import UIKit

class CityTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    // MARK: - View life cycle

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    // MARK: - Set selected

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Fill
    
    func fill(title: String) {
        self.titleLabel.text = title
    }
}
