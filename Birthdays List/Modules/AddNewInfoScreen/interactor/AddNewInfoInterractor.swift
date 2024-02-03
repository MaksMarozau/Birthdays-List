import Foundation

protocol AddNewInfoInterractorInputProtocol {
    
    func getData(name: String?, surname: String?, date: Date)
}



final class AddNewInfoInterractor: AddNewInfoInterractorInputProtocol {
   
    private let presenter: AddNewInfoPresenterProtocol
    
    init(presenter: AddNewInfoPresenterProtocol) {
        self.presenter = presenter
    }
    
    
    func getData(name: String?, surname: String?, date: Date) {
        
        guard let name, let surname else { return }
        if !name.isEmpty && !surname.isEmpty {
            let result = CoreDataManager.instance.saveData(name: name, surname: surname, date: date)
            switch result {
            case .success(_):
                print("saved")
            case .failure(let failure):
                print(failure)
            }
        } else {
            print("Data is empty")
        }
    }
}
