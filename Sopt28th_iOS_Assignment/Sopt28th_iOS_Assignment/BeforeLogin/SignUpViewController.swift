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
        keyboardNoti()
    }
    
    // MARK: - 회원가입 버튼 구현
    @IBAction func signUpBtnAction(_ sender: Any) {
        if id.text == "" {
            self.makeAlert(title: "알림", message: "이메일 또는 전화번호를 확인하세요.")
        } else if pw.text != pwCheck.text {
            self.makeAlert(title: "알림", message: "비밀번호 확인 문자가 틀립니다.")
        } else {
            signupAction()
        }
    }
    
    func signupAction()
    {
        SignUpService.shared.signup(email: self.id.text!, password: self.pw.text!) { result in
            switch result
            {
            case .success(let message):
                if let message = message as? String{
                    self.makeAlert(title: "알림", message: message, okAction: {_ in
                                    guard let nextVC = self.storyboard?.instantiateViewController(identifier: "TabHome") as? UITabBarController else { return }
                                    nextVC.modalPresentationStyle = .fullScreen
                                    self.navigationController?.pushViewController(nextVC, animated: true)},
                                   
                                   completion: nil)
                }
            case .requestErr(let message):
                if let message = message as? String{
                    self.makeAlert(title: "알림",
                                   message: message)
                }
            default :
                print("ERROR")
            }
        }
    }
    
    // MARK: - 텍스트 필드 clear 버튼 구현
    func clearBtnSet() {
        id.clearButtonMode = .whileEditing
//        pw.clearButtonMode = .whileEditing
//        pwCheck.clearButtonMode = .whileEditing
    }
    
    // MARK: - 화면 터치 이벤트 구현
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
          self.view.endEditing(true)
    }
    
    // MARK: - 키보드 노티피케이션
    func keyboardNoti() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    // MARK: - 키보드 높이 세팅
    @objc func keyboardWillShow(_ sender: Notification) {
        let bounds = UIScreen.main.bounds
        let height = bounds.size.height
        
        if height > 800 {
            self.view.frame.origin.y = -260
        } else {
            self.view.frame.origin.y = -200
        }
    }
    @objc func keyboardWillHide(_ sender: Notification) {
        self.view.frame.origin.y = 0
    }
    
}
