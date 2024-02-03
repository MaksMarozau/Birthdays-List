
protocol AddNewInfoPresenterProtocol {
    
    
}



final class AddNewInfoPresenter: AddNewInfoPresenterProtocol {
    
    private let view: AddNewInfoViewInputProtocol
    
    init(view: AddNewInfoViewInputProtocol) {
        self.view = view
    }
}
