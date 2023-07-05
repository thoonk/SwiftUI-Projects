//
//  PlayerUIView.swift
//  PlayerViewDemo
//
//  Created by thoonk on 2023/07/03.
//

import UIKit
import AVKit

final class PlayerUIView: UIView {
    // MARK: - Properties
    private let playerLayer = AVPlayerLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let url = URL(string: "https://mobilevod.neungyule.com/neungyulemobile/Free/0012_nekids_free/004_engilshvil_app/contents/Level 3/L3_3_rhyme song.mp4")!
        
        let player = AVPlayer(url: url)
        player.play()
        
        playerLayer.player = player
        layer.addSublayer(playerLayer)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer.frame = bounds
    }
}
