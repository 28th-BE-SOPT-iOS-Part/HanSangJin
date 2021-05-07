//
//  MoreCollectionViewCell.swift
//  Sopt28th_iOS_Assignment
//
//  Created by 한상진 on 2021/05/07.
//

import UIKit

class MoreCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var menuImage: UIImageView!
    @IBOutlet weak var menuNameLabel: UILabel!
    static let identifier = "MoreCollectionViewCell"
    
    // MARK: - 컬렉션뷰 데이터 설정
    func setData(imageName: String,
                 menuName: String) {
        if let image = UIImage(named: imageName) {
            menuImage.image = image
        }
        menuNameLabel.text = menuName
    }
}
