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
        print("viewDidLoad")
        self.setUI()
    }
    
    override func setUI() {
        print("setUI")
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    
}

fileprivate enum TableSection:Int {
    case Date = 0
    case Weather = 1
    case WakeUp = 2
    case BedTime = 3
    case Picture = 4
    case Content = 5
    case Good = 6
    case Bad = 7
    case Happy = 8
    case Kill = 9
}

extension DiaryVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableSection = TableSection(rawValue: indexPath.section)
        var cell:DiaryTableCell!
        switch tableSection {
        case .Date:
            cell = tableView.dequeueReusableCell(withIdentifier: "Date") as? DiaryTableCell
            break
        case .Weather:
            cell = tableView.dequeueReusableCell(withIdentifier: "Weather") as? DiaryTableCell
            break
        case .WakeUp:
            cell = tableView.dequeueReusableCell(withIdentifier: "Wakeup") as? DiaryTableCell
            break
        case .BedTime:
            cell = tableView.dequeueReusableCell(withIdentifier: "Bedtime") as? DiaryTableCell
            break
        case .Picture:
            cell = tableView.dequeueReusableCell(withIdentifier: "Picture") as? DiaryTableCell
            break
        case .Content:
            cell = tableView.dequeueReusableCell(withIdentifier: "Content") as? DiaryTableCell
            cell.delegate = self
            cell.setAddTarget()
            break
        case .Good:
            cell = tableView.dequeueReusableCell(withIdentifier: "Good") as? DiaryTableCell
            break
        case .Bad:
            cell = tableView.dequeueReusableCell(withIdentifier: "Bad") as? DiaryTableCell
            break
        case .Happy:
            cell = tableView.dequeueReusableCell(withIdentifier: "Happy") as? DiaryTableCell
            break
        case .Kill:
            cell = tableView.dequeueReusableCell(withIdentifier: "Kill") as? DiaryTableCell
            break
        default:
            cell = DiaryTableCell.init()
            break
        }
        
        return cell
    }
    
}

extension DiaryVC: DiaryDelegate {
    func loadTextInputVC() {
        print("loadTextInputVC")
        let storyboard = UIStoryboard.init(name: "Common", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "TextInputVC")
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: false, completion: nil)
    }
}


