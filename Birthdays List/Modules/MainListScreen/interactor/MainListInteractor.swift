//MARK: - Protocol for extention MainListInteractor to event processing

protocol MainListInteractorInputProtocol {

    func loadData()
}


//MARK: - Final class MainListInteractor

final class MainListInteractor {
    
    
//MARK: - Properties of class

    let presenter: MainListPresenterInputProtocol
    
    
//MARK: - Initialization

    init(presenter: MainListPresenterInputProtocol) {
        self.presenter = presenter
    }
}


//MARK: - Implemendation of MainListInteractorInputProtocol protocol for MainListInteractor class

extension MainListInteractor: MainListInteractorInputProtocol {
    
    func loadData() {
        
        let result = CoreDataManager.instance.loadData()
        
        switch result {
        case .success(let birthdays):
            presenter.getData(with: birthdays)
        case .failure(let failure):
            print(failure)
        }
    }
}
