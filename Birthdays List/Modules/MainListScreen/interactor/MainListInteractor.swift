protocol MainListInteractorProtocol {
    
}

final class MainListInteractor: MainListInteractorProtocol {
    
    let presenter: MainListPresenterProtocol
    
    init(presenter: MainListPresenterProtocol) {
        self.presenter = presenter
    }
}
