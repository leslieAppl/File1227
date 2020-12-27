//
//  PreviewViewController.swift
//  File1227
//
//  Created by leslie on 12/27/20.
//

import UIKit

class PreviewViewController: UITableViewController {

    var people = [Person]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    func preparePreviewOfFile(at url: URL, completionHandler handler: @escaping (Error?) -> Void) {
        
        let doc = PeopleDocument(fileURL: url)
        doc.open { (ok) in
            
            if ok {
                self.people = doc.people
                self.tableView.register(UINib(nibName: "PersonCell", bundle: nil), forCellReuseIdentifier: "Person")
                self.tableView.reloadData()
                handler(nil)
            }
            else {
                handler(NSError(domain: "NoDataDomain", code: -1, userInfo: nil))
            }
        }
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.people.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Person", for: indexPath)
        let first = cell.viewWithTag(1) as! UITextField
        let last = cell.viewWithTag(2) as! UITextField
        let p = self.people[indexPath.row]
        first.text = p.firstName
        last.text = p.lastName
        first.isEnabled = false
        last.isEnabled = false
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
