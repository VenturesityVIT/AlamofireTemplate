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



class ViewController: UIViewController {
    
    //MARK:IBOutlets
    @IBOutlet weak var first: UILabel!
    @IBOutlet weak var second: UILabel!
    @IBOutlet weak var third: UILabel!
    @IBOutlet weak var fourth: UILabel!
    @IBOutlet weak var firstTextField: UITextField!
    @IBOutlet weak var secondTextField: UITextField!
    @IBOutlet weak var thirdTextField: UITextField!
    
    
    
    //MARK:Constants
     let finalURLString = "https://jsonplaceholder.typicode.com/posts"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
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
    
    
    func postFunction(parameters:[String:String],url:String){
        Alamofire.request(url, method: .post, parameters: parameters ).responseJSON { (response) in
            if response.result.isFailure{
                print(response.error!)
            }else if response.result.isSuccess{
                let jsonData2 = JSON(response.value!)
                print(jsonData2)
                self.postData(data: jsonData2)
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
    
    func postData(data:JSON){
        first.text = data["title"].stringValue
        second.text = data["userId"].stringValue
        third.text = data["id"].stringValue
        fourth.text = data["body"].stringValue
    }
    
    
    
    
    //MARK: IBActions
    @IBAction func buttonAction(_ sender: UIButton) {
        
        let param :[String:String] = ["title":firstTextField.text!,"userId":secondTextField.text!,"body":thirdTextField.text!]
        postFunction(parameters: param, url: finalURLString)
        
    }
    
}

