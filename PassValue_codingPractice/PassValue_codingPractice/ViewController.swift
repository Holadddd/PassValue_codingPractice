//
//  ViewController.swift
//  PassValue_codingPractice
//
//  Created by wu1221 on 2019/8/20.
//  Copyright © 2019 wu1221. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var textArr = ["2", "3" , "4", "5"]

    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
        
        cell.delegate = self
        return cell
    }
    
    
}
//delegate
extension ViewController {
    
    func deleteCell(_ cell:PassValueTableViewCell) {

        guard let indexPath = tableView.indexPath(for: cell) else { fatalError() }
        print(indexPath)
        textArr.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
        
    }
    
}
