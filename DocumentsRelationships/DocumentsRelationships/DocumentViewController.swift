//
//  DocumentViewController.swift
//  DocumentsRelationships
//
//  Created by Cole Engelhard on 10/2/20.
//  Copyright © 2020 Cole Engelhard. All rights reserved.
//

import UIKit

class DocumentViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var documentsTableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return category?.documents?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = documentsTableView.dequeueReusableCell(withIdentifier: "documentCell", for: indexPath)
        
        if let document = category?.documents?[indexPath.row]{
            cell.textLabel?.text = document.name
            
            
        }
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDocument", sender: self)
    }
    
    let dateFormatter = DateFormatter()
    
    var category: Category?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateFormatter.timeStyle = .long
        dateFormatter.dateStyle = .long

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.documentsTableView.reloadData()
    }
    
    @IBAction func addNewDocument(_ sender: Any) {
        performSegue(withIdentifier: "showDocument", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? NewDocumentViewController else{
            return
        }
        destination.category = category
        
        
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
