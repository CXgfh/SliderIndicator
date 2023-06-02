//
//  ViewController.swift
//  SliderIndicator
//
//  Created by oauth2 on 05/10/2023.
//  Copyright (c) 2023 oauth2. All rights reserved.
//

import UIKit
import SliderIndicator
import SnapKit
import AVFoundation

class ViewController: UIViewController {

    private lazy var slider: SliderDefaultIndicator = {
        var config = SliderConfig.shared
        config.extraViewSize = 50
        
        let slider = SliderDefaultIndicator(config: config)
        slider.delegate = self
        slider.addIndicator(UIView())
        
        slider.extraContentView.addSubview(UIView())
        
        slider.indicatorContentView
        return slider
    }()
    
    private lazy var levelSlider: LevelSliderDefaultIndicator = {
        var config = LevelSliderConfig.shared
        
        let slider = LevelSliderDefaultIndicator(config: .shared)
        slider.delegate = self
        for index in SliderLevel.allCases {
            slider.setImage(UIColor.random.image(CGSize(width: 20, height: 20)), index)
        }
        return slider
    }()
    
    private lazy var tailoringView: ImageTailoringSliderIndicator = {
        let tailoring = ImageTailoringSliderIndicator()
        tailoring.image = UIColor.random.image(CGSize(width: 80, height: 100))
        return tailoring
    }()

    private lazy var videoTailoringView: VideoTailoringSliderIndicator = {
        var config = VideoTailoringSliderConfig.shared
        
        let tailoring = VideoTailoringSliderIndicator(config: config)
        tailoring.delegate = self
        tailoring.addIndicator(UIView())
        return tailoring
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(videoTailoringView)
        videoTailoringView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        DispatchQueue.main.asyncAfter(deadline: .now()+coordinator.transitionDuration) {
            self.slider.updateSlider()
        }
    }
}


extension ViewController: SliderIndicatorDelegate {
    func sliderChanged(_ slider: SliderIndicator.SliderView, to newValue: Float) {
        
    }
    
    func sliderStartDragging(_ slider: SliderIndicator.SliderView) {
        
    }
    
    func sliderEndedDragging(_ slider: SliderIndicator.SliderView) {
        
    }
}

extension ViewController: VideoTailoringSliderIndicatorDelegate {
    
}
