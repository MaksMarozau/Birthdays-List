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

    unowned let view: AddNewInfoViewInputProtocol
    
    
//MARK: - Initialization

    init(view: AddNewInfoViewInputProtocol) {
        self.view = view
    }
    
    
//MARK: - Localization for text by title
            
    private func locText(by key: String) -> String {
        let text = NSLocalizedString(key, comment: "")
        return text
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
        let alert = UIAlertController(title: locText(by: "Empty"), message: locText(by: "Empty message"), preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: locText(by: "OK"), style: .cancel))
        view.errorsNotification(with: alert)
    }
    
    func failedSaveError(with error: String) {
        let alert = UIAlertController(title: locText(by: "Save failed"), message: error, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: locText(by: "Cancel"), style: .cancel))
        view.errorsNotification(with: alert)
    }
}
