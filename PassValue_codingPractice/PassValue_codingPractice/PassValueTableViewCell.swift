//
//  PassValueTableViewCell.swift
//  PassValue_codingPractice
//
//  Created by wu1221 on 2019/8/20.
//  Copyright © 2019 wu1221. All rights reserved.
//

import UIKit

class PassValueTableViewCell: UITableViewCell {

    @IBOutlet weak var showTextLabel: UILabel!
    
    @IBAction func deleteButton(_ sender: UIButton) {
//        delegate?.deleteCell(self)
        completion?(self)
    }
    
    var completion: ((UITableViewCell)->Void)?
    
    
    weak var delegate: ViewController?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
