//
//  SecondViewController.swift
//  TodoList App
//
//  Created by admin on 19/12/2021.
//

import UIKit

class SecondViewController: UIViewController {
 
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let saveContext = (UIApplication.shared.delegate as! AppDelegate).saveContext
    
    @IBOutlet weak var editTextDetels: UITextField!
    @IBOutlet weak var editTextTitle: UITextField!
    @IBOutlet weak var DatePicker: UIDatePicker!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
       
    }
    
    @IBAction func AddBtn(_ sender: Any) {
        
     
     //   delegate?.DatePicker(by: DatePicker, with: Date)
        let ToDolist = Todo(context: context)
        ToDolist.title=editTextTitle.text
        ToDolist.detalis=editTextDetels.text
        ToDolist.date=DatePicker.date
        
       saveContext()
        dismiss(animated: true)
    }
    
    

}
