//
//  TextInputVC.swift
//  Diary
//
//  Created by JongHyun Park on 2020/06/12.
//  Copyright © 2020 zehye. All rights reserved.
//

import UIKit
import GrowingTextView

class TextInputVC: UIViewController {
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var frontView: UIView!
    
    @IBOutlet weak var navigationView: UIView!
    
    @IBOutlet weak var textView: GrowingTextView!
    
    @IBOutlet weak var textViewBottom: NSLayoutConstraint!
    // 저장 핸들러
    private var saveHandler: ((_ text: String) -> Void)?
    
    //
    var text:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.setBackgroundAnimation()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        
    }
    
    func setUI() {
        // self.textView.delegate = self
        if let txt = text {
            self.textView.text = txt
        }
    }
    
    func setBackgroundAnimation() {
        self.view.bringSubviewToFront(self.frontView)
        
        UIView.animate(withDuration: 0.3, animations: {
            self.backgroundView.alpha = 0.85
        }) { (success) in
            self.textView.becomeFirstResponder()
        }
    }
    
    func addSaveHandler(handler SaveHandler: @escaping (_ text: String) -> Void) {
        saveHandler = SaveHandler
    }
    
    @objc func keyboardWillHide(_ notification: Notification){
        handleKeyboardIssue(notification: notification, isAppearing: false)
    }
    
    @objc func keyboardWillShow(_ notification: Notification){
        handleKeyboardIssue(notification: notification, isAppearing: true)
    }
    
    fileprivate func handleKeyboardIssue(notification: Notification, isAppearing: Bool) {
        guard let userInfo = notification.userInfo as? [String:Any] else {return}
        guard let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {return}
        guard let keyboardShowAnimateDuartion = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber else {return}
        let keyboardHeight = keyboardFrame.cgRectValue.height
        
        let heightConstant = isAppearing ? keyboardHeight + 10 : 10
        UIView.animate(withDuration: TimeInterval(truncating: keyboardShowAnimateDuartion)) {
            self.textViewBottom.constant = heightConstant
        }
    }
    
    @IBAction func backBtnClicked(_ sender:UIButton) {
        self.dismiss(animated: false, completion: nil)
    }
    @IBAction func saveBtnClicked(_ sender:UIButton) {
        
        if let saveAction = saveHandler {
            if let text = self.textView.text {
                saveAction(text)
            }else {
                saveAction("")
            }
        }
        self.dismiss(animated: false, completion: nil)
    }
    
}
/*
extension TextInputVC: GrowingTextViewDelegate {
    func textViewDidChangeHeight(_ textView: GrowingTextView, height: CGFloat) {
       UIView.animate(withDuration: 0.2) {
           self.view.layoutIfNeeded()
       }
    }
}
*/

