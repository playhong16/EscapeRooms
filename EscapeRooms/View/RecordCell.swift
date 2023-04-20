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
            setUIWithData()
        }
    }
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .white
        label.textAlignment  = .center
        return label
    }()
    
    var themeImage: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleToFill
        iv.backgroundColor = .blue
        return iv
    }()
    
    lazy var mainStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [dateLabel, themeImage])
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .vertical
        sv.alignment = .fill
        sv.distribution = .fill
        sv.spacing = 5
        return sv
    }()
    
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
        contentView.addSubview(mainStackView)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: self.topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    func setUIWithData() {
        let date = recordData?.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy. MM. dd"
        let convertDate = dateFormatter.string(from: date!)
        dateLabel.text = convertDate
        themeImage.image = UIImage(named: "강남목욕탕.jpeg")
    }
}
