//
// Created by Zachary Johnson on 3/9/22.
//
import UIKit

class MainNavigationRightBarButtonItem: UIBarButtonItem {

    override init() {
        super.init()
        self.image = UIImage(systemName: "person.crop.circle")
        self.style = .plain
        self.target = self
        self.action = #selector(tappedRightBarButton)
        self.tintColor = .systemBlue
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    @objc private func tappedRightBarButton()
    {
        // Add a dropdown menu of account options
        print("Right NavBar User Icon Clicked")
    }
}
