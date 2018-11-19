//
//  transViewController.swift
//  Summary
//
//  Created by 咩咩 on 2018/4/22.
//  Copyright © 2018 Xiwei M. All rights reserved.
//

import UIKit

class transViewController: UINavigationController {
    
    var documents: [Document] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
        if(segue.identifier == "transInfo")
        {
            if let destinationVC = segue.destination as? PhotoViewController {
                // Get the index of the account clicked on...
                destinationVC.documents = self.documents
                }
            }
        }
    }

}
