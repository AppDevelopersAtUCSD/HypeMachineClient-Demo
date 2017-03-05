//
//  TestViewController.swift
//  HypeMachineMusic
//
//  Created by Tejen Hasmukh Patel on 3/4/17.
//  Copyright © 2017 Nick McDonald. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {
  
    weak var delegate: ModalActivityDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onDoneButton(_ sender: Any) {
      dismiss(animated: true, completion: nil)
    }
  
  
    @IBAction func onClearTableButton(_ sender: Any) {
      delegate?.modalActivityClearTable()
      dismiss(animated: true, completion: nil)
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
