//
//  NewDocumentViewController.swift
//  DocumentsRelationships
//
//  Created by Cole Engelhard on 10/2/20.
//  Copyright © 2020 Cole Engelhard. All rights reserved.
//

import UIKit

class NewDocumentViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {

    @IBOutlet weak var contentTextView: UITextView!
    @IBOutlet weak var nameTextField: UITextField!
    
    var category: Category?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        nameTextField.resignFirstResponder()
        contentTextView.resignFirstResponder()
    }
    @IBAction func saveExpense(_ sender: Any) {
        
        let name = nameTextField.text ?? ""
        let content = contentTextView.text ?? ""
        
        if let document = Document(name: name, content: content){
            category?.addToRawDocuments(document)
            
            do{
                try document.managedObjectContext?.save()
                
                self.navigationController?.popViewController(animated: true)
            }
            catch{
                print("document save failed")
            }
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
