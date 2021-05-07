//
//  ProfileViewController.swift
//  Sopt28th_iOS_Assignment_2
//
//  Created by 한상진 on 2021/04/13.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileName: UILabel!
    var panGesture: UIPanGestureRecognizer?
    var changeImage: String?
    var changeName: String?
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

        panGesture = UIPanGestureRecognizer(target: self, action: #selector(dragDownDissmiss(_:)))
        view.addGestureRecognizer(panGesture!)
        setProfile()
    }
    
    // MARK: - 프로필 데이터 설정
    func setProfile() {
        if let image = UIImage(named: changeImage!) {
            profileImage.image = image
        } else { return }
        profileName.text = changeName
    }
    
    // MARK: - 프로필 닫기 버튼 구현
    @IBAction func profileCloseBtnAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - 프로필 스와이프로 닫기 구현
    @objc func dragDownDissmiss(_ panG: UIPanGestureRecognizer) {
        let trY = panG.translation(in: panG.view!).y
        switch panG.state {
        case .began:
            break
        case .changed:
            view.transform = CGAffineTransform(translationX: 0, y: trY)
        case .ended, .cancelled:
            if trY > 160 {
                dismiss(animated: true, completion: nil)
            } else {
                UIView.animate(withDuration: 0.2, animations: {
                    self.view.transform = CGAffineTransform(translationX: 0, y: 0)
                })
            }
        case .failed, .possible:
            break
        @unknown default:
            break
        }
    }
}
