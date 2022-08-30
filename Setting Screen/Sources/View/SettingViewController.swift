//
//  SettingViewController.swift
//  Setting Screen
//
//  Created by Serhii  on 28/08/2022.
//

import UIKit
import SnapKit

class SettingViewController: UIViewController {

    private var settingCells: [[Setting]]?

    // MARK: - Outlets

    private lazy var search: UISearchController = {
        let search = UISearchController()
        search.searchBar.placeholder = "Поиск"
        return search
    }()

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.register(StandartTableViewCell.self, forCellReuseIdentifier: StandartTableViewCell.identifier)
        tableView.register(UserInfoTableViewCell.self, forCellReuseIdentifier: UserInfoTableViewCell.identifier)
        tableView.register(FamilyInfoTableViewCell.self, forCellReuseIdentifier: FamilyInfoTableViewCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()

    // MARK: - Lifecycle

    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Настройки"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .systemGray6
        setupHierarchy()
        setupLayout()

        settingCells = Setting.settingCells
    }

    // MARK: - Setup

    private func setupHierarchy() {
        navigationItem.searchController = search
        view.addSubview(tableView)
    }

    private func setupLayout() {
        tableView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalTo(view)
        }
    }
}

extension SettingViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return settingCells?.count ?? 0
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingCells?[section].count ?? 0
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let cellType = settingCells?[indexPath.section][indexPath.row].type else { return 44 }

        switch cellType {
        case .userInfo:
            return 90
        case .familyInfo:
            return 48
        case .standart, .cellWithSwitch:
            return 44
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = settingCells?[indexPath.section][indexPath.row] else { return UITableViewCell() }
        return configureCell(cell: cell, indexPath: indexPath)
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let cell = settingCells?[indexPath.section][indexPath.row] else { return }
        print("Вы нажали \(cell.title)")

        switch cell.type {
        case .cellWithSwitch:
            return
        case .userInfo, .familyInfo, .standart:
            let settingCell = settingCells?[indexPath.section][indexPath.row]
            let detailViewController = DetailViewController(settingCell: settingCell)
            navigationController?.pushViewController(detailViewController, animated: true)
        }
    }

    private func configureCell(cell: Setting, indexPath: IndexPath) -> UITableViewCell {
        let settingCells = settingCells?[indexPath.section][indexPath.row]

        switch cell.type {
        case .userInfo:
            let userInfoCell = tableView.dequeueReusableCell(withIdentifier: UserInfoTableViewCell.identifier) as? UserInfoTableViewCell
            guard let userInfoCell = userInfoCell else { return UITableViewCell() }
            userInfoCell.userInfoCell = settingCells
            userInfoCell.accessoryType = .disclosureIndicator
            return userInfoCell
        case .familyInfo:
            let familyInfoCell = tableView.dequeueReusableCell(withIdentifier: FamilyInfoTableViewCell.identifier) as? FamilyInfoTableViewCell
            guard let familyInfoCell = familyInfoCell else { return UITableViewCell() }
            familyInfoCell.settingCell = settingCells
            familyInfoCell.setIcons(first: UIImage(named: "anna1"), second: UIImage(named: "anna2"))
            familyInfoCell.accessoryType = .disclosureIndicator
            return familyInfoCell
        case .standart:
            let standartCell = tableView.dequeueReusableCell(withIdentifier: StandartTableViewCell.identifier) as? StandartTableViewCell
            guard let standartCell = standartCell else { return UITableViewCell() }
            standartCell.settingCell = settingCells
            standartCell.accessoryType = .disclosureIndicator
            return standartCell
        case .cellWithSwitch:
            let standartCell = tableView.dequeueReusableCell(withIdentifier: StandartTableViewCell.identifier) as? StandartTableViewCell
            guard let standartCell = standartCell else { return UITableViewCell() }
            standartCell.settingCell = settingCells
            standartCell.selectionStyle = .none
            return standartCell
        }
    }
}

extension UITextField {
    func setLeftIcon(_ image: UIImage?) {
        let iconView = UIImageView(frame: CGRect(x: 5, y: 0, width: 20, height: 20))
        iconView.image = image
        let iconContainerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 20))
        iconContainerView.addSubview(iconView)
        leftView = iconContainerView
        leftViewMode = .always
    }
}
