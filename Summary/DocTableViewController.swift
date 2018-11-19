//
//  DocTableViewController.swift
//  Summary
//
//  Created by 咩咩 on 21/04/2018.
//  Copyright © 2018 Xiwei M. All rights reserved.
//

import UIKit

class DocTableViewController: UITableViewController {
    
    var documents: [Document] = []
    
   // var speciesSearchResults:Array<Document>?
    
  //  var my_image: UIImage = UIImage()
  //  var count: Int = 0

    
    
    
    @IBOutlet weak var docTableView: UITableView!
    
  //  let pickerController = UIImagePickerController()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        docTableView.dataSource = self
        docTableView.delegate = self
        self.navigationItem.hidesBackButton = true
        self.tableView.rowHeight = 60.0

        
  //  pickerController.sourceType = UIImagePickerControllerSourceType.camera
        
       // pickerController.delegate = SaveViewController
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    /*
    override func viewDidAppear(_ animated: Bool) {
        
    }*/
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.documents.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "docCell", for: indexPath)
        let document = self.documents[indexPath.row]
        cell.textLabel?.text = document.name
        cell.imageView?.image = document.image
        

        // Configure the cell...

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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "docInfo")
        {
            if let destinationVC = segue.destination as? InfoViewController {
                // Get the index of the account clicked on...
                if let docIndex = docTableView.indexPathForSelectedRow?.row {                    destinationVC.document = documents[docIndex]
                }
            }
        }
        else if(segue.identifier == "openCam")
        {
            if let destinationVC = segue.destination as? PhotoViewController {
                // Get the index of the account clicked on...
                destinationVC.documents = self.documents
            }
        }
    }
    

    /*
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "My Reading List"
    }
    */
    
    //swipe to delete
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete) {
            if let tv=docTableView
            {
                documents.remove(at: indexPath.row)
                tv.deleteRows(at: [indexPath], with: .fade)
            }
            // handle delete (by removing the data from your array and updating the tableview)
        }
    }
    /*
    func filterContentForSearchText(searchText: String) {
        // Filter the array using the filter method
        if self.documents == nil {
            self.speciesSearchResults = nil
            return
        }
        self.speciesSearchResults = self.documents.filter({( aDoc: Document) -> Bool in
            // to start, let's just search by name
            return aDoc.name.lowercased().range(of: searchText.lowercased()) != nil
        })
    }
    
    func searchDisplayController(controller: UISearchDisplayController!, shouldReloadTableForSearchString searchString: String!) -> Bool {
        self.filterContentForSearchText(searchText: searchString)
        return true
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.searchDisplayController!.searchResultsTableView {
            return self.speciesSearchResults?.count ?? 0
        } else {
            return self.documents.count
        }
    }
    
    
    */
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }

}
 /*
    @IBAction func CameraAction(_ sender: Any) {
        present(pickerController, animated: true, completion: nil)
    }
    
    

}

extension DocTableViewController : UIImagePickerControllerDelegate{
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String :  Any]) {
        picker.dismiss(animated: true, completion: nil)
        self.my_image = (info[UIImagePickerControllerOriginalImage] as? UIImage)!;
        var temp: Document = Document()
        temp.setImage(image: self.my_image)
        temp.setName(name: "Document" + String(self.count))
        self.count = self.count + 1
        self.documents.append(temp)
        //TODO: send image to server
        //TODO: recieve summary text
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("close")
    }
}


extension ViewController : UINavigationControllerDelegate{
    
}
 */


