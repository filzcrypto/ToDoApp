//
//  AddViewController.swift
//  ToDoApp
//
//  Created by Filbert on 16/06/22.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var subtitleTextField: UITextField!
    @IBOutlet weak var descTextView: UITextView!
    
    var listData: [toDoList] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func createButton(_ sender: Any) {
        if(titleTextField.text != "" && subtitleTextField.text != "") {
            if let data = UserDefaults.standard.value(forKey:"ToDoKey") as? Data {
                        let toDo = try? PropertyListDecoder().decode(Array<toDoList>.self, from: data)
                        listData = toDo ?? []
                    }
            let temp = toDoList(title: titleTextField.text ?? "", subtitle: subtitleTextField.text ?? "", description: descTextView.text ?? "")
            listData.append(temp)
            UserDefaults.standard.set(try? PropertyListEncoder().encode(listData), forKey:"ToDoKey")
            let BlueVc =  UIStoryboard(name: "Main", bundle:nil).instantiateViewController(withIdentifier: "ViewController")
            self.navigationController?.pushViewController(BlueVc, animated: true)
        } else {
            let refreshAlert = UIAlertController(title: "Error", message: "Fill the required", preferredStyle: UIAlertController.Style.alert)
            refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
            }))
            present(refreshAlert, animated: true, completion: nil)

        }
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
