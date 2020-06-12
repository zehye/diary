//
//  BaseVC.swift
//  Diary
//
//  Created by JongHyun Park on 2020/06/11.
//  Copyright © 2020 zehye. All rights reserved.
//

import UIKit

class BaseVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUI()
        
    }
    
    func setUI() {
        
    }
    
    @IBAction func backBtnClicked(_ sender:Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
}

extension BaseVC {
    
    
}
