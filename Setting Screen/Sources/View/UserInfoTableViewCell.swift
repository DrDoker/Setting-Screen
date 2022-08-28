//
//  UserInfoTableViewCell.swift
//  Setting Screen
//
//  Created by Serhii  on 29/08/2022.
//

import UIKit

class UserInfoTableViewCell: UITableViewCell {

    var userInfoCell: Setting? {
        didSet {
            icon.image = userInfoCell?.icon
            title.text = userInfoCell?.title
            additionalText.text = userInfoCell?.additionalText
        }
    }

    //MARK: - Outlets

    private lazy var icon: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 35
        return imageView
    }()

    private lazy var title: UILabel = {
        let lable = UILabel()
        lable.textColor = .black
        lable.font = UIFont.systemFont(ofSize: 24, weight: .regular)
        return lable
    }()

    private lazy var additionalText: UILabel = {
        let lable = UILabel()
        lable.textColor = .black
        lable.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        lable.numberOfLines = 2
        return lable
    }()

    private lazy var textStack: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .fill
        stack.axis = .vertical
        stack.distribution = .fill
        stack.spacing = 4
        return stack
    }()

    //MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup

    private func setupHierarchy() {
        contentView.addSubview(icon)
        contentView.addSubview(textStack)

        textStack.addArrangedSubview(title)
        textStack.addArrangedSubview(additionalText)
    }

    private func setupLayout() {
        icon.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.left.equalTo(contentView).offset(15)
            make.height.equalTo(70)
            make.width.equalTo(70)
        }

        textStack.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.left.equalTo(icon.snp.right).offset(20)
            make.right.equalTo(contentView).offset(-20)
        }
    }

    // MARK: - Reuse

    override func prepareForReuse() {
        super.prepareForReuse()
        self.accessoryType = .none
        self.userInfoCell = nil
    }
}
