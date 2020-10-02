//
//  CategoryViewController.swift
//  DocumentsRelationships
//
//  Created by Cole Engelhard on 10/2/20.
//  Copyright © 2020 Cole Engelhard. All rights reserved.
//

import UIKit
import CoreData

class CategoryViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var categoryTableView: UITableView!
    
    
    var categories: [Category] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
           }
           
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
               let cell = categoryTableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath)
               
        let category = categories[indexPath.row]
        
        cell.textLabel?.text = category.title
        
               return cell
           }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            deleteCategory(at: indexPath)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? DocumentViewController,
            let selectedRow = self.categoryTableView.indexPathForSelectedRow?.row else{
                return
            }
        
        destination.category = categories[selectedRow]
        }
    func deleteCategory(at indexPath:IndexPath){
        let category = categories[indexPath.row]
        
        guard let managedContext = category.managedObjectContext else{
            return
        }
        
        managedContext.delete(category)
        
        do{
            
        try managedContext.save()
            
            categories.remove(at: indexPath.row)
            
            categoryTableView.deleteRows(at: [indexPath], with: .automatic)
        }
        catch{
            print("delete failed")
            
            categoryTableView.reloadRows(at: [indexPath], with: .automatic)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest : NSFetchRequest<Category> = Category.fetchRequest()
        
        do{
            categories = try managedContext.fetch(fetchRequest)
            
            categoryTableView.reloadData()
        }
        catch{
            print("failed cat fetch")
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
