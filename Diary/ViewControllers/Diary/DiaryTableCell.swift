//
//  DiaryTableCell.swift
//  Diary
//
//  Created by JongHyun Park on 2020/06/12.
//  Copyright © 2020 zehye. All rights reserved.
//

import UIKit


protocol DiaryDelegate {
    func loadTextInputVC(text:String, cell:DiaryTableCell)
}

class DiaryTableCell: UITableViewCell {

    @IBOutlet weak var textLbl: UILabel!
    
    var delegate:DiaryDelegate!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setAddTarget() {
        print("setAddTarget")
        let tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(loadTextInput(_:)))
        self.addGestureRecognizer(tapGesture)
    }
    @objc func loadTextInput(_ sender:UITapGestureRecognizer) {
        print("loadTextInput")
        if let text = self.textLbl.text {
            self.delegate.loadTextInputVC(text: text, cell: self)
        }else {
            self.delegate.loadTextInputVC(text: "", cell: self)
        }
    }

}
