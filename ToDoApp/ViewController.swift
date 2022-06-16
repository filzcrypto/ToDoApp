//
//  ViewController.swift
//  ToDoApp
//
//  Created by Filbert on 16/06/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var listData: [toDoList] = []
    @IBOutlet weak var tableView: UITableView!
    @IBAction func btnPressed(_ sender: Any) {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        if let data = UserDefaults.standard.value(forKey:"ToDoKey") as? Data {
                    let toDo = try? PropertyListDecoder().decode(Array<toDoList>.self, from: data)
                    listData = toDo ?? []
                }
        // Do any additional setup after loading the view.
        tableView.reloadData()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let titleText = listData[indexPath.row].title
        let subtitleText = listData[indexPath.row].subtitle
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
        cell.titleLabel.text = titleText
        cell.subtitleLabel.text = subtitleText
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            listData.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }


}

