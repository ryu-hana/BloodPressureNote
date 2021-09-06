//
//  TabBarController.swift
//  BloodPressureNote
//
//  Created by SugiuraArisa on 2021/06/26.
//

import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate  {

    // 画面下のpadding
    var bottomPadding:CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // UITabBarControllerDelegateプロトコルのメソッドをこのクラスで処理する。
        self.delegate = self

        // タブバーの背景色
        self.tabBar.barTintColor = UIColor.accent_base
        // 選択タブの背景色
        self.tabBar.selectionIndicatorImage = self.makeImageWithColorAndSize(
               color:UIColor.accent_dark,
               size: CGSize(width: tabBar.frame.width/5, height: tabBar.frame.height))
            .resizableImage(withCapInsets: UIEdgeInsets(top: 0, left: 0, bottom: 1, right: 0))
        // Todo：左右の余白を0にしたい
        
        // 選択タブアイコンの色
        self.tabBar.tintColor = UIColor.accent_base
        // 非選択タブアイコンの色
        UITabBar.appearance().unselectedItemTintColor = UIColor.white
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    
    // 横幅とアイテム数をもとにUIImageを生成
    func makeImageWithColorAndSize(color: UIColor, size: CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(CGRect(x: 0, y: 0, width: size.width, height: size.height))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }

}
