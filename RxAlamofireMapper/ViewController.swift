//
//  ViewController.swift
//  RxAlamofireMapper
//
//  Created by Wassim Seifeddine on 2/20/17.
//  Copyright © 2017 Wassim Seifeddine. All rights reserved.
//

import UIKit
import Alamofire
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let request = Alamofire.request("http://myapi.com", method: .get , parameters: nil , encoding: URLEncoding.default, headers: nil )
        
        let _ = request.rx_responseObject(type: User.self)
            .subscribe(onNext: { (individualProfile) in
                print(individualProfile)
            }, onError: { (error ) in
                print("Error")
            }, onCompleted: {
                print("Completed")
            }) {
                print("Disposed"      )
        }

        
    }

    
}

