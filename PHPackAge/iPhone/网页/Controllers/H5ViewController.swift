//
//  H5ViewController.swift
//  PHPackAge
//
//  Created by Jobs on 2018/9/6.
//  Copyright © 2018年 wdx. All rights reserved.
//

import UIKit

class H5ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        let webView = UIWebView.init(frame: self.view.bounds);
        webView.loadRequest(URLRequest.init(url: URL.init(string: "http://10.120.35.203:5000/")!));
        self.view.addSubview(webView);
        
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

}
