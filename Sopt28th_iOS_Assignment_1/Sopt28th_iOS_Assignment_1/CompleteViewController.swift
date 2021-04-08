//
//  CompleteViewController.swift
//  Sopt28th_iOS_Assignment_1
//
//  Created by 한상진 on 2021/04/07.
//

import UIKit

class CompleteViewController: UIViewController {

    @IBOutlet weak var inform: UILabel!
    @IBOutlet weak var okBtn: UIButton!
    var message : String?
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setLable()
    }
    
    // MARK: - 확인 버튼 구현
    @IBAction func okBtnAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - 회원 안내문구 구현
    func setLable() {
        inform.numberOfLines = 0
        if let msg = self.message {
            inform.text = "\(msg) 님 \n 환영합니다."
        }
    }
    
}
