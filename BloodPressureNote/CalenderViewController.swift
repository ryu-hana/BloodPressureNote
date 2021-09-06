//
//  CalenderViewController.swift
//  BloodPressureNote
//
//  Created by SugiuraArisa on 2021/06/24.
//

import UIKit
import RealmSwift
import FSCalendar

class CalenderViewController: UIViewController,
                              FSCalendarDataSource, FSCalendarDelegate {
//class CalenderViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var recordBtnInner: UIButton!
    @IBOutlet weak var calenderView: FSCalendar!
    
    // Realmインスタンスを取得する
    let realm = try! Realm()
    
    // 選択された日付
    var selectDate = Date()
    
    // 血圧記録一覧
//    var recordList = try! Realm().objects(Record.self).sorted(byKeyPath: "time", ascending: true)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 記録ボタンのレイアウト設定
        recordBtnInner.backgroundColor = UIColor.accent_base
        recordBtnInner.layer.cornerRadius = 10.0
        
        // カレンダー
        calenderView.delegate = self
        calenderView.dataSource = self
        // セルフォーマット
        calenderView.calendarHeaderView.backgroundColor = UIColor.accent_base
//        calenderView.monthPosition(for: <#T##FSCalendarCell#>)
        calenderView.calendarWeekdayView.weekdayLabels[0].text = "日"
        calenderView.calendarWeekdayView.weekdayLabels[0].textColor = UIColor.red
        calenderView.calendarWeekdayView.weekdayLabels[1].text = "月"
        calenderView.calendarWeekdayView.weekdayLabels[2].text = "火"
        calenderView.calendarWeekdayView.weekdayLabels[3].text = "水"
        calenderView.calendarWeekdayView.weekdayLabels[4].text = "木"
        calenderView.calendarWeekdayView.weekdayLabels[5].text = "金"
        calenderView.calendarWeekdayView.weekdayLabels[6].text = "土"
        calenderView.calendarWeekdayView.weekdayLabels[6].textColor = UIColor.blue
        // 月表示
        calenderView.setScope(.month, animated: true)
        // 初期選択日付
        calenderView.select(selectDate)
        
        // 先月ボタン
        let preMonthBtn = UIButton()
        preMonthBtn.setTitle("<", for: .normal)
        calenderView.calendarHeaderView.addSubview(preMonthBtn)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // カレンダー日付選択時の処理
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        // 処理
        selectDate = date
    }
    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        <#code#>
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }
    
}
