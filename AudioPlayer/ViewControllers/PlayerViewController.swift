//
//  PlayerViewController.swift
//  AudioPlayer
//
//  Created by Михаил Андреев on 11/10/2019.
//  Copyright © 2019 Squad of 4. All rights reserved.
//

import UIKit
import AVFoundation

class PlayerViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet var coverImage: UIVisualEffectView!
    @IBOutlet var artistNameLabel: UILabel!
    @IBOutlet var trackNameLabel: UILabel!
    @IBOutlet var trackReleaseYearLabel: UILabel!
    @IBOutlet var playButton: UIButton!
    @IBOutlet var slider: UISlider!
    
    // MARK: - Private Properties
    private var audioPlayer: AVAudioPlayer?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        let path = Bundle.main.path(forResource: "Rockstar.mp3", ofType:nil)!
        let url = URL(fileURLWithPath: path)

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.prepareToPlay()
        } catch {
            print(error)
        }
        
        slider.maximumValue = Float(audioPlayer!.duration)
        
        _ = Timer.scheduledTimer(timeInterval: 0.1,
                                 target: self,
                                 selector: #selector(updateSlider),
                                 userInfo: nil,
                                 repeats: true)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        audioPlayer?.stop()
    }
    
    // MARK: - IBActions
    @IBAction func changeAudioTime() {
        audioPlayer?.play()
        audioPlayer?.currentTime = TimeInterval(slider.value)
        audioPlayer?.prepareToPlay()
        audioPlayer?.play()
    }
    
    @IBAction func playButtonPressed() {
        if audioPlayer!.isPlaying {
            audioPlayer?.pause()
        } else {
            audioPlayer?.play()
        }
    }
    
    @objc private func updateSlider() {
        slider.value = Float(audioPlayer!.currentTime)
    }
}
