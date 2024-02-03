import Foundation

protocol AddNewInfoInterractorInputProtocol {
    
    func saveButtonTapped(name: String?, surname: String?, date: Date)
}



final class AddNewInfoInterractor {
    
    private let presenter: AddNewInfoPresenterProtocol
    
    init(presenter: AddNewInfoPresenterProtocol) {
        self.presenter = presenter
    }
    
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
    


//MARK: - Extension
    
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
