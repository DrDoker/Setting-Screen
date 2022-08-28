//
//  ViewController.swift
//  Setting Screen
//
//  Created by Serhii  on 28/08/2022.
//

import UIKit
import SnapKit

class SettingViewController: UIViewController {

    // MARK: - Outlets

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.rowHeight = 50
        return tableView
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupHierarchy()
        setupLayout()

        title = "Настройки"
    }

    // MARK: - Setup

    private func setupHierarchy() {
        view.addSubview(tableView)

    }

    private func setupLayout() {
        tableView.snp.makeConstraints { make in
            make.top.bottom.left.right.equalTo(view)
        }
    }

    // MARK: - Actions


}

extension SettingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        guard let cell = cell else { return UITableViewCell() }
        cell.imageView?.image = UIImage(systemName: "star")
        cell.textLabel?.text = "Test"
        cell.accessoryType = .disclosureIndicator
        return cell
    }

}
