//
//  PostCollectionViewCell.swift
//  CatStaGram
//
//  Created by 유지민 on 2022/05/11.
//

import UIKit

class PostCollectionViewCell: UICollectionViewCell {
    static let identifier = "PostCollectionViewCell"

    @IBOutlet weak var postImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func setupData() {
        //이미지뷰의 이미지를 업로드한다.
    }

}
