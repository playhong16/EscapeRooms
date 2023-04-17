//
//  RecordController.swift
//  EscapeRooms
//
//  Created by playhong on 2023/03/30.
//

import UIKit

final class RecordViewController: UIViewController {
    
    // MARK: - Properties

    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        return cv
    }()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureNavi()
        configureCV()
    }
    
    // MARK: - Setting
    
    func configureUI() {
        view.backgroundColor = .white
        self.title = "기록"
        
        self.view.addSubview(collectionView)
    }
    
    func configureNavi() {
        let image = UIImage(systemName: "square.and.pencil")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(addTapped))
        navigationItem.rightBarButtonItem?.tintColor = .navy
    }
    
    func configureCV() {
        print(#function)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(RecordCell.self, forCellWithReuseIdentifier: "RecordCell")
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    // MARK: - Action

    @objc func addTapped() {
        let detailView = RecordDetailViewController()
        detailView.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(detailView, animated: true)
    }

}

// MARK: - Extension

extension RecordViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecordCell", for: indexPath) as? RecordCell else { return UICollectionViewCell() }
        cell.themeImage.image = UIImage(named: "강남목욕탕.jpeg")
        return cell
    }
    
    
}

extension RecordViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size: CGFloat = collectionView.frame.width / 3 - 3
        let height: CGFloat = size + 20
        return CGSize(width: size, height: height)
    }
    
    // 세로 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 3
    }
    
    // 가로 간격 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}

extension RecordViewController: UICollectionViewDelegate {
    
}


