//
//  MainTableViewController.swift
//  Notify
//
//  Created by Alumne on 09/11/2020.
//

import UIKit

class MainTableViewController: UITableViewController {
    var tasks: [Task] = [Task]()
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.taskGenerator()
    
    
    }
    
    func taskGenerator() {
        tasks.append(Task(name: "Hola", completed: false))
        tasks.append(Task(name: "Hola2", completed: true))
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
       
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as! TaskTableViewCell
        
        cell.taskName.text = tasks[indexPath.row].name;
        cell.taskState.image = tasks[indexPath.row].completed ? UIImage(named: "check-square-2") : UIImage(named: "check-box-empty")

        // Configure the cell...

        return cell
    }
    
    
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
          return 90
      }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if !tasks[indexPath.row].completed {
            let alert = UIAlertController(title: "Marcar com a completeada", message: nil, preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "Marcar como completa", style: .default, handler: { _ in
                self.tasks[indexPath.row].completed = true
                self.tableView.reloadData()
            }))
            alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
            present(alert, animated: true, completion: nil)
        }else{
            let alert = UIAlertController(title: "Que quieres hacer?", message: nil, preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "Marcar como incompleta", style: .default, handler: { _ in
                self.tasks[indexPath.row].completed = false
                self.tableView.reloadData()
            }))
            alert.addAction(UIAlertAction(title: "Eliminar", style: .cancel, handler: { _ in
                self.tasks.remove(at: indexPath.row)
                self.tableView.reloadData()
            }))
            present(alert, animated: true, completion: nil)
        }
    }
    
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addTask" {
            let vc = segue.destination as! AddViewController
            vc.newTaskCreated = { newTask in
                self.tasks.append(newTask)
                self.tableView.reloadData()
            }
        }
    }
    
  /*
    */
    


    

}
