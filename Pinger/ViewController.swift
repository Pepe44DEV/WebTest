//
//  ViewController.swift
//  Pinger
//
//  Created by Pascal Priessnitz on 17.12.19.
//  Copyright © 2019 Pepe44DEV. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //PING
    func checkIsConnectedToNetwork() {
        let hostUrl = TextField.text!
        
        
       if let url = URL(string: "https://" + hostUrl) {
          var request = URLRequest(url: url)
          request.httpMethod = "HEAD"
          URLSession(configuration: .default)
          .dataTask(with: request) { (_, response, error) -> Void in
             guard error == nil else {
                print("Error:", error ?? "")
                DispatchQueue.main.async {
                    self.StatusLabel.text = "The host cannot be Found"
                }
                return
             }
             guard (response as? HTTPURLResponse)?
             .statusCode == 200 else {
                print("The host is down")
                DispatchQueue.main.async {
                    self.StatusLabel.text = "The host is Down"
                }
                
                return
             }
             print("The host is up and running")
                DispatchQueue.main.async{
                    self.StatusLabel.text = "The host is up and running"
                
            }
            
          }
          .resume()
       }
    }
    
    
    
    
    
    
    
    
    
    @IBOutlet weak var StatusLabel: UILabel!
    
    
    @IBAction func SubmitButton(_ sender: UIButton) {
        self.checkIsConnectedToNetwork()
        
        
        
    }
    
    
    @IBOutlet weak var TextField: UITextField!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    
    
    }
    


}

