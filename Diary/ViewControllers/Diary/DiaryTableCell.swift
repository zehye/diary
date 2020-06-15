//
//  DiaryTableCell.swift
//  Diary
//
//  Created by JongHyun Park on 2020/06/12.
//  Copyright © 2020 zehye. All rights reserved.
//

import UIKit


protocol DiaryTextDelegate {
    func loadTextInputVC(text:String, cell:DiaryTableCell)
}

enum DiaryTableType {
    case Date
    case Weather
    case Getup
    case BedTime
    case Image
    case Content
    case Good
    case Bad
    case Happy
    case Kill
}

class DiaryTableCell: UITableViewCell {

    @IBOutlet weak var textLbl: UILabel!
    
    var delegate:DiaryTextDelegate!
    var type:DiaryTableType!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setDelegate(_ delegate:DiaryTextDelegate) {
        self.delegate = delegate
        setAddTarget()
    }
    
    func setText(text:String, type:DiaryTableType) {
        
        switch type {
        case .Content:
            if text == "" {
                self.textLbl.text = DiaryContentPlaceHolder
                return
            }
            break
        default:
            break
            
        }
        self.textLbl.text = text
    }
    
    func setAddTarget() {
        print("setAddTarget")
        let tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(loadTextInput(_:)))
        self.addGestureRecognizer(tapGesture)
    }
    
    @objc func loadTextInput(_ sender:UITapGestureRecognizer) {
        print("loadTextInput")
        if let text = self.textLbl.text {
            if text == DiaryContentPlaceHolder {
                self.delegate.loadTextInputVC(text: "", cell: self)
            }
            self.delegate.loadTextInputVC(text: text, cell: self)
        }else {
            self.delegate.loadTextInputVC(text: "", cell: self)
        }
    }

}
