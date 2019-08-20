//
//  AddTextViewController.swift
//  PassValue_codingPractice
//
//  Created by wu1221 on 2019/8/20.
//  Copyright © 2019 wu1221. All rights reserved.
//

import UIKit

class AddTextViewController: UIViewController {
    
    var textField: UITextField! {
        didSet {
            
        }
    }
    
    var checkButton: UIButton! {
        didSet {
            
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldSetUp()
        buttonSetUp()
    }
}

extension AddTextViewController {
    
    func textFieldSetUp() {
        textField = UITextField()
        self.view.addSubview(textField)
        //Auto-Layout
        textField.translatesAutoresizingMaskIntoConstraints = false
        //top to safe area: 100
        textField.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        //Width 為 SuperView 的 2/3
        textField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 2/3 ).isActive = true
        //水平置中
        textField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        //Height 為 40
        textField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        textField.borderStyle = .line
    }
    
    func buttonSetUp() {
        checkButton = UIButton()
        self.view.addSubview(checkButton)
        //Auto-Layout
        checkButton.translatesAutoresizingMaskIntoConstraints = false
        //Width 為 SuperView 的 2/3
        checkButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 2/3).isActive = true
        //水平置中
        checkButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        //Height 為 40
        checkButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        //top 在 super view 的 centerYAnchor 的下方 20 pt
        checkButton.topAnchor.constraint(equalTo: view.centerYAnchor, constant: 20).isActive = true
        checkButton.setTitle("CHECK", for: .normal)
        checkButton.backgroundColor = .black
        checkButton.addTarget(self, action: #selector(AddTextViewController.btn), for: .touchUpInside)
    }
    
    @objc func btn() {
        print(textField.text)
        textField.text = ""
        
        self.navigationController?.popViewController(animated: true)
    }
}
