//
//  UITableView+deselect.swift
//  DeselectRowTheBestWay
//
//  Created by kemchenj on 2018/12/24.
//  Copyright © 2018 kemchenj. All rights reserved.
//

import UIKit

extension UITableView {

    public func deselectRowIfNeeded(with transitionCoordinator: UIViewControllerTransitionCoordinator?, animated: Bool) {
        guard let selectedIndexPath = indexPathForSelectedRow else { return }

        guard let coordinator = transitionCoordinator else {
            self.deselectRow(at: selectedIndexPath, animated: animated)
            return
        }

        coordinator.animate(
            alongsideTransition: { _ in
                self.deselectRow(at: selectedIndexPath, animated: true)
            },
            completion: { context in
                guard context.isCancelled else { return }
                self.selectRow(at: selectedIndexPath, animated: false, scrollPosition: .none)
            }
        )
    }
}
