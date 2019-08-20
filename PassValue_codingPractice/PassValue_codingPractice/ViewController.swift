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

class ViewController: UIViewController {
    
    var textArr: [textRFObject] = [textRFObject(text: "2"), textRFObject(text: "3"), textRFObject(text: "4"), textRFObject(text: "5")]

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
        //target_action
        
        
        //delegate
        cell.showTextLabel.text = info.text
        cell.delegate = self
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "AddTextViewController") as? AddTextViewController else { fatalError() }
        
        vc.valueFromVC = textArr[indexPath.row]
        show(vc, sender: nil)
    }
}

extension ViewController {
    
   

    //delegate
    func deleteCell(_ cell:PassValueTableViewCell) {

        guard let indexPath = tableView.indexPath(for: cell) else { fatalError() }
        print(indexPath)
        textArr.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
        
    }
    
}

extension ViewController {
    
    func addButton() {

        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "AddTextViewController") as? AddTextViewController else { fatalError() }
        textArr.append(textRFObject(text: ""))
        vc.valueFromVC = textArr[textArr.count-1]
        show(vc, sender: nil)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = sender as? IndexPath else { fatalError() }
        guard let vc = segue.destination as? AddTextViewController else { return }
        let info = textArr[indexPath.row]
        guard let text = info.text as? String else { fatalError() }
        print(text)
        print(indexPath)
        
    }
}

struct textObject {
    var text: String
}

class textRFObject {
    var text: String
    init(text: String) {
        self.text = text
    }
}
