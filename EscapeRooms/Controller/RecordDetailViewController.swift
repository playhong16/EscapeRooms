//
//  RecordDetailViewController.swift
//  EscapeRooms
//
//  Created by playhong on 2023/04/05.
//

import UIKit

class RecordDetailViewController: UIViewController {

    // MARK: - Properties
    
    private let detailView = RecordDetailView()
    private let testData: [String] = ["1분", "2분", "3분", "4분", "5분", "6분", "7분", "8분", "9분", "10분"]
    let themeData: [String] = ["그림자 없는 상자", "MAYDAY", "Silent", "전래동 살인사건", "강남 목욕탕"]
    
    // MARK: - LifeCycle
    
    override func loadView() {
        view = detailView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        detailView.escapeTimePickerView.dataSource = self
        detailView.escapeTimePickerView.delegate = self
        
        detailView.themePickerView.dataSource = self
        detailView.themePickerView.delegate = self
    }
    
    // MARK: - Setting
    
    func setupUI() {
        
        // navigationBar Back Button Color Setting
        self.navigationController?.navigationBar.tintColor = .navy
    }

    
    
}

extension RecordDetailViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        switch pickerView {
        case detailView.escapeTimePickerView:
            return 2
        case detailView.themePickerView:
            return 1
        default:
            return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == detailView.escapeTimePickerView {
            return testData.count
        } else if pickerView == detailView.themePickerView {
            return themeData.count
        } else {
            return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == detailView.escapeTimePickerView {
            return testData[row]
        } else if pickerView == detailView.themePickerView {
            return themeData[row]
        }  else {
            return ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == detailView.escapeTimePickerView {
            let selectedData = testData[row]
            detailView.escapeTimeTextField.text = "\(selectedData) \(selectedData)"
            print("DEBUG: Selected: \(selectedData)")
        } else if pickerView == detailView.themePickerView {
            let selectedData = themeData[row]
            detailView.themeTextField.text = selectedData
            print("DEBUG: Selected: \(selectedData)")
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 30
    }
    
}

extension RecordDetailViewController: UIPickerViewDelegate {
    
}
