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
    
    var valueFromVC: String? {
        didSet {
            
        }
    }
    
    var delegate: PassValue?
    
    var selectIndexpath: IndexPath?
    
    
    var completion: ((TextValue<String, IndexPath>) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textFieldSetUp()
        buttonSetUp()

        guard let text = valueFromVC else { return }
        textField.text = text
        
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
        
        if valueFromVC == nil {
            guard let text = textField.text else { return }
            //delegate
            self.delegate?.addCell(text: text)
            //closure
            completion?(.add(text))
        } else {
            guard let text = textField.text else { return }
            guard let indexpath = selectIndexpath else { return }
            //deleagte
            self.delegate?.updateCell(text: text, indexpath: indexpath)
            //closure
            completion?(.upDate(text,indexpath))
        }
        self.navigationController?.popViewController(animated: true)
    }
    
    
}
