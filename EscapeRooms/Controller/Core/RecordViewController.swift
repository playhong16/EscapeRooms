//
//  RecordController.swift
//  EscapeRooms
//
//  Created by playhong on 2023/03/30.
//

import UIKit

final class RecordViewController: UIViewController {
    
    // MARK: - Properties
    
    let recordDataManager = CoreDataManager.shared
    let themeDataManager = ThemeDataManager.shared
    let recordView = RecordView()
    
    // MARK: - LifeCycle
    
    override func loadView() {
        view = recordView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recordView.collectionView.delegate = self
        recordView.collectionView.dataSource = self
        recordView.collectionView.register(RecordCVCell.self, forCellWithReuseIdentifier: "RecordCVCell")
        configureUI()
        configureNavi()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        recordView.collectionView.reloadData()
    }
    
    // MARK: - Setting
    
    func configureUI() {
    }
    
    func configureNavi() {
        let image = UIImage(systemName: "square.and.pencil")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(addButtonTapped))
        navigationItem.rightBarButtonItem?.tintColor = .navy
    }
    
    
    // MARK: - Action

    @objc func addButtonTapped() {
        let detailVC = RecordDetailViewController()
        detailVC.hidesBottomBarWhenPushed = true
        detailVC.title = "기록하기"
        navigationController?.pushViewController(detailVC, animated: true)
    }

}

// MARK: - Extension

extension RecordViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recordDataManager.getRecordThemesFromCoreData().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecordCVCell", for: indexPath) as? RecordCVCell else { return UICollectionViewCell() }
        let recordData = recordDataManager.getRecordThemesFromCoreData()
        let imageName = recordData[indexPath.row].theme ?? "photo"
        cell.themeImage.image = UIImage(named: imageName)
        cell.recordData = recordData[indexPath.row]
        return cell
    }
    
    
}

extension RecordViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size: CGFloat = collectionView.frame.width / 2.5
        let height: CGFloat = 180
        return CGSize(width: size, height: height)
    }
}

extension RecordViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = RecordDetailViewController()
        detailVC.hidesBottomBarWhenPushed = true
        detailVC.recordData = recordDataManager.getRecordThemesFromCoreData()[indexPath.row]
        navigationController?.pushViewController(detailVC, animated: true)
    }
}


