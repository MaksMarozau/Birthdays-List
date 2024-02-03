import UIKit

protocol AddNewInfoRouterInputProtocol {
    
    
}



final class AddNewInfoRouter: AddNewInfoRouterInputProtocol {
    
    private let navigationController: UINavigationController
    private let window: UIWindow
    
    init(navigationController: UINavigationController, window: UIWindow) {
        self.navigationController = navigationController
        self.window = window
        
        
    }
}
