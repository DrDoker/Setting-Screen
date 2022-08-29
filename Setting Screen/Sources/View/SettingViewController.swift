//
//  ViewController.swift
//  Setting Screen
//
//  Created by Serhii  on 28/08/2022.
//

import UIKit
import SnapKit

class SettingViewController: UIViewController {

    private var settingCells: [[Setting]]?

    // MARK: - Outlets

    private lazy var searchTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Поиск"
        textField.clipsToBounds = true
        textField.layer.cornerRadius = 10
        textField.backgroundColor = .systemGray5
        textField.tintColor = .systemGray
        textField.setLeftIcon(UIImage(systemName: "magnifyingglass"))
        textField.clearButtonMode = UITextField.ViewMode.whileEditing
        return textField
    }()

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.register(StandartTableViewCell.self, forCellReuseIdentifier: "standartCell")
        tableView.register(UserInfoTableViewCell.self, forCellReuseIdentifier: "userInfoCell")
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
        view.addSubview(searchTextField)
        view.addSubview(tableView)
    }

    private func setupLayout() {

        searchTextField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.left.equalTo(view).offset(20)
            make.right.equalTo(view).offset(-20)
            make.height.equalTo(40)
        }

        tableView.snp.makeConstraints { make in
            make.top.equalTo(searchTextField.snp.bottom)
            make.left.right.bottom.equalTo(view)
        }
    }

    // MARK: - Actions


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
            return 44
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
            let detailViewController = DetailViewController()
            detailViewController.settingCell = settingCells?[indexPath.section][indexPath.row]
            navigationController?.pushViewController(detailViewController, animated: true)
        }
    }

    private func configureCell(cell: Setting, indexPath: IndexPath) -> UITableViewCell {
        switch cell.type {
        case .userInfo:
            let userInfoCell = tableView.dequeueReusableCell(withIdentifier: "userInfoCell") as? UserInfoTableViewCell
            guard let userInfoCell = userInfoCell else { return UITableViewCell() }
            userInfoCell.userInfoCell = settingCells?[indexPath.section][indexPath.row]
            userInfoCell.accessoryType = .disclosureIndicator
            return userInfoCell
        case .familyInfo:
            return UITableViewCell()
        case .standart:
            let standartCell = tableView.dequeueReusableCell(withIdentifier: "standartCell") as? StandartTableViewCell
            guard let standartCell = standartCell else { return UITableViewCell() }
            standartCell.settingCell = settingCells?[indexPath.section][indexPath.row]
            standartCell.accessoryType = .disclosureIndicator
            return standartCell
        case .cellWithSwitch:
            let standartCell = tableView.dequeueReusableCell(withIdentifier: "standartCell") as? StandartTableViewCell
            guard let standartCell = standartCell else { return UITableViewCell() }
            standartCell.settingCell = settingCells?[indexPath.section][indexPath.row]
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
