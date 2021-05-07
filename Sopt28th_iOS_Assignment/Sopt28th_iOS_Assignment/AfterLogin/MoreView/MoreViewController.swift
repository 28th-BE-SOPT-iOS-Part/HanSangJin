//
//  SettingViewController.swift
//  Sopt28th_iOS_Assignment_2
//
//  Created by 한상진 on 2021/04/13.
//

import UIKit

class MoreViewController: UIViewController {
    
    @IBOutlet weak var menuCollectionView: UICollectionView!
    var menuList: [MoreDataModel] = []
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setMenuList()
        menuCollectionView.delegate = self
        menuCollectionView.dataSource = self
    }
    
    // MARK: - 더보기 메뉴 데이터 설정
    func setMenuList() {
        menuList.append(contentsOf: [
            MoreDataModel(menuImage: "message",
                                menuName: "메일"),
            MoreDataModel(menuImage: "message",
                                menuName: "캘린더"),
            MoreDataModel(menuImage: "message",
                                menuName: "서랍"),
            MoreDataModel(menuImage: "message",
                                menuName: "카카오콘"),
            
            MoreDataModel(menuImage: "message",
                                menuName: "메이커스"),
            MoreDataModel(menuImage: "message",
                                menuName: "선물하기"),
            MoreDataModel(menuImage: "message",
                                menuName: "이모티콘"),
            MoreDataModel(menuImage: "message",
                                menuName: "프렌즈"),
            
            MoreDataModel(menuImage: "message",
                                menuName: "쇼핑하기"),
            MoreDataModel(menuImage: "message",
                                menuName: "스타일"),
            MoreDataModel(menuImage: "message",
                                menuName: "주문하기"),
            MoreDataModel(menuImage: "message",
                                menuName: "멜론티켓"),
            
            MoreDataModel(menuImage: "message",
                                menuName: "게임"),
            MoreDataModel(menuImage: "message",
                                menuName: "멜론"),
            MoreDataModel(menuImage: "message",
                                menuName: "헤어샵"),
            MoreDataModel(menuImage: "message",
                                menuName: "전체서비스"),
        ])
    }
}

// MARK: - 컬렉션뷰 데이터소스
extension MoreViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        menuList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MoreCollectionViewCell.identifier, for: indexPath) as? MoreCollectionViewCell else { return UICollectionViewCell() }
        cell.setData(imageName: menuList[indexPath.row].menuImage,
                     menuName: menuList[indexPath.row].menuName)
        
        return cell
    }
    
}

// MARK: - 컬렉션뷰 델리게이트
extension MoreViewController: UICollectionViewDelegate {}

// MARK: - 컬렉션뷰 레이아웃
extension MoreViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenSize = UIScreen.main.bounds.width
        let widthSize = screenSize * (70 / 375)
        let heightSize = screenSize * (70 / 375)
        return CGSize(width: widthSize, height: heightSize)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 19
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
}
