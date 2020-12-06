//
//  MenuViewController.swift
//  WalrusKitExampleApp
//
//  Created by Aleksei Smirnov on 29.10.2020.
//

import SwiftUI

final class MenuViewController: UIViewController {

    private enum Row: String, CaseIterable {
        case colors = "Colors"
        case typography = "Typography"
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Design System"
        let tableView = UITableView(frame: view.frame, style: .insetGrouped)
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension MenuViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
        
        Row.allCases.count
    }

    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = Row.allCases[indexPath.row].rawValue
        cell.textLabel?.font = .boldSystemFont(ofSize: 16)
        cell.accessoryType = .disclosureIndicator
        return cell
    }

    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        let title = Row.allCases[indexPath.row].rawValue
        let viewController: UIViewController
        switch Row.allCases[indexPath.row] {
        case .colors:
            viewController = ColorsViewController()
        case .typography:
            viewController = TypographyViewController()
        }
        viewController.title = title
        navigationController?.pushViewController(viewController, animated: true)
    }
}
