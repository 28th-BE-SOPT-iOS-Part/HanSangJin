## :notebook_with_decorative_cover:3주차 과제 : TableView 및 CollectionView 구현하기

<img src="https://user-images.githubusercontent.com/70688424/117496143-94799400-afb1-11eb-8f13-b2894ee69dc7.png">

<img src="https://user-images.githubusercontent.com/70688424/117496201-ab1feb00-afb1-11eb-956b-e272b0ce1c59.png">

<img src="https://user-images.githubusercontent.com/70688424/117496233-b6731680-afb1-11eb-8de2-312ac07c78e8.png">

<br>

## :notebook_with_decorative_cover:구현 결과


### 📌친구목록 TableView

<img src="https://user-images.githubusercontent.com/70688424/117499989-fc7ea900-afb6-11eb-82da-a522d2a1d2bb.png" width="330">

처음에 친구 목록 TableView Cell들의 레이아웃이 적용되지 않아서 어려웠는데, 알고보니 identifier가 제대로 등록이 되지 않았던 것이었다.

TableView 구성법이 너무 복잡하게 느껴져서 세미나 시간에 실습했던 자료를 다시 열어보며 구성 순서를 그대로 따라했더니 됐다.<br>자주 복습하면서 외울 수 있도록 해야겠다...

<br>

### 📌프로필 데이터 전달

<img src="https://user-images.githubusercontent.com/70688424/117500893-3ef4b580-afb8-11eb-8dd4-c9c1a2e16b5e.gif" width="330">

<pre>
<code>
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
</code>
</pre>

프로필에서 '내 프로필'과 '친구 프로필'로 두 가지로 나뉘어있어서 어떻게 할 지 어려웠다.

구글링 결과, swift구문을 이용해 처리를 할 수 있다는 것을 알게 되어 해결할 수 있었다.

<br>

### 📌친구목록 CollectionView

<img src="https://user-images.githubusercontent.com/70688424/117500566-c5f55e00-afb7-11eb-8662-f6e1bfe116bf.png" width="330">

메뉴 이미지들을 각각 다르게 해야하는데.. 핑계지만 학교 시험 때문에 시간이 촉박해서 일단 하나로 통일했다.<br>조만간 수정 할 예정이다.

CollectionView는 앞서 TableView를 구현하는 것과 방법이 비슷해서 어려움은 없었다.

<br>
<br>

## :notebook_with_decorative_cover:도전과제

<img src="https://user-images.githubusercontent.com/70688424/117501586-3650af00-afb9-11eb-94a2-9660e1864956.png">

AlertAction에서 ActionSheet라는 Action을 이용하면 해결할 수 있는 도전과제였다.

<img src="https://user-images.githubusercontent.com/70688424/117501711-64ce8a00-afb9-11eb-8e80-fc2b3c4d75f9.png" width="330">

<pre>
<code>
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
</code>
</pre>

딱히 어려운 건 없었다.

<br>

<img src="https://user-images.githubusercontent.com/70688424/117501879-a7906200-afb9-11eb-8370-3c0f9a45db7c.png">

TableView 함수 중에 스와이프 기능과 관련된 함수가 존재했다.

<img src="https://user-images.githubusercontent.com/70688424/117502203-208fb980-afba-11eb-97d6-7e67b3a6e9db.gif" width="330">

UIContextualAction에서 handler에 뭘 넣어야할지 모르겠어서 어려웠다. nil도 넣을 수 없게 되어있었다.

<pre>
<code>
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
</code>
</pre>

구글링에서 찾은 자료대로 completionHandler(true)을 넣으니 해결됐다.

<br>

<img src="https://user-images.githubusercontent.com/70688424/117502420-74020780-afba-11eb-9404-09b17d4af9cb.png">

카카오톡에 이런 기능이 있는지를 처음 알았다.<br>어떻게 하는 지 아예 모르겠어서 그냥 100% 구글링을 통해 해결했다.

<img src="https://user-images.githubusercontent.com/70688424/117502581-af9cd180-afba-11eb-9b5c-ecd104aa3b64.gif" width="330">

알아보니 이것도 TableView 함수 중에 관련된 함수가 존재했다.

<pre>
<code>
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
</code>
</pre>
