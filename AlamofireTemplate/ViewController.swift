//
//  ViewController.swift
//  AlamofireTemplate
//
//  Created by Sarvad shetty on 2/9/18.
//  Copyright © 2018 Sarvad shetty. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

struct network {
    let url :String = "https://jsonplaceholder.typicode.com/"
    let form = "posts"
};

class ViewController: UIViewController {
    
    @IBOutlet weak var first: UILabel!
    @IBOutlet weak var second: UILabel!
    @IBOutlet weak var third: UILabel!
    @IBOutlet weak var fourth: UILabel!

    let net = network()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let finalURLString = net.url + net.form
        getFunction(url: finalURLString)
        
    }

    //MARK: Networking Methods
   func getFunction(url:String){
    Alamofire.request(url, method: .get).responseJSON { (response) in
        if response.result.isFailure{
            print(response.error!)
        }
        else if response.result.isSuccess{
            let jsonData = JSON(response.value!)
            print(jsonData)
            self.updateLabels(data: jsonData)
            
        }
    }
    }

    //MARK: Update label using JSON Data
    func updateLabels(data:JSON){
        first.text = data[0]["title"].stringValue
        second.text = data[0]["userId"].stringValue
        third.text = data[0]["id"].stringValue
        fourth.text = data[0]["body"].stringValue
    }
}

