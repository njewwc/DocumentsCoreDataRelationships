//
//  NewCategoryViewController.swift
//  DocumentsRelationships
//
//  Created by Cole Engelhard on 10/2/20.
//  Copyright © 2020 Cole Engelhard. All rights reserved.
//

import UIKit

class NewCategoryViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var titleTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        titleTextField.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        titleTextField.resignFirstResponder()
    }
    
    @IBAction func saveCategory(_ sender: Any) {
        
        let category = Category(title: titleTextField.text ?? "")
        
        do{
            try category?.managedObjectContext?.save()
            
            self.navigationController?.popViewController(animated: true)
        }
        catch{
            print("category could not save")
        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
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
