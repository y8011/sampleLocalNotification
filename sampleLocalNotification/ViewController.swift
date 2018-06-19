//
//  ViewController.swift
//  sampleLocalNotification
//
//  Created by yuka on 2018/06/19.
//  Copyright © 2018年 yuka. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setNotificationAt()
    }
    
    // 5秒と10秒後のボタンタップされたら発動
    @IBAction func setTimerNotification(_ sender: UIButton) {
        if sender.titleLabel?.text == "10秒後" {
            setNotificationAfter(second: 10)
        } else if sender.titleLabel?.text == "5秒後" {
            setNotificationAfter(second: 5)
        }
    }
    
    func setNotificationAfter(second:Int) {
        // Notification のインスタンス作成
        let content = UNMutableNotificationContent()
        
        // タイトル、本文の設定
        content.title = "通知のタイトルだよ"
        content.body = "\(second)秒たったよ"
        
        // 音設定
        content.sound = UNNotificationSound.default()
//        content.sound = UNNotificationSound.init(named: "sound.m4a")
        
        // トリガー設定
        let trigger = UNTimeIntervalNotificationTrigger.init(timeInterval: TimeInterval(second), repeats: false)
        
        // リクエストの設定
        let request = UNNotificationRequest.init(identifier: "ID_AfterSecOnce", content: content, trigger: trigger)
        
        // 通知のセット
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        
    }
    
    // 指定した日時・時間に通知する
    func setNotificationAt() {
        // Notification のインスタンス作成
        let content = UNMutableNotificationContent()
        
        // タイトル、本文の設定
        content.title = "Love"
        content.body = "時間ですよ"
        
        // 音設定
//        content.sound = UNNotificationSound.default()
          content.sound = UNNotificationSound.init(named: "sound1.m4a")
        
        
        // 日時のセット
        let setDC = DateComponents(second:30)
        
        // トリガー設定
        let trigger = UNCalendarNotificationTrigger(dateMatching: setDC, repeats: true)
        
        // リクエストの設定
        let request = UNNotificationRequest.init(identifier: "ID_SpecificTime", content: content, trigger: trigger)
        
        // 通知のセット
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        
    }
    
    @IBAction func tapClear(_ sender: UIButton) {
        
        // タイマーの解除
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ["ID_SpecificTime"])
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

