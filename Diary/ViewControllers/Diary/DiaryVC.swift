//
//  DiaryVC.swift
//  Diary
//
//  Created by JongHyun Park on 2020/06/11.
//  Copyright © 2020 zehye. All rights reserved.
//

import UIKit

class DiaryVC: BaseVC {
    
    @IBOutlet var tableView:UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func setUI() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    

}
extension DiaryVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.init()
        return cell
    }
}



