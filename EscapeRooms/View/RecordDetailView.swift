//
//  RecordDetailView.swift
//  EscapeRooms
//
//  Created by playhong on 2023/04/04.
//

import UIKit

class RecordDetailView: UIView {
    
    private lazy var buttonWidth = self.frame.width / 2
    
    // MARK: - Properties
    
    let scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.backgroundColor = .white
        sv.indicatorStyle = .black
        return sv
    }()
    
    let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
//    let contentView: UIImageView = {
//        let view = UIImageView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.backgroundColor = .white
//        view.image = UIImage(named: "흙길.jpeg")
//        return view
//    }()
    
    let resultLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "탈출 결과"
        return label
    }()
    
    var resultButtons: [UIButton] = []
    
    let successButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("성공", for: .normal)
        return button
    }()
    
    let failButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("실패", for: .normal)
        return button
    }()

    
    let themeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "테마명    "
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    let themeTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.backgroundColor = .customGray
        tf.layer.cornerRadius = 8
        tf.textAlignment = .center
        tf.layer.masksToBounds = true
        return tf
    }()
    
    let themePickerView: UIPickerView = {
        let pv = UIPickerView()
        pv.translatesAutoresizingMaskIntoConstraints = false
        pv.backgroundColor = .clear
        return pv
    }()
    
    lazy var themeStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [themeLabel, themeTextField])
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .horizontal
        sv.alignment = .fill
        sv.distribution = .fill
        sv.spacing = 10
        return sv
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "탈출 시도"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    let datePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.preferredDatePickerStyle = .automatic
        picker.date = Date()
        picker.tintColor = .black
        picker.datePickerMode = .date
        picker.locale = Locale(identifier: "ko_KR")
        picker.timeZone = .autoupdatingCurrent
        picker.contentHorizontalAlignment = .leading
        return picker
    }()
    
    lazy var dateStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [dateLabel, datePicker])
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .horizontal
        sv.alignment = .fill
        sv.distribution = .fill
        sv.spacing = 10
        return sv
    }()
    
    let escapeTimeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "걸린 시간"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    let escapeTimeTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.backgroundColor = .customGray
        tf.layer.cornerRadius = 8
        tf.textAlignment = .center
        tf.layer.masksToBounds = true
        return tf
    }()
    
    let escapeTimePickerView: UIPickerView = {
        let pv = UIPickerView()
        pv.translatesAutoresizingMaskIntoConstraints = false
        pv.backgroundColor = .clear
        return pv
    }()
    
    lazy var escapeTimeStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [escapeTimeLabel, escapeTimeTextField])
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .horizontal
        sv.alignment = .fill
        sv.distribution = .fill
        sv.spacing = 10
        return sv
    }()
    
    let toolbar: UIToolbar = {
        let toolbar = UIToolbar()
        toolbar.translatesAutoresizingMaskIntoConstraints = false
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "저장", style: .done, target: self, action: #selector(doneButtonTapped))
        let space = UIBarButtonItem(systemItem: .flexibleSpace)
        let cancelButton = UIBarButtonItem(title: "취소", style: .done, target: self, action: #selector(cancelButtonTapped))
        toolbar.setItems([cancelButton, space, doneButton], animated: true)
        toolbar.tintColor = .navy
        toolbar.isUserInteractionEnabled = true
        return toolbar
    }()
    
    let hintLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "힌트 갯수"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    let hintTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let textLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "내용"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    let textView: UITextView = {
        let tv = UITextView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.backgroundColor = .white
        tv.text = "내용을 입력해주세요."
        tv.layer.borderWidth = 1.0
        tv.layer.borderColor = UIColor.orange.cgColor
        tv.layer.cornerRadius = 8
        tv.layer.masksToBounds = true
//        tv.isScrollEnabled = true
        return tv
    }()
    
    let bottomView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor.customGray.cgColor
        return view
    }()
    
    let saveButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("기록하기", for: .normal)
        button.backgroundColor = .orange
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        return button
    }()
    

    
    lazy var mainStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [themeStackView, dateStackView, escapeTimeStackView, textLabel, textView])
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .vertical
        sv.alignment = .leading
        sv.distribution = .fill
        sv.spacing = 20
        sv.setCustomSpacing(10, after: textLabel)
        return sv
    }()

    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        configurePickerView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        setConstraints()
        super.updateConstraints()
    }
    
    
    // MARK: - Setting

    func setupUI() {
        self.backgroundColor = .navy
        self.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(mainStackView)
        contentView.addSubview(bottomView)
        bottomView.addSubview(saveButton)
    }
    
    func configureScrollView() {
//        let width = self.frame.width
//        scrollView.contentSize = CGSize(width: width, height: 1500)
    }
    
    func configurePickerView() {
        escapeTimeTextField.inputView = escapeTimePickerView
        escapeTimeTextField.inputAccessoryView = toolbar
        
        themeTextField.inputView = themePickerView
        themeTextField.inputAccessoryView = toolbar
    }
    
    func setConstraints() {
        
        let height = self.datePicker.frame.height
        let width = self.datePicker.frame.width
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            scrollView.heightAnchor.constraint(equalTo: self.heightAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            contentView.heightAnchor.constraint(equalToConstant: 750),
            contentView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor, multiplier: 1),
            
            mainStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            mainStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            mainStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            bottomView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            bottomView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            bottomView.heightAnchor.constraint(equalToConstant: 100),
            
            saveButton.centerXAnchor.constraint(equalTo: bottomView.centerXAnchor),
            saveButton.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor),
            
            
            themeTextField.heightAnchor.constraint(equalToConstant: height),
            themeTextField.widthAnchor.constraint(equalToConstant: width),
            
            escapeTimeTextField.heightAnchor.constraint(equalToConstant: height),
            escapeTimeTextField.widthAnchor.constraint(equalToConstant: width),
        
            textView.heightAnchor.constraint(equalToConstant: 200),
        ])
        
        contentView.heightAnchor.constraint(equalTo: self.heightAnchor).priority = .defaultLow
    }
    
    // MARK: - Action
    
    @objc func doneButtonTapped() {
        themeTextField.resignFirstResponder()
        escapeTimeTextField.resignFirstResponder()
    }
    
    @objc func cancelButtonTapped() {
        themeTextField.resignFirstResponder()
        escapeTimeTextField.resignFirstResponder()
    }

    
}
