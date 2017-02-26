//
//  ViewController.swift
//  MyTODOList
//
//  Created by Admin on 04.12.16.
//  Copyright © 2016 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    //@available(iOS 2.0, *)
    



    @IBOutlet weak var tableView: UITableView!
    var names = [String]()
    //@IBOutlet weak var addName: UIBarButtonItem!
    
    @IBAction func addName(_ sender: AnyObject) {
        var alert = UIAlertController(title: "Новая задача", message: "Добавьте новую задачу", preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Сохранить", style: .default)  {(action: UIAlertAction!) -> Void in
            let textField = alert.textFields![0]
            self.names.append(textField.text!)
            self.tableView.reloadData()
        }
        
        
        let cancelAction = UIAlertAction(title: "Отменить", style: .default) { (action: UIAlertAction!) -> Void in}
            
        alert.addTextField(configurationHandler: {(textField: UITextField!) -> Void in})
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Мой список дел"
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return names.count
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        cell?.textLabel?.text = names[indexPath.row]
        return cell!
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

