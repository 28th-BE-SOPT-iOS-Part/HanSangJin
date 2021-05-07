//
//  MyTableViewCell.swift
//  Sopt28th_iOS_Assignment
//
//  Created by 한상진 on 2021/05/07.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var myProfileImage: UIImageView!
    @IBOutlet weak var myNameLabel: UILabel!
    @IBOutlet weak var myStateLabel: UILabel!
    static let identifier: String = "MyTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - 내 프로필 셀 데이터 설정
    func setData(imageName: String,
                 name: String,
                 message: String) {
        if let image = UIImage(named: imageName) {
            myProfileImage.image = image
        }
        myNameLabel.text = name
        myStateLabel.text = message
    }

}
