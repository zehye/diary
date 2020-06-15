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
    
    // 현재 다이어리 모델
    var diary = ModelDiary()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUI()
    }
    
    override func setUI() {
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
            cell.setDelegate(self)
            cell.setText(text: self.diary.content, type: .Content)
            break
        case .Good:
            cell = tableView.dequeueReusableCell(withIdentifier: "Good") as? DiaryTableCell
            cell.setDelegate(self)
            break
        case .Bad:
            cell = tableView.dequeueReusableCell(withIdentifier: "Bad") as? DiaryTableCell
            cell.setDelegate(self)
            break
        case .Happy:
            cell = tableView.dequeueReusableCell(withIdentifier: "Happy") as? DiaryTableCell
            cell.setDelegate(self)
            break
        case .Kill:
            cell = tableView.dequeueReusableCell(withIdentifier: "Kill") as? DiaryTableCell
            cell.setDelegate(self)
            break
        default:
            cell = DiaryTableCell.init()
            break
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var heightForRow = UITableView.automaticDimension
        let tableSection = TableSection(rawValue: indexPath.section)
        if tableSection == TableSection.Weather {
            heightForRow = 44
        }
        return heightForRow
    }
    
    func reloadCell(cell:DiaryTableCell) {
        guard let index = self.tableView.indexPath(for: cell) else {
            return
        }
        self.tableView.reloadRows(at: [index], with: .automatic)
    }
}

extension DiaryVC: DiaryTextDelegate {
    func loadTextInputVC(text:String, cell:DiaryTableCell) {
        print("loadTextInputVC")
        let storyboard = UIStoryboard.init(name: "Common", bundle: nil)
        let vc:TextInputVC = storyboard.instantiateViewController(withIdentifier: "TextInputVC") as! TextInputVC
        vc.modalPresentationStyle = .overFullScreen
        vc.text = text
        vc.addSaveHandler { text in
            DispatchQueue.main.async {
                cell.textLbl.text = text
                self.reloadCell(cell: cell)
            }
        }
        self.present(vc, animated: false, completion: nil)
    }
}


