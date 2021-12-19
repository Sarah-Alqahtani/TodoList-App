//
//  TableViewController.swift
//  TodoList App
//
//  Created by admin on 19/12/2021.
//

import CoreData
import UIKit

class TableViewController: UITableViewController {
 

        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let saveContext = (UIApplication.shared.delegate as! AppDelegate).saveContext

        
    
        var ArrNot:[Todo] = []

        override func viewDidLoad() {
            super.viewDidLoad()

       
        }
    override func viewDidAppear(_ animated: Bool) {
        fetchTodos()
        tableView.reloadData()
    }
        

        // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ArrNot.count
    }
        

        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

               let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
            let ToDolist=ArrNot[indexPath.row]
            cell.titlelbl.text=ToDolist.title
            cell.notelbl.text=ToDolist.detalis
        let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd MMM yyyy"
            let selectedDate = dateFormatter.string(from: ToDolist.date!)
            cell.datelbl.text=selectedDate
            
            if ToDolist.cheack{
                        cell.accessoryType = UITableViewCell.AccessoryType.checkmark
                    }

                    return cell
        
        }

   override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let ToDolist = ArrNot[indexPath.row]
       ToDolist.cheack = !ToDolist.cheack
       if let cell = tableView.cellForRow(at: indexPath) {
           tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.checkmark
           
       }else{
           tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.none
           
       }
       saveContext()
       tableView.deselectRow(at: indexPath, animated: true)
   }
    func fetchTodos(){
            let request:NSFetchRequest<Todo> = Todo.fetchRequest()
            do{
                ArrNot = try context.fetch(request)
            }catch{
                print("there is an erorr")
            }
        }

}

