//
//  AddViewController.swift
//  Notify
//
//  Created by Alumne on 09/11/2020.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var newTaskTextField: UITextField!
    @IBOutlet weak var cancelButton: UIButton!

    @IBOutlet weak var createButton: UIButton!
    
    var newTaskCreated: (_ newTask: Task)-> Void = {
        arg in
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newTaskTextField.becomeFirstResponder()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func cancelButton(_ sender: UIButton) {
        newTaskTextField.resignFirstResponder()
        self.dismiss(animated: true, completion: nil)
    }
    
    /*@IBAction func cancelButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }*/
    
    @IBAction func createTask(_ sender: UIButton) {
        
        let task = Task(name: newTaskTextField.text!, completed: false)
        
        newTaskCreated(task)
        self.dismiss(animated: true, completion: nil)
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
