//
//  ReelsCell.swift
//  CatStaGram
//
//  Created by 유지민 on 2022/05/30.
//

import UIKit
import SnapKit
import AVKit

class ReelsCell: UICollectionViewCell {
    static let identifier = "ReelsCell"
    
    var videoView: VideoPlayerView?
    
    // 릴스
    let cellTitleLabel = UILabel()
    
    // 카메라
    let cameraImageView = UIImageView()
    
    // 댓글
    let commentImageView = UIImageView()
    
    // 좋아요
    let likeImageView = UIImageView()
    
    // 공유하기
    let shareImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setupURL(_ urlStr: String) {
        self.videoView = VideoPlayerView(frame: .zero, urlStr: urlStr)
        setupAttribute()
        setupLayout()
    }
    
    private func setupAttribute() {
        cellTitleLabel.text = "릴스"
        cellTitleLabel.font = .boldSystemFont(ofSize: 25)
        cellTitleLabel.textAlignment = .left
        
        cameraImageView.image = UIImage(systemName: "camera")
        
    }
    
    private func setupLayout() {
        guard let videoView = videoView else { return }
        contentView.addSubview(videoView)
        
        videoView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        [cellTitleLabel, cameraImageView,
        likeImageView,
        commentImageView,
        shareImageView]
            .forEach { contentView.addSubview($0) }
        
        cellTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.leading.equalToSuperview().offset(20)
        }
    }
}
