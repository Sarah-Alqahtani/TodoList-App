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
            
            if ToDolist.cheack == true {
                        cell.accessoryType = .checkmark
                    }else {
                        cell.accessoryType = .none
                    }
                    return cell
        
        }

   override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       let todolist = ArrNot[indexPath.row]
              todolist.cheack = true
              print(todolist)
              
              tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
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

extension TableViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 900)
    }
}
