//
//  SoundManager.swift
//  biubiubiu Watch App
//
//  Created by lixumin on 2024/12/19.
//

import Foundation
import AVFoundation

class SoundManager {
    var audioPlayer: AVAudioPlayer?
    func playbiubiubiu() {
        guard let url = Bundle.main.url(forResource: "bong", withExtension: "mp3") else {
            print("音频文件未找到")
            return
        }

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch {
            print("播放音频时出错: \(error)")
        }
    }
    func playkaca() {
        guard let url = Bundle.main.url(forResource: "kaca", withExtension: "mp3") else {
            print("音频文件未找到")
            return
        }

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch {
            print("播放音频时出错: \(error)")
        }
    }
    func playdiu() {
        guard let url = Bundle.main.url(forResource: "diu", withExtension: "mp3") else {
            print("音频文件未找到")
            return
        }

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch {
            print("播放音频时出错: \(error)")
        }
    }
    func playshui() {
        guard let url = Bundle.main.url(forResource: "shui", withExtension: "mp3") else {
            print("音频文件未找到")
            return
        }

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch {
            print("播放音频时出错: \(error)")
        }
    }
}
