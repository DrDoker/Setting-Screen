//
//  FamilyInfoTableViewCell.swift
//  Setting Screen
//
//  Created by Serhii  on 29/08/2022.
//

import UIKit

class FamilyInfoTableViewCell: UITableViewCell {

    var settingCell: Setting? {
        didSet {
            title.text = settingCell?.title
        }
    }

    //MARK: - Outlets

    private lazy var firstIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "family1")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 18
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 1
        return imageView
    }()

    private lazy var secondIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "family2")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 18
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 1
        return imageView
    }()

    private lazy var title: UILabel = {
        let lable = UILabel()
        lable.textColor = .black
        return lable
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
        contentView.addSubview(title)
        contentView.addSubview(firstIcon)
        contentView.addSubview(secondIcon)
    }

    private func setupLayout() {
        firstIcon.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.left.equalTo(contentView).offset(15)
            make.height.width.equalTo(35)
        }

        secondIcon.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.left.equalTo(firstIcon).offset(30)
            make.height.width.equalTo(35)
        }

        title.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.left.equalTo(secondIcon.snp.right).offset(25)
            make.right.equalTo(contentView).offset(-20)
        }
    }

    // MARK: - Reuse

    override func prepareForReuse() {
        super.prepareForReuse()
        self.accessoryType = .none
        self.settingCell = nil
    }

    // MARK: - Func

    func setIcons(first: UIImage, second: UIImage) {
        firstIcon.image = first
        secondIcon.image = second
    }
}
