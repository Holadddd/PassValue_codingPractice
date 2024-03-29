//
//  ViewController.swift
//  PassValue_codingPractice
//
//  Created by wu1221 on 2019/8/20.
//  Copyright © 2019 wu1221. All rights reserved.
//

import UIKit

enum Result<T> {
    
    case success(T)
    
    case failure(Error)
}

//struct textObject {
//    var text: String
//}
//
//class textRFObject {
//    var text: String
//    init(text: String) {
//        self.text = text
//    }
//}
enum TextValue<T,P> {
    case upDate(T,P)
    case add(T)
}
protocol PassValue {
    func updateCell(text: String, indexpath:IndexPath)
    
    func addCell(text: String)
    
    func deleteCell(_ cell:PassValueTableViewCell)
}

class ViewController: UIViewController {
    
//    var textArr: [textRFObject] = [textRFObject(text: "2"), textRFObject(text: "3"), textRFObject(text: "4"), textRFObject(text: "5")]

    var textArr: [String] = ["2", "3", "4", "5"]
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func addTextButton(_ sender: UIBarButtonItem) {
        addButton()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        print(textArr)
        tableView.reloadData()
        
        
    }

}

extension ViewController: UITableViewDelegate {
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return textArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let info = textArr[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PassValueTableViewCell") as? PassValueTableViewCell else { fatalError() }
        cell.showTextLabel.text = info
        //closure
//        cell.completion = {(cell: UITableViewCell)->Void in
//            guard let cell = cell as? PassValueTableViewCell else { fatalError() }
//            self.deleteCell(cell)
//        }
        
        //target_action
        cell.deleteBtn.accessibilityElements = [cell]
        cell.deleteBtn.addTarget(self, action: #selector(ViewController.btnDeleteCell), for: .touchUpInside)
        
        //delegate
        //        cell.delegate = self
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "AddTextViewController") as? AddTextViewController else { fatalError() }
        vc.valueFromVC = textArr[indexPath.row]
        vc.selectIndexpath = indexPath

        //delegate
//        vc.delegate = self
        
        //closure
        vc.completion = { (text:TextValue<String, IndexPath>) -> Void in
            switch text {
            case .add(let text):
                self.addCell(text: text)
            case .upDate(let text, let indexpath):
                print(text)
                print(indexpath)
                self.updateCell(text: text, indexpath: indexpath)
            }
        }
        
        show(vc, sender: nil)
    }
    
    func addButton() {
        
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "AddTextViewController") as? AddTextViewController else { fatalError() }
        //delegate
        //        vc.delegate = self
        //closure
        vc.completion = { (text:TextValue<String, IndexPath>) -> Void in
            switch text {
            case .add(let text):
                self.addCell(text: text)
            case .upDate(let text, let indexpath):
                print(text)
                print(indexpath)
                self.updateCell(text: text, indexpath: indexpath)
            }
        }
        
        show(vc, sender: nil)
    }
}

extension ViewController {
    
    @objc func btnDeleteCell(sender: UIButton) {
        //accessibilityElements store cell
//        print(sender.accessibilityElements![0])
//        guard let cell = sender.accessibilityElements?[0] as? PassValueTableViewCell else { fatalError() }
        //superView sender(UIButton) -> UITableViewCellContentView(some) -> PassValueTableViewCell(some)
        guard let cell = sender.superview?.superview as? PassValueTableViewCell else { fatalError() }
        print(cell)
        deleteCell(cell)
    }

}
extension ViewController: PassValue {
    //protocol
    func updateCell(text: String, indexpath:IndexPath) {
        textArr.remove(at: indexpath.row)
        textArr.insert(text, at: indexpath.row)
        tableView.reloadData()
    }

    func addCell(text: String) {
        textArr.append(text)
        tableView.reloadData()
    }

    func deleteCell(_ cell:PassValueTableViewCell) {
        guard let indexPath = tableView.indexPath(for: cell) else { fatalError() }
        print(indexPath)
        textArr.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
    }
    
}

extension ViewController {
    
    

}
