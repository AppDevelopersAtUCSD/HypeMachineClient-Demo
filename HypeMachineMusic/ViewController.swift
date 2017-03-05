//
//  ViewController.swift
//  HypeMachineMusic
//
//  Created by Nick McDonald on 2/20/17.
//  Copyright © 2017 Nick McDonald. All rights reserved.
//

import UIKit

protocol ModalActivityDelegate: class {
  func modalActivityClearTable()
}

class ViewController: UIViewController {

    @IBOutlet weak var postsTableView: UITableView!
    
    var postings: [Posting]?
    var isMoreDataLoading = false
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.postsTableView.dataSource = self
        self.postsTableView.delegate = self
      
        self.postsTableView.dataSource?.tableView(postsTableView, numberOfRowsInSection: 0)
        
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
  
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      let storyboard = UIStoryboard(name: "Main", bundle: nil)
      let nc = storyboard.instantiateViewController(withIdentifier: "TestNavController")
      let vc = nc.childViewControllers.first as! TestViewController
      vc.delegate = self
      present(nc, animated: true, completion: nil)
    }
  
}

extension ViewController: ModalActivityDelegate {
  
  func modalActivityClearTable() {
    postings = nil
    postsTableView.reloadData()
  }
  
}

extension ViewController: UIScrollViewDelegate {
  
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    if (!isMoreDataLoading) {
      // Calculate the position of one screen length before the bottom of the results
      let scrollViewContentHeight = postsTableView.contentSize.height
      let scrollOffsetThreshold = scrollViewContentHeight - postsTableView.bounds.size.height
      
      // When the user has scrolled past the threshold, start requesting
      if(scrollView.contentOffset.y > scrollOffsetThreshold && postsTableView.isDragging) {
        isMoreDataLoading = true
        
        // ... Code to load more results ...
        HypeMClient.sharedInstance.getPostings(success: { (postings: [Posting]) in
          // code
          self.postings?.append(contentsOf: postings)
          self.postsTableView.reloadData()
        }, failure: { (error: Error?) in
          // code
          print("Error loading posts: \(error?.localizedDescription)")
        })
      }
    }
  }
  
}
