//
//  RecordTVCell.swift
//  EscapeRooms
//
//  Created by playhong on 2023/04/24.
//

import UIKit

class EscapeHistoryTableViewCell: UITableViewCell {

    static let identifier = "EscapeHistoryTableViewCell"
    
    // MARK: - Properties
    
    var recordData: RecordData? {
        didSet {
            configureCell()
        }
    }
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    private let themeImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private let themeNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    private let escapeTimeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    private lazy var stackView: UIStackView = {
       
        let sv = UIStackView(arrangedSubviews: [dateLabel, themeNameLabel, themeImageView, escapeTimeLabel])
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .horizontal
        sv.alignment = .fill
        sv.distribution = .fill
        return sv
        
    }()

    // MARK: - Life Cycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
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

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Setting
    
    func setupUI() {
        self.backgroundColor = .customBlack
        self.addSubview(stackView)
    }
    
    func setConstraints() {
        let stackViewConstraints = [
            stackView.topAnchor.constraint(equalTo: self.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ]
        NSLayoutConstraint.activate(stackViewConstraints)
    }
    
    func configureCell() {
        let date = recordData?.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd"
        let convertDate = dateFormatter.string(from: date!)
        dateLabel.text = convertDate
        themeNameLabel.text = recordData?.theme
        let minute = recordData?.minute ?? "0"
        let second = recordData?.second ?? "0"
        let escapeTime = "\(minute)분 \(second)초"
        if escapeTime == "분 초" {
            escapeTimeLabel.text = "실패"
            escapeTimeLabel.textColor = .red
        } else {
            escapeTimeLabel.text = escapeTime
            escapeTimeLabel.textColor = .systemBlue
        }
        print("DEBUG: EscapeHistory TableView Cell Configure")
    }
    
    // MARK: - Action

}
