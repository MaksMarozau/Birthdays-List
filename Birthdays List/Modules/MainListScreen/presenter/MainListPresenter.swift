protocol MainListPresenterProtocol {
    
}


final class MainListPresenter: MainListPresenterProtocol {
    
    unowned let view: MainListViewInputProtocol
    
    init(view: MainListViewInputProtocol) {
        self.view = view
    }
}
