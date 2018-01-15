//
//  ReaViewController.swift
//  PHPackAge
//
//  Created by penghui on 2018/1/12.
//  Copyright © 2018年 wdx. All rights reserved.
//

import UIKit

class ReaViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    public static func swiftStaticFunc(log: NSString) {
        print(log);
    }
    public  func swiftFunc(log:NSString) {
        print(log);
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
