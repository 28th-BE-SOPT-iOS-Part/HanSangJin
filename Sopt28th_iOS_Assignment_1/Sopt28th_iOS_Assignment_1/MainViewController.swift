//
//  ViewController.swift
//  Sopt28th_iOS_Assignment_1
//
//  Created by 한상진 on 2021/04/05.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var detailInform: UILabel!
    @IBOutlet weak var id: UITextField!
    @IBOutlet weak var pw: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        detailInformSet()
        clearBtnSet()
        keyboardNoti()
    }
    
    // MARK: - 로그인 버튼 구현
    @IBAction func loginBtnAction(_ sender: Any) {
        if id.text == "" {
            let alert = UIAlertController(title: "알림", message: "이메일 또는 전화번호를 확인하세요", preferredStyle: .alert)
            let ok = UIAlertAction(title: "확인", style: .default, handler: nil)
            alert.addAction(ok)
            self.present(alert, animated: true, completion: nil)
        } else if pw.text == "" {
            let alert = UIAlertController(title: "알림", message: "비밀번호를 확인하세요.", preferredStyle: .alert)
            let ok = UIAlertAction(title: "확인", style: .default, handler: nil)
            alert.addAction(ok)
            self.present(alert, animated: true, completion: nil)
        } else {
            guard let nextVC = self.storyboard?.instantiateViewController(identifier: "CompleteViewController") as? CompleteViewController else { return }
            nextVC.modalPresentationStyle = .fullScreen
            nextVC.message = id.text
            self.present(nextVC, animated: true, completion: clearText)
        }
    }
    
    // MARK: - 회원가입 버튼 구현
    @IBAction func signUpBtnAction(_ sender: Any) {
        guard let signUpVC = self.storyboard?.instantiateViewController(identifier: "SignUpViewController") as? SignUpViewController else { return }
        signUpVC.modalPresentationStyle = .fullScreen
        clearText()
        self.navigationController?.pushViewController(signUpVC, animated: true)
    }
    
    // MARK: - 메인 안내문구 구현
    func detailInformSet() {
        detailInform.numberOfLines = 0
        detailInform.text = "사용하던 카카오계정이 있다면 \n 이메일 또는 전화번호로 로그인해 주세요."
        detailInform.textColor = .gray
    }
    
    // MARK: - 텍스트 필드 clear 버튼 구현
    func clearBtnSet() {
        id.clearButtonMode = .whileEditing
        pw.clearButtonMode = .whileEditing
    }
    
    // MARK: - 텍스트 필드 clear 기능 구현
    func clearText() {
        id.text = nil
        pw.text = nil
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
        self.view.frame.origin.y = -40
    }
    @objc func keyboardWillHide(_ sender: Notification) {
        self.view.frame.origin.y = 0
    }
    
}
