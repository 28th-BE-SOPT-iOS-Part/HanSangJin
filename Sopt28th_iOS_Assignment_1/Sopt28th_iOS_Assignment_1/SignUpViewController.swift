//
//  SignUpViewController.swift
//  Sopt28th_iOS_Assignment_1
//
//  Created by 한상진 on 2021/04/06.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var id: UITextField!
    @IBOutlet weak var pw: UITextField!
    @IBOutlet weak var pwCheck: UITextField!
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        clearBtnSet()
    }
    
    // MARK: - 회원가입 버튼 구현
    @IBAction func signUpBtnAction(_ sender: Any) {
        if id.text == "" {
            let alert = UIAlertController(title: "알림", message: "이메일 또는 전화번호를 확인하세요.", preferredStyle: .alert)
            let ok = UIAlertAction(title: "확인", style: .default, handler: nil)
            alert.addAction(ok)
            self.present(alert, animated: true, completion: nil)
        } else if pw.text == "" {
            let alert = UIAlertController(title: "알림", message: "비밀번호를 확인하세요.", preferredStyle: .alert)
            let ok = UIAlertAction(title: "확인", style: .default, handler: nil)
            alert.addAction(ok)
            self.present(alert, animated: true, completion: nil)
        } else if pw.text != pwCheck.text {
            let alert = UIAlertController(title: "알림", message: "비밀번호 확인 문자가 틀립니다.", preferredStyle: .alert)
            let ok = UIAlertAction(title: "확인", style: .default, handler: nil)
            alert.addAction(ok)
            self.present(alert, animated: true, completion: nil)
        } else {
            guard let completeVC = self.storyboard?.instantiateViewController(identifier: "CompleteViewController") as? CompleteViewController else { return }
            completeVC.message = id.text
            completeVC.modalPresentationStyle = .fullScreen
            self.present(completeVC, animated: true, completion: {
                self.navigationController?.popViewController(animated: true)})
        }
    }
    
    // MARK: - 텍스트 필드 clear 버튼 구현
    func clearBtnSet() {
        id.clearButtonMode = .whileEditing
        pw.clearButtonMode = .whileEditing
        pwCheck.clearButtonMode = .whileEditing
    }
    
}
