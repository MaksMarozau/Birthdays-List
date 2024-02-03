import UIKit

protocol AddNewInfoRouterInputProtocol {
    
    
}



final class AddNewInfoRouter: AddNewInfoRouterInputProtocol {
    
    private let navigationController: UINavigationController
    private let window: UIWindow
    
    init(navigationController: UINavigationController, window: UIWindow) {
        self.navigationController = navigationController
        self.window = window
        
        let view = AddNewInfoView()
        let presenter = AddNewInfoPresenter(view: view)
        let interactor = AddNewInfoInterractor(presenter: presenter)
        let router = self
        
        view.interactor = interactor
        view.router = router
        
        navigationController.pushViewController(view, animated: true)
    }
}
