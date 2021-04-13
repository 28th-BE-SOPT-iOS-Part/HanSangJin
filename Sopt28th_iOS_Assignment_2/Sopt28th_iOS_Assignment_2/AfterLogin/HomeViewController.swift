//
//  HomeViewController.swift
//  Sopt28th_iOS_Assignment_2
//
//  Created by 한상진 on 2021/04/13.
//

import UIKit

class HomeViewController: UIViewController {

    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - 프로필 버튼 구현
    @IBAction func profileBtnAction(_ sender: Any) {
        guard let pfVC = self.storyboard?.instantiateViewController(identifier: "ProfileViewController") as? ProfileViewController else { return }
        pfVC.modalPresentationStyle = .overFullScreen
        self.present(pfVC, animated: true, completion: nil)
    }

}
