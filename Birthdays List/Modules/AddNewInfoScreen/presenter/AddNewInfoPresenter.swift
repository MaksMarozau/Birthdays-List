import UIKit.UIAlertController

//MARK: - Protocol for extention AddNewInfoPresenter to react to the eventes

protocol AddNewInfoPresenterProtocol {
    
    func clearFields()
    func emptyFieldError()
    func failedSaveError(with error: String)
}


//MARK: - Final class AddNewInfoPresenter

final class AddNewInfoPresenter {

    
//MARK: - Properties of class

    private let view: AddNewInfoViewInputProtocol
    
    
//MARK: - Initialization

    init(view: AddNewInfoViewInputProtocol) {
        self.view = view
    }
}


//MARK: - Implemendation of AddNewInfoPresenterProtocol protocol for AddNewInfoPresenter class

extension AddNewInfoPresenter: AddNewInfoPresenterProtocol {

    func clearFields() {
        let name = ""
        let surname = ""
        view.reloadFieldsData(with: name, surname)
    }
    
    func emptyFieldError() {
        let alert = UIAlertController(title: "Field is empty", message: "Every field must be fill in", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel))
        view.errorsNotification(with: alert)
    }
    
    func failedSaveError(with error: String) {
        let alert = UIAlertController(title: "Save was failed", message: error, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        view.errorsNotification(with: alert)
    }
}
