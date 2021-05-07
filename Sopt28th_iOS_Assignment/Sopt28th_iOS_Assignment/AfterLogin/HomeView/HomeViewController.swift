//
//  HomeViewController.swift
//  Sopt28th_iOS_Assignment
//
//  Created by 한상진 on 2021/05/07.
//

import UIKit

class HomeViewController: UIViewController {

    
    @IBOutlet weak var homeTableView: UITableView!
    var friendList: [FriendDataModel] = []
    var myData: FriendDataModel = FriendDataModel(imageName: "profileUserImg", name: "한상진", state: "어렵당ㅠ")
    
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setFriendList()
        homeTableView.delegate = self
        homeTableView.dataSource = self
        homeTableView.separatorStyle = .none
    }
    
    // MARK: - 설정버튼 구현
    @IBAction func settingBtnAction(_ sender: Any) {
        let alert = UIAlertController(title: nil,
                                      message: nil,
                                      preferredStyle: .actionSheet)
        for value in ["편집", "친구 관리", "친구 설정"] {
            alert.addAction(UIAlertAction(title: value,
                                          style: .default,
                                          handler: nil))
        }
        let alertAction = UIAlertAction(title: "취소",
                                        style: .cancel,
                                        handler: nil)
        alert.addAction(alertAction)
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: - 친구목록 데이터 설정
    func setFriendList()
    {
        friendList.append(contentsOf: [
            FriendDataModel(imageName: "profileImage1",
                            name: "안솝트",
                            state: "배고파요"),
            
            FriendDataModel(imageName: "profileImage2",
                            name: "최솝트",
                            state: "피곤해요"),
            
            FriendDataModel(imageName: "profileImage3",
                            name: "정솝트",
                            state: "시험언제끝나죠?"),
            
            FriendDataModel(imageName: "profileImage4",
                            name: "이솝트",
                            state: "ㅠㅠㅠㅠ"),
            
            FriendDataModel(imageName: "profileImage5",
                            name: "유솝트",
                            state: "나는 상태메세지!"),
            
            FriendDataModel(imageName: "profileImage6",
                            name: "박솝트",
                            state: "원하는대로 바꿔보세요 ^_^"),
            
            FriendDataModel(imageName: "profileImage7",
                            name: "최솝트",
                            state: "넘 덥다.."),
            
            FriendDataModel(imageName: "profileImage8",
                            name: "원솝트",
                            state: "배고파요"),
            
            FriendDataModel(imageName: "profileImage9",
                            name: "투솝트",
                            state: "내꿈은 대나무부자"),
            
            FriendDataModel(imageName: "profileImage10",
                            name: "권솝트",
                            state: "걱정말라구!")
        ])
    }
}

// MARK: - 테이블뷰 델리게이트
extension HomeViewController: UITableViewDelegate {
    
    // 테이블뷰 높이 설정
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 73
        case 1:
            return 50
        default:
            return 0
        }
    }
    
    // 프로필 데이터 전달
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let profileVC = self.storyboard?.instantiateViewController(identifier: "ProfileViewController") as! ProfileViewController
        profileVC.modalPresentationStyle = .overFullScreen
        
        switch indexPath.section {
        case 1:
            profileVC.changeImage = friendList[indexPath.row].imageName
            profileVC.changeName = friendList[indexPath.row].name
        default:
            profileVC.changeImage = myData.imageName
            profileVC.changeName = myData.name
        }
        present(profileVC, animated: true, completion: nil)
    }
    
    // 프로필 스와이프 구현
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let hideAction = UIContextualAction(style: .normal, title: "숨김", handler: {(action, view, completionHandler) in
            completionHandler(true)
        })
        hideAction.backgroundColor = .darkGray
        let blockAction = UIContextualAction(style: .destructive, title: "차단", handler: {(action, view, completionHandler) in
            completionHandler(true)
        })
        return UISwipeActionsConfiguration(actions: [blockAction, hideAction])
    }
    
    // 프로필 미리보기 구현
    func tableView(_ tableView: UITableView, contextMenuConfigurationForRowAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        
        return UIContextMenuConfiguration(identifier: nil, previewProvider: {
            
            let previewVC = self.storyboard?.instantiateViewController(identifier: "ProfileViewController") as! ProfileViewController
            
            if indexPath.section == 1 {
                previewVC.changeImage = self.friendList[indexPath.row].imageName
                previewVC.changeName = self.friendList[indexPath.row].name
            } else {
                previewVC.changeImage = self.myData.imageName
                previewVC.changeName = self.myData.name
            }
            return previewVC
        },
        actionProvider: { suggestionActions in
            
            let chattingAction = UIAction(title: "채팅하기", image: nil) { _ in  return }
            let voicetalkAction = UIAction(title: "보이스톡", image: nil) { _ in  return }
            let facetalkAction = UIAction(title: "페이스톡", image: nil) { _ in  return }
            let giftAction = UIAction(title: "선물하기", image: nil) { _ in  return }
            
            return UIMenu(title: "", children: [chattingAction, voicetalkAction, facetalkAction, giftAction])
        })
    }
}

// MARK: - 테이블뷰 데이터 소스
extension HomeViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return 1
        case 1:
            return friendList.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCell.identifier, for: indexPath) as? MyTableViewCell else { return UITableViewCell() }
            
            cell.setData(imageName: myData.imageName, name: myData.name, message: myData.state)
            
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: FriendTableViewCell.identifier, for: indexPath) as? FriendTableViewCell else { return UITableViewCell() }
            
            let friends = friendList[indexPath.row]
            cell.setData(imageName: friends.imageName,
                         name: friends.name,
                         message: friends.state)
            
            return cell
        default:
            return UITableViewCell()
        }
    }
}
