//
//  SettingViewController.swift
//  Setting Screen
//
//  Created by Serhii  on 28/08/2022.
//

import UIKit

final class SettingController: UIViewController {
    private var model: [[Setting]]?

    private var settingView: SettingView? {
        guard isViewLoaded else { return nil }
        return view as? SettingView
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        view = SettingView()
        model = Setting.settingCells
        
        title = "Настройки"
        navigationController?.navigationBar.prefersLargeTitles = true
        configTable()
        setupNavigationBar()
    }
}

extension SettingController {
    func setupNavigationBar() {
        navigationItem.searchController = settingView?.search
    }
}

extension SettingController {
    func configTable() {
        settingView?.tableView.dataSource = self
        settingView?.tableView.delegate = self
    }
}

extension SettingController: UITableViewDelegate, UITableViewDataSource  {
    func numberOfSections(in tableView: UITableView) -> Int {
        return model?.count ?? 0
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model?[section].count ?? 0
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let cellType = model?[indexPath.section][indexPath.row].type else { return 44 }

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
        guard let cell = model?[indexPath.section][indexPath.row] else { return UITableViewCell() }

        switch cell.type {
        case .userInfo:
            let userInfoCell = tableView.dequeueReusableCell(withIdentifier: UserInfoTableViewCell.identifier) as? UserInfoTableViewCell
            guard let userInfoCell = userInfoCell else { return UITableViewCell() }
            userInfoCell.userInfoCell = cell
            userInfoCell.accessoryType = .disclosureIndicator
            return userInfoCell
        case .familyInfo:
            let familyInfoCell = tableView.dequeueReusableCell(withIdentifier: FamilyInfoTableViewCell.identifier) as? FamilyInfoTableViewCell
            guard let familyInfoCell = familyInfoCell else { return UITableViewCell() }
            familyInfoCell.settingCell = cell
            familyInfoCell.setIcons(first: UIImage(named: "anna1"), second: UIImage(named: "anna2"))
            familyInfoCell.accessoryType = .disclosureIndicator
            return familyInfoCell
        case .standart:
            let standartCell = tableView.dequeueReusableCell(withIdentifier: StandartTableViewCell.identifier) as? StandartTableViewCell
            guard let standartCell = standartCell else { return UITableViewCell() }
            standartCell.settingCell = cell
            standartCell.accessoryType = .disclosureIndicator
            return standartCell
        case .cellWithSwitch:
            let standartCell = tableView.dequeueReusableCell(withIdentifier: StandartTableViewCell.identifier) as? StandartTableViewCell
            guard let standartCell = standartCell else { return UITableViewCell() }
            standartCell.settingCell = cell
            standartCell.selectionStyle = .none
            return standartCell
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let cell = model?[indexPath.section][indexPath.row] else { return }
        print("Вы нажали \(cell.title)")

        switch cell.type {
        case .cellWithSwitch:
            return
        case .userInfo, .familyInfo, .standart:
            let settingCell = model?[indexPath.section][indexPath.row]
            let detailController = DetailController(settingCell: settingCell)
            navigationController?.pushViewController(detailController, animated: true)
        }
    }
}

