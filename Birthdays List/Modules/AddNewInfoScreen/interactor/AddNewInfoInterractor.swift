import Foundation

//MARK: - Protocol for extention AddNewInfoInterractor to event processing

protocol AddNewInfoInterractorInputProtocol {
    
    func saveButtonTapped(name: String?, surname: String?, date: Date)
}


//MARK: - Final class AddNewInfoInterractor

final class AddNewInfoInterractor {
    
    
//MARK: - Properties of class

    private let presenter: AddNewInfoPresenterProtocol
    
    
//MARK: - Initialization
    
    init(presenter: AddNewInfoPresenterProtocol) {
        self.presenter = presenter
    }
    
    
//MARK: - Methods of class
    
    func saveData(name: String, surname: String, date: Date) {
        
        let result = CoreDataManager.instance.saveData(name: name, surname: surname, date: date)
        switch result {
        case .success(_):
            print("saved")
        case .failure(let failure):
            print(failure)
            presenter.failedSaveError(with: "\(failure)")
        }
    }
}
    

//MARK: - Implemendation of AddNewInfoInterractorInputProtocol protocol for AddNewInfoInterractor class
    
extension AddNewInfoInterractor: AddNewInfoInterractorInputProtocol {
    
    func saveButtonTapped(name: String?, surname: String?, date: Date) {
        
        guard let name, let surname else { return }
        if !name.isEmpty && !surname.isEmpty {
            saveData(name: name, surname: surname, date: date)
            presenter.clearFields()
        } else {
            print("Data is empty")
            presenter.emptyFieldError()
        }
    }
}
