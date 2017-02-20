//
//  ViewController.swift
//  HypeMachineMusic
//
//  Created by Nick McDonald on 2/20/17.
//  Copyright © 2017 Nick McDonald. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var postsTableView: UITableView!
    
    var postings: [Posting]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.postsTableView.dataSource = self
        self.postsTableView.delegate = self
        
        HypeMClient.sharedInstance.getPostings(success: { (postings: [Posting]) in
            // code
            self.postings = postings
            self.postsTableView.reloadData()
        }, failure: { (error: Error?) in
            // code
            print("Error loading posts: \(error?.localizedDescription)")
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return self.postings.count if it is not nil, otherwise 0.
        return self.postings?.count ?? 0 // "nil coalescence"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.postsTableView.dequeueReusableCell(withIdentifier: "PostingTableViewCell", for: indexPath) as! PostTableViewCell
        
        cell.postData = self.postings?[indexPath.row]
        
        return cell
        
    }
}
