import UIKit

/** The application's root `Coordinator`. */

final class AppCoordinator: PresentationCoordinator {
    
    var childCoordinators: [Coordinator] = []
    var rootViewController = AppRootViewController()
    
    init(window: UIWindow) {
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }
    
    func start() {
        let statsCoordinator = StatsViewCoordinator()
        addChildCoordinator(statsCoordinator)
        statsCoordinator.start()
        rootViewController.set(childViewController: statsCoordinator.rootViewController)
    }
    
}
