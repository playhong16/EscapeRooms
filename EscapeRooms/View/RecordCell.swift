//
//  RecordCell.swift
//  EscapeRooms
//
//  Created by playhong on 2023/04/06.
//

import UIKit

class RecordCell: UICollectionViewCell {
    
    var themeImage: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleToFill
        iv.backgroundColor = .blue
        return iv
    }()
    
    // MARK: - Life Cycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
//        setConstraints()
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
        self.addSubview(themeImage)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            themeImage.topAnchor.constraint(equalTo: self.topAnchor),
            themeImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            themeImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            themeImage.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
