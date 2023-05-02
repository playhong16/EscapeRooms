//
//  RecordView.swift
//  EscapeRooms
//
//  Created by playhong on 2023/03/30.
//

import UIKit

final class RecordView: UIView {
    
    // MARK: - Properties
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 5 // 가로 사이 간격
        layout.minimumInteritemSpacing = 1 // 세로 사이 간격
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .white
        return cv
    }()

    private let mainView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .orange
        return view
    }()

    private let cell = RecordCVCell()
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
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
        self.backgroundColor = .white
        self.addSubview(collectionView)
        self.addSubview(mainView)
        collectionView.addSubview(cell)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 300),
            
//            cell.topAnchor.constraint(equalTo: collectionView.topAnchor, constant: 20),
//            cell.leadingAnchor.constraint(equalTo: collectionView.leadingAnchor, constant: 20),
//            cell.trailingAnchor.constraint(equalTo: collectionView.trailingAnchor, constant: -20),
//            cell.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 20),
            
            mainView.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 10),
            mainView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            mainView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    // MARK: - Action


}
