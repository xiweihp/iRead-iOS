//
//  PhotoViewController.swift
//  Summary
//
//  Created by Weijia Shi on 4/21/18.
//  Copyright © 2018 Xiwei M. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITextFieldDelegate {

    
    @IBOutlet var imageView: UIImageView!

    var documents: [Document] = []

    @IBOutlet weak var setName: UITextField!
    
    
    @IBAction func takePhoto(_ sender: Any) {
        imagePicker =  UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    var imagePicker: UIImagePickerController!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage()
        self.setName.delegate = self
        
        // Do any additional setup after loading the view.
    }

    
    internal func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        imagePicker.dismiss(animated: true, completion: nil)
        
        imageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "addDoc")
        {
            if let destinationVC = segue.destination as? DocTableViewController{
                if let docImage = imageView.image {
                    let newDoc: Document = Document()
                    newDoc.setImage(image: docImage)
                    newDoc.setName(name: setName.text!)
                    
                    //encode uiimage to json
                    /*
                    let imageData: Data = UIImagePNGRepresentation(docImage)!
                    let base64:String = imageData.base64EncodedString(options: .lineLength64Characters)
                    */
                    
                    let imageData: Data = UIImageJPEGRepresentation(docImage, 0)!
                    let imageStr = imageData.base64EncodedString(options: .lineLength64Characters)
                    //print(base64)

                    let json = ["image":"data:image/gif;base64," + imageStr]
                    do{
                        let jsonData = try JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
                        print(jsonData)
                        let url = URL(string: "https://floating-dusk-85509.herokuapp.com/api")!
                        let request = NSMutableURLRequest(url: url)
                        request.httpMethod = "POST"
                        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                        request.httpBody = jsonData
                        let task = URLSession.shared.dataTask(with: request as URLRequest){ data, response, error in
                            if error != nil{
                                print("Error1 -> \(String(describing: error))")
                                return
                            }
                            /*
                            let json = (try? JSONSerialization.jsonObject(with: data, options: [])) as? [String:AnyObject]
                            print(json ?? "Empty Data")
 */
                            
                            do {
                                /*
                                if JSONSerialization.isValidJSONObject(data) {
                                    if let data_a = try JSONSerialization.dataWithJSONObject(data, options: []) {
                                        if let string = NSString(data: data_a, encoding: NSUTF8StringEncoding) {
                                            print(string)
                                            newDoc.setSummary(summary: string)
                                        }
                                    }
                                }*/
                                
                                
                               //let result = (try JSONSerialization.jsonObject(with: data!, options: .allowFragments)) as? String
                                let result = String(data: data!, encoding: .utf8)
                                let returnVal = result ?? "Invalid Document"
                                //let replaced = result.replacingOccurrences(of: "\",\"", with: "\n")
                                print(returnVal)
                                newDoc.setSummary(summary: returnVal)
                                
                                
                            } catch {
                                print("Error2 -> \(error)")
                            }
                        }
                        task.resume()
                    } catch {
                        print(error)
                    }
                    
                    self.documents.insert(newDoc, at: 0)
                    destinationVC.documents = self.documents
                }
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldShouldReturn(userText: UITextField!) -> Bool {
        userText.resignFirstResponder()
        return true;
    }
    


}
