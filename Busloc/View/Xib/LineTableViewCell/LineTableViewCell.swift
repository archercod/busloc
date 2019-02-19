//
//  LineTableViewCell.swift
//  Busloc
//
//  Created by Marcin Pietrzak on 19/02/2019.
//  Copyright © 2019 Marcin Pietrzak. All rights reserved.
//

import UIKit

class LineTableViewCell: UITableViewCell {
    
    // MARK: - Configuration
    
    enum ViewConfiguration: String {
        case `default` = "LineTableViewCell"
        
        var nib: UINib? {
            get {
                return UINib(nibName: self.rawValue, bundle: nil)
            }
        }
    }
    
    // MARK: - Properties
    
    
    // MARK: - Outlets
    
    @IBOutlet weak var lineNumberLabel: UILabel!
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
    }
    
    // MARK: - Fill
    
    func fill(lineNumber: String) {
        self.lineNumberLabel.text = lineNumber
    }
    
}
