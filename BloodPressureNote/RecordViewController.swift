//
//  RecordViewController.swift
//  BloodPressureNote
//
//  Created by SugiuraArisa on 2021/06/26.
//

import UIKit

class RecordViewController: UIViewController {
    @IBOutlet weak var navigationBar: UINavigationItem!
    @IBOutlet weak var saveBtn: UIBarButtonItem!
    
    // 記録の日付
    var date: Date = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // サブタイトル
        let f = DateFormatter()
        f.dateStyle = .medium
        f.timeStyle = .none
        f.locale = Locale(identifier: "ja_JP")
        let subTitle = f.string(from: date)
        navigationBar.titleView = self.setTitle("記録", subtitle: subTitle)
        
        // 保存ボタンのレイアウト
        let font = UIFont.boldSystemFont(ofSize: 17)
        saveBtn?.setTitleTextAttributes([NSAttributedString.Key.font: font],
                                        for: [.highlighted, .disabled, .focused])
        saveBtn?.setTitleTextAttributes([NSAttributedString.Key.font: font],
                                        for: .normal)
    }

    // ナビゲーションバーのタイトル設定
    func setTitle(_ title: String, subtitle: String) -> UIView {
        let rect = CGRect(x: 0, y: 0, width: 100, height: 50)
        let titleSize: CGFloat = 17     // adjust as needed
        let subtitleSize: CGFloat = 14

        let label = UILabel(frame: rect)
        label.backgroundColor = .clear
        label.numberOfLines = 2
        label.textAlignment = .center
        label.textColor = .black

        let text = NSMutableAttributedString()
        text.append(NSAttributedString(string: title, attributes: [.font : UIFont.boldSystemFont(ofSize: titleSize)]))
        text.append(NSAttributedString(string: "\n\(subtitle)", attributes: [.font : UIFont.systemFont(ofSize: subtitleSize)]))
        label.attributedText = text
        return label
    }
}
