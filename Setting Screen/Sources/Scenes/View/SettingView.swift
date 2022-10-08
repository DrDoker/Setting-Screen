//
//  SettingView.swift
//  Setting Screen
//
//  Created by Serhii  on 04/10/2022.
//

import UIKit
import SnapKit

class SettingView: UIView {

    // MARK: - Outlets

    lazy var search: UISearchController = {
        let search = UISearchController()
        search.searchBar.placeholder = "Поиск"
        return search
    }()

    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.register(StandartTableViewCell.self, forCellReuseIdentifier: StandartTableViewCell.identifier)
        tableView.register(UserInfoTableViewCell.self, forCellReuseIdentifier: UserInfoTableViewCell.identifier)
        tableView.register(FamilyInfoTableViewCell.self, forCellReuseIdentifier: FamilyInfoTableViewCell.identifier)
        return tableView
    }()

    //MARK: - Initializers

    init() {
        super.init(frame: .zero)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        backgroundColor = .systemGray6
        setupHierarchy()
        setupLayout()
    }

    // MARK: - Setup

    private func setupHierarchy() {
        addSubview(tableView)
    }

    private func setupLayout() {
        tableView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalTo(self)
        }
    }
}
