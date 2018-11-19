//
//  Document.swift
//  Summary
//
//  Created by 咩咩 on 21/04/2018.
//  Copyright © 2018 Xiwei M. All rights reserved.
//

import UIKit

class Document: NSObject {
    
    var name: String
    var summary: String
    var image: UIImage
    //var images:[UIImage]
    
    override init()
    {
        self.name = "temp"
        self.summary = "default summary"
        self.image = UIImage()
    }
    
    func setName(name: String)
    {
        self.name = name
    }
    
    func setImage(image: UIImage)
    {
        self.image = image
    }
    func setSummary(summary: String)
    {
        self.summary = summary
    }
    func retName() -> String
    {
        return self.name
    }
    func retImage() -> UIImage
    {
        return self.image
    }
    func retSummary() -> String
    {
        return self.summary
    }
    /*
    func addImage(image: UIImage)
    {
        self.images.append(image)
    }
    */

}
