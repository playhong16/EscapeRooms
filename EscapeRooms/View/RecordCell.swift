//
//  RecordCell.swift
//  EscapeRooms
//
//  Created by playhong on 2023/04/06.
//

import UIKit

class RecordCell: UICollectionViewCell {
    
    var recordData: RecordData? {
        didSet {
            configureCell()
        }
    }
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .white
        return label
    }()
    
    let themeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .white
        return label
    }()
    
    var themeImage: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleToFill
        iv.backgroundColor = .blue
        return iv
    }()
    
//    lazy var mainStackView: UIStackView = {
//        let sv = UIStackView(arrangedSubviews: [themeImage, dateLabel])
//        sv.translatesAutoresizingMaskIntoConstraints = false
//        sv.axis = .horizontal
//        sv.alignment = .fill
//        sv.distribution = .fill
//        sv.spacing = 5
//        return sv
//    }()
    
    // MARK: - Life Cycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        setConstraints()
        super.updateConstraints()
    }
    
    // MARK: - Configure

    func setupUI() {
//        self.backgroundColor = .systemPink
        print("DEBUG: RecordCell UI Setting!")
        contentView.addSubview(themeImage)
//        self.addSubview(dateLabel)
//        self.addSubview(themeLabel)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
//            mainStackView.topAnchor.constraint(equalTo: self.topAnchor),
//            mainStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
//            mainStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
//            mainStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            themeImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            themeImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            themeImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            themeImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 20),
            
//            dateLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
//            dateLabel.leadingAnchor.constraint(equalTo: themeImage.trailingAnchor, constant: 10),
//
//            themeLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 10),
//            themeLabel.leadingAnchor.constraint(equalTo: themeImage.trailingAnchor, constant: 10)
        ])
    }
    
    func configureCell() {
        let date = recordData?.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let convertDate = dateFormatter.string(from: date!)
        dateLabel.text = convertDate
        themeLabel.text = recordData?.theme
    }
}
