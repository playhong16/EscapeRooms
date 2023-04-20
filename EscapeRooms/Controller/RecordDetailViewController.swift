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
    let recordDataManager = CoreDataManager.shared
    
    var recordData: RecordData? {
        didSet {
            print("create record data")
            configureUI()
        }
    }
    let themeData: [String] = ["그림자 없는 상자", "MAYDAY", "Silent", "전래동 살인사건", "강남 목욕탕"]
    
    // MARK: - LifeCycle
    
    override func loadView() {
        view = detailView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        detailView.themePickerView.dataSource = self
        detailView.themePickerView.delegate = self
        detailView.delegate = self
    }
    
    func configureUI() {
        if let recordData = self.recordData {
            let theme = recordData.theme
            guard let date = recordData.date else { return }
            let minute = recordData.minute
            let second = recordData.second
            let hint = recordData.hint
            let text = recordData.text
        
            detailView.themeTextField.text = theme
            detailView.datePicker.date = date
            detailView.minuteTextField.text = minute
            detailView.secondTextField.text = second
            detailView.hintTextField.text = hint
            detailView.textView.text = text
            detailView.textView.textColor = .black
            detailView.saveButton.setTitle("수정하기", for: .normal)
            detailView.textView.becomeFirstResponder()
            
        } else {
            detailView.textView.text = "텍스트를 입력하세요"
            detailView.textView.textColor = .customGray
            detailView.saveButton.setTitle("기록하기", for: .normal)
        }
    }
    
    // MARK: - Setting
    
    func setupUI() {
        // navigationBar Back Button Color Setting
        self.navigationController?.navigationBar.tintColor = .navy
        let image = UIImage(systemName: "trash.fill")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(deleteButtonTapped))
    }
    
    // MARK: - Action
    
    @objc func deleteButtonTapped() {
        if let recordData = self.recordData {
            recordDataManager.deleteRecord(data: recordData) {
                print("DEBUG: delete Record Data Success!!")
                self.navigationController?.popViewController(animated: true)
            }
        }
    }

    
}

extension RecordDetailViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return themeData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return themeData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            let selectedData = themeData[row]
            detailView.themeTextField.text = selectedData
            print("DEBUG: Selected: \(selectedData)")
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 30
    }
    
}

extension RecordDetailViewController: UIPickerViewDelegate {
    
}

extension RecordDetailViewController: SaveButtonDelegate {
    func saveButtonTapped() {
        print("DEBUG:UpdateButton Tapped")
        if let recordData = self.recordData {
            recordData.date = detailView.datePicker.date
            recordData.theme = detailView.themeTextField.text
            recordData.minute = detailView.minuteTextField.text
            recordData.second = detailView.secondTextField.text
            recordData.hint = detailView.hintTextField.text
            recordData.text = detailView.textView.text
            recordDataManager.updateRecord(updateData: recordData) {
                print("DEBUG: Record Data Update SUCCESS!!")
                self.navigationController?.popViewController(animated: true)
            }
            
        } else {
            let date = detailView.datePicker.date
            let theme = detailView.themeTextField.text ?? ""
            let minute = detailView.minuteTextField.text ?? "0"
            let second = detailView.secondTextField.text ?? "0"
            let hint = detailView.hintTextField.text ?? "0"
            let text = detailView.textView.text ?? ""
            
            recordDataManager.createRecord(result: true, theme: theme, date: date, minute: minute, second: second, hint: hint, text: text) {
                print("DEBUG: Record Data Create SUCCESS")
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
}
