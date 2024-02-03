import UIKit.UIAlertController

protocol AddNewInfoPresenterProtocol {
    
    func clearFields()
    func emptyFieldError()
    func failedSaveError(with error: String)
}



final class AddNewInfoPresenter {

    private let view: AddNewInfoViewInputProtocol
    
    init(view: AddNewInfoViewInputProtocol) {
        self.view = view
    }
}



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
