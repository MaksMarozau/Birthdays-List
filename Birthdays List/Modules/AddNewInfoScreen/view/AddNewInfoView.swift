import UIKit

//MARK: - Protocol for extention AddNewInfoView with MVP-archetecture's methods

protocol AddNewInfoViewInputProtocol: AnyObject {
    
}



//MARK: - Final class AddNewInfoView

final class AddNewInfoView: UIViewController {
    
    
//MARK: - Properties of class
    
    
    
    
    
//MARK: - Lifecycle of controller
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setConstraintes()
        configureUI()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        configureNavigationBar()
    }
    
    
    
//MARK: - Configurations of Navigation bar
    
    private func configureNavigationBar() {
        
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "New Info"
    }
    
    
    
//MARK: - Setting of constraintes
    
    private func setConstraintes() {
        
        
    }
    
    
    
//MARK: - Configuration of User Interface
    
    private func configureUI() {
        
        view.backgroundColor = .backgroundMain
        
    }
}
    


//MARK: - Extention Extention for AddNewInfoView with protocol AddNewInfoViewInputProtocol

extension AddNewInfoView: AddNewInfoViewInputProtocol {
    
    
}
