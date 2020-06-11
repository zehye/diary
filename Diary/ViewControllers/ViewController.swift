//
//  ViewController.swift
//  Diary
//
//  Created by 졔님 on 2020/06/04.
//  Copyright © 2020 zehye. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var searchCancelBtn: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var isSearchMode = false
    
//    var searchDiaryList = Array<ModelDiary>
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addBtn(_ sender: UIButton) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc: PlanViewController = storyboard.instantiateViewController(withIdentifier: "PlanViewController") as! PlanViewController
        self.present(vc, animated: true, completion: nil)
    }
    
    


}

