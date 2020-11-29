//
//  MenuViewController.swift
//  DeliveryClubUIApp
//
//  Created by Aleksei Smirnov on 29.10.2020.
//

import SwiftUI

final class MenuViewController: UIViewController {

    private enum Row: String, CaseIterable {
        case colors = "Colors"
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
        switch Row.allCases[indexPath.row] {
        case .colors:
            let controller = UIHostingController(rootView: ColorsView())
            controller.title = Row.allCases[indexPath.row].rawValue
            navigationController?.pushViewController(controller, animated: true)
        }
    }
}
