import UIKit


protocol MainListRouterInputProtocol {
    
    func moveToAddingInfo()
}



final class MainListRouter: MainListRouterInputProtocol {
    
    private let navigationController: UINavigationController
    private let window: UIWindow
    
    init(navigationController: UINavigationController, window: UIWindow) {
        self.navigationController = navigationController
        self.window = window
        
        let view = MainListView()
        let presenter = MainListPresenter(view: view)
        let interactor = MainListInteractor(presenter: presenter)
        let router = self
        
        view.interactor = interactor
        view.router = router
        
        navigationController.pushViewController(view, animated: true)
    }
    
    
    
    func moveToAddingInfo() {
        
        let _ = AddNewInfoRouter(navigationController: navigationController, window: window)
    }
}
