//
//  ThemeDetailView.swift
//  EscapeRooms
//
//  Created by playhong on 2023/02/23.
//

import UIKit
import MapKit

final class ThemeDetailView: UIView {

    // MARK: - Properties
    
    let likeButtonConfigure = UIImage.SymbolConfiguration(pointSize: 25)
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .white
        // 스크롤 인디케이터(스크롤바 색) 스타일 변경
        scrollView.indicatorStyle = .black
        return scrollView
    }()

    let mainView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()

    let image: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let firstLine: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 204/255, green: 204/255, blue: 204/255, alpha: 1)
        return view
    }()
    
    let secondLine: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 204/255, green: 204/255, blue: 204/255, alpha: 1)
        return view
    }()
    
    let thirdLine: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 204/255, green: 204/255, blue: 204/255, alpha: 1)
        return view
    }()
    
    let nameLabel: UILabel = {
       let label = UILabel()
       label.translatesAutoresizingMaskIntoConstraints = false
       label.font = UIFont.boldSystemFont(ofSize: 22)
       label.textColor = .black
       return label
   }()
   
   let companyLabel: UILabel = {
       let label = UILabel()
       label.translatesAutoresizingMaskIntoConstraints = false
       label.font = UIFont.boldSystemFont(ofSize: 17)
       label.textColor = .gray
       return label
   }()
   
   let difficultyLabel: UILabel = {
       let label = UILabel()
       label.translatesAutoresizingMaskIntoConstraints = false
       label.font = UIFont.systemFont(ofSize: 14)
       label.textColor = .black
       return label
   }()
   
   let playTimeLabel: UILabel = {
       let label = UILabel()
       label.translatesAutoresizingMaskIntoConstraints = false
       label.font = UIFont.systemFont(ofSize: 14)
       label.textColor = .black
       return label
   }()
   
   let personnelLabel: UILabel = {
       let label = UILabel()
       label.translatesAutoresizingMaskIntoConstraints = false
       label.font = UIFont.systemFont(ofSize: 14)
       label.textColor = .black
       return label
   }()
    
    lazy var stackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [difficultyLabel, playTimeLabel])
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .horizontal
        sv.alignment = .fill
        sv.distribution = .fill
        sv.spacing = 5
        return sv
    }()
    
    let storyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.text = "줄거리"
        label.textColor = .black
        return label
    }()
    
    let storyTextView: UITextView = {
       let tv = UITextView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.font = UIFont.systemFont(ofSize: 14)
        tv.backgroundColor = .white
        tv.textColor = .black
        return tv
    }()
    
    let priceTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.text = "가격 정보"
        label.textColor = .black
        return label
    }()
    
    let priceSubLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "인당 가격"
        label.textColor = .gray
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .black
        return label
    }()
    
    let locationTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.text = "위치 정보"
        label.textColor = .black
        return label
    }()
    
    let mapView: MKMapView = {
        let map = MKMapView()
        map.translatesAutoresizingMaskIntoConstraints = false
        map.overrideUserInterfaceStyle = .dark
        map.showsUserLocation = true
        return map
    }()
    
    let locationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.text = "서울특별시 강남구 역삼동 824-25 대우디오빌플러스 지하 1층 111호"
        label.textColor = .black
        return label
    }()
    
    let bottomView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor.customGray.cgColor
        return view
    }()
    
    let reservationButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(red: 250/255, green: 149/255, blue: 0/255, alpha: 1)
        button.setTitle("예약하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        return button
    }()
    
    lazy var likeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "heart", withConfiguration: likeButtonConfigure), for: .normal)
        button.tintColor = .lightGray
        button.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var bottomButtonStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [likeButton, reservationButton])
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .horizontal
        sv.alignment = .fill
        sv.distribution = .fill
        sv.spacing = 20
        return sv
    }()
    
    // MARK: - LifeCycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        print(#function)
        setConstraints()
        super.updateConstraints()
    }
    
    // MARK: - Setting
    
    func setupUI() {
        print("DEBUG: DetailView setupUI()")
        self.addSubview(scrollView)
        
        scrollView.addSubview(mainView)
        mainView.addSubview(image)
        mainView.addSubview(firstLine)
        mainView.addSubview(nameLabel)
        mainView.addSubview(companyLabel)
        mainView.addSubview(stackView)
        mainView.addSubview(personnelLabel)
        mainView.addSubview(secondLine)
        mainView.addSubview(storyLabel)
        mainView.addSubview(storyTextView)
        mainView.addSubview(priceTitleLabel)
        mainView.addSubview(priceSubLabel)
        mainView.addSubview(priceLabel)
        mainView.addSubview(thirdLine)
        mainView.addSubview(locationTitleLabel)
        mainView.addSubview(mapView)
        mainView.addSubview(locationLabel)
        mainView.addSubview(bottomView)
        bottomView.addSubview(bottomButtonStackView)
    }
    
    func setConstraints() {
        
        let heightConstraint = mainView.heightAnchor.constraint(equalToConstant: 1500)
        heightConstraint.priority = UILayoutPriority(250)
        
        reservationButton.setContentHuggingPriority(UILayoutPriority(250), for: .horizontal)
        likeButton.setContentHuggingPriority(UILayoutPriority(251), for: .horizontal)
        
        NSLayoutConstraint.activate([
            
            scrollView.topAnchor.constraint(equalTo: self.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        
            
            mainView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            mainView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            mainView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            mainView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            // 수직 스크롤을 위한 설정
            heightConstraint,
            
            image.topAnchor.constraint(equalTo: mainView.topAnchor),
            image.widthAnchor.constraint(equalTo: mainView.widthAnchor),
            image.heightAnchor.constraint(equalToConstant: 450),
            
            nameLabel.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 30),
            nameLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 20),
            
            companyLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            companyLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 20),
            
            stackView.topAnchor.constraint(equalTo: companyLabel.bottomAnchor, constant: 5),
            stackView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 20),

            personnelLabel.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 5),
            personnelLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 20),
            
            firstLine.topAnchor.constraint(equalTo: personnelLabel.bottomAnchor, constant: 30),
            firstLine.widthAnchor.constraint(equalTo: mainView.widthAnchor),
            firstLine.heightAnchor.constraint(equalToConstant: 0.7),
            
            storyLabel.topAnchor.constraint(equalTo: firstLine.bottomAnchor, constant: 30),
            storyLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 20),
            
            storyTextView.topAnchor.constraint(equalTo: storyLabel.bottomAnchor, constant: 10),
            storyTextView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 20),
            storyTextView.widthAnchor.constraint(equalTo: mainView.widthAnchor, constant: -40),
            storyTextView.heightAnchor.constraint(equalToConstant: 250),
            
            secondLine.topAnchor.constraint(equalTo: storyTextView.bottomAnchor, constant: 30),
            secondLine.widthAnchor.constraint(equalTo: mainView.widthAnchor),
            secondLine.heightAnchor.constraint(equalToConstant: 0.7),
            
            priceTitleLabel.topAnchor.constraint(equalTo: secondLine.bottomAnchor, constant: 30),
            priceTitleLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 20),
            
            priceSubLabel.topAnchor.constraint(equalTo: priceTitleLabel.bottomAnchor, constant: 5),
            priceSubLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 20),
            
            priceLabel.topAnchor.constraint(equalTo: priceSubLabel.bottomAnchor, constant: 10),
            priceLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 20),
            
            thirdLine.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 30),
            thirdLine.widthAnchor.constraint(equalTo: mainView.widthAnchor),
            thirdLine.heightAnchor.constraint(equalToConstant: 0.7),
            
            locationTitleLabel.topAnchor.constraint(equalTo: thirdLine.bottomAnchor, constant: 30),
            locationTitleLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 20),
            
            mapView.topAnchor.constraint(equalTo: locationTitleLabel.bottomAnchor, constant: 10),
            mapView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 20),
            mapView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -20),
            mapView.heightAnchor.constraint(equalToConstant: 200),
            
            locationLabel.topAnchor.constraint(equalTo: mapView.bottomAnchor, constant: 10),
            locationLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 20),
            
            bottomView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            bottomView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            bottomView.heightAnchor.constraint(equalToConstant: 100),
            
            bottomButtonStackView.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 20),
            bottomButtonStackView.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 30),
            bottomButtonStackView.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -20),
        ])
    }
    
    // MARK: - Action

    
    @objc func likeButtonTapped() {
        if likeButton.tag == 0 {
            likeButton.setImage(UIImage(systemName: "heart.fill", withConfiguration: likeButtonConfigure), for: .normal)
            likeButton.tintColor = .systemPink
            likeButton.tag = 1
        } else {
            likeButton.setImage(UIImage(systemName: "heart", withConfiguration: likeButtonConfigure), for: .normal)
            likeButton.tintColor = .lightGray
            likeButton.tag = 0
        }
    }

}
