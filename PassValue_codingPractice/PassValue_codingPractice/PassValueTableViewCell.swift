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
    
//    @IBAction func deleteButton(_ sender: UIButton) {
////        delegate?.deleteCell(self)
//        completion?(self)
//    }
    
    @IBOutlet weak var deleteBtn: UIButton!
    
    var completion: ((UITableViewCell)->Void)?
    
    
    var delegate: PassValue?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        deleteBtn.addTarget(self, action: #selector(PassValueTableViewCell.btn), for: .touchUpInside)
        
    }

    @objc func btn(_ sender: UIButton){
    delegate?.deleteCell(self)
    //        completion?(self)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
