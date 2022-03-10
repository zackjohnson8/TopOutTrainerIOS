//
// Created by Zachary Johnson on 3/9/22.
//
import UIKit

class MainNavigationBar {

    var title: String!
    var rightBarButtonItem: UIBarButtonItem!
    var largeTitleDisplayMode:  UINavigationItem.LargeTitleDisplayMode!

    init(title: String!, rightBarButtonItem: UIBarButtonItem!, largeTitleDisplayMode: UINavigationItem.LargeTitleDisplayMode) {
        self.title = title
        self.rightBarButtonItem = rightBarButtonItem
        self.largeTitleDisplayMode = largeTitleDisplayMode
    }
}
