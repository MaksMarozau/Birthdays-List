//MARK: - Protocol for extention MainListPresenter to date getting and processing

protocol MainListPresenterInputProtocol {
    
    func getData(with data: [Birthday])
}


//MARK: - Final class MainListPresenter

final class MainListPresenter {
    
    
//MARK: - Properties of class

    unowned let view: MainListViewInputProtocol
    
    
//MARK: - Initialization

    init(view: MainListViewInputProtocol) {
        self.view = view
    }
}


//MARK: - Implemendation of MainListPresenterInputProtocol protocol for MainListPresenter class

extension MainListPresenter: MainListPresenterInputProtocol {
    
    func getData(with data: [Birthday]) {
        
        view.updateData(with: data)
    }
}
