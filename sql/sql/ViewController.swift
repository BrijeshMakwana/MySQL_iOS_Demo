//
//  ViewController.swift
//  sql
//
//  Created by Brijesh Makwana on 23/01/20.
//  Copyright © 2020 Brijesh Makwana. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var year: UITextField!
    
    let url = URL(string: "http://localhost/insert-ios.php")!

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func sned(_ sender: Any) {
        
             var request = URLRequest(url: url)
                 request.httpMethod = "POST"
                 let postString = "a=\(name.text!)&b=\(year.text!)"
                 request.httpBody = postString.data(using: .utf8)
        
        
        
              let task = URLSession.shared.dataTask(with: request){
                  data, response, error in
                  if error != nil{
                      print("error=\(error)")
                      return
                  }
                  print(response)
                  let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                  print(responseString)
              }
              task.resume()
        let alert = UIAlertController(title: "Done!", message: "Record is Inserted", preferredStyle: UIAlertController.Style.alert)

               alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

               self.present(alert, animated: true, completion: nil)
        
        
    }
    
}

