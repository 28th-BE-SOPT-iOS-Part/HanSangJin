//
//  HomeTableViewCell.swift
//  Sopt28th_iOS_Assignment
//
//  Created by 한상진 on 2021/05/06.
//

import UIKit

class FriendTableViewCell: UITableViewCell {
    
    @IBOutlet weak var frProfileImage: UIImageView!
    @IBOutlet weak var frNameLabel: UILabel!
    @IBOutlet weak var frStateLabel: UILabel!
    static let identifier: String = "FriendTableViewCell"

    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - 친구 프로필 셀 데이터 설정
    func setData(imageName: String,
                 name: String,
                 message: String) {
        if let image = UIImage(named: imageName) {
            frProfileImage.image = image
        }
        frNameLabel.text = name
        frStateLabel.text = message
    }
}
