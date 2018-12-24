//
//  ViewController.swift
//  deselect
//
//  Created by kemchenj on 2018/12/23.
//  Copyright © 2018 kemchenj. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    let barTintColor = UIColor.random()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        tableView.deselectRowIfNeeded(with: transitionCoordinator, animated: true)
        setupBarTintColor()
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(ViewController(), animated: true)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "\(indexPath)"
        return cell
    }

    func setupBarTintColor() {
        if let coordinator = transitionCoordinator {
            let originBarTintColor = navigationController?.navigationBar.barTintColor
            coordinator.animate(
                alongsideTransition: { _ in
                    self.navigationController?.navigationBar.barTintColor = self.barTintColor
                },
                completion: { context in
                    if context.isCancelled, context.viewController(forKey: .to) == self {
                        self.navigationController?.navigationBar.barTintColor = originBarTintColor
                    }
                }
            )
        } else {
            self.navigationController?.navigationBar.barTintColor = self.barTintColor
        }
    }
}
