import UIKit

//MARK: - Protocol for extention AddNewInfoView with VIP-Clean-archetecture's methods

protocol AddNewInfoViewInputProtocol: AnyObject {
    
    func reloadFieldsData(with name: String, _ surname: String)
    func errorsNotification(with controller: UIViewController)
}



//MARK: - Final class AddNewInfoView

final class AddNewInfoView: UIViewController {
    
    
//MARK: - Properties of class
    
    var interactor: AddNewInfoInterractorInputProtocol!
    var router: AddNewInfoRouterInputProtocol!
    
    private let containerView = UIView()
    private let saveButton = UIButton()
    
    private let verticalStackView = UIStackView()
    private let birthdayDataPicker = UIDatePicker()

    private let titleLabel = UILabel()
    private let nameTextField = UITextField()
    private let surnameTextField = UITextField()
    
    private var date = Date()
    
    
    
//MARK: - Lifecycle of controller
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()
        setConstraintes()
        configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        configureNavigationBar()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        setCircleCornerRadius()
    }
    
    
    
//MARK: - Configurations of Navigation bar
    
    private func configureNavigationBar() {
        
        navigationController?.navigationBar.prefersLargeTitles = true
        title = locText(by: "New title")
        navigationController?.topViewController?.navigationItem.leftBarButtonItem?.tintColor = .visualEffect
    }
    
    
    
//MARK: - Adding of subviews
    
    private func addSubviews() {
        
        view.addSubviews(with: containerView, saveButton)
        containerView.addSubviews(with: verticalStackView, birthdayDataPicker)
        verticalStackView.addArrangedSubviews(with: titleLabel, nameTextField, surnameTextField)
    }
    
    
    
//MARK: - Setting of constraintes
    
    private func setConstraintes() {
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 21).isActive = true
        containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12).isActive = true
        containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12).isActive = true
        containerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.43).isActive = true
        
        
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -12).isActive = true
        saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12).isActive = true
        saveButton.widthAnchor.constraint(equalToConstant: 85).isActive = true
        saveButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        verticalStackView.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        verticalStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10).isActive = true
        verticalStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10).isActive = true
        verticalStackView.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 0.49).isActive = true
        
        
        birthdayDataPicker.translatesAutoresizingMaskIntoConstraints = false
        birthdayDataPicker.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        birthdayDataPicker.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        birthdayDataPicker.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        birthdayDataPicker.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 0.49).isActive = true
    }
    
    
    
//MARK: - Configuration of User Interface
    
    private func configureUI() {
        
        view.backgroundColor = .backgroundMain
        
        saveButton.backgroundColor = .backgroundField
        saveButton.setTitle(locText(by: "Save"), for: .normal)
        saveButton.setTitleColor(.fontMain, for: .normal)
        saveButton.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        saveButton.layer.borderWidth = 1
        saveButton.layer.borderColor = UIColor.visualEffect.cgColor
        saveButton.addTarget(self, action: #selector(saveTapped), for: .touchUpInside)
        
        verticalStackView.axis = .vertical
        verticalStackView.distribution = .fillEqually
        verticalStackView.spacing = 25
        
        titleLabel.textAlignment = .center
        titleLabel.textColor = .fontMain
        titleLabel.font = UIFont(name: "MuktaMahee Bold", size: 23)
        titleLabel.text = locText(by: "Enter info")
        
        nameTextField.backgroundColor = .backgroundField
        nameTextField.borderStyle = .bezel
        nameTextField.layer.borderWidth = 1
        nameTextField.layer.borderColor = UIColor.visualEffect.cgColor
        nameTextField.textAlignment = .center
        nameTextField.textColor = .fontMain
        nameTextField.placeholder = locText(by: "Name")
        
        surnameTextField.backgroundColor = .backgroundField
        surnameTextField.borderStyle = .bezel
        surnameTextField.layer.borderWidth = 1
        surnameTextField.layer.borderColor = UIColor.visualEffect.cgColor
        surnameTextField.textAlignment = .center
        surnameTextField.textColor = .fontMain
        surnameTextField.placeholder = locText(by: "Surname")
        
        birthdayDataPicker.datePickerMode = .date
        birthdayDataPicker.preferredDatePickerStyle = .wheels
        birthdayDataPicker.date = .now
        birthdayDataPicker.maximumDate = .now
        birthdayDataPicker.addTarget(self, action: #selector(dateChoose), for: .valueChanged)
    }
    
    
    private func setCircleCornerRadius() {
        
        nameTextField.layer.cornerRadius = nameTextField.frame.height / 2
        nameTextField.clipsToBounds = true
        
        surnameTextField.layer.cornerRadius = nameTextField.frame.height / 2
        surnameTextField.clipsToBounds = true
        
        saveButton.layer.cornerRadius = nameTextField.frame.height / 2
        saveButton.clipsToBounds = true
    }
    
    
    
//MARK: - Actions
    
    @objc private func dateChoose(_ sender: UIDatePicker) {
        self.date = sender.date
    }
    
    @objc private func saveTapped() {
        let name = nameTextField.text
        let surname = surnameTextField.text
        let birthdayDate = date
        interactor.saveButtonTapped(name: name, surname: surname, date: birthdayDate)
    }
    
    
    
//MARK: - Localization for text by title
        
    private func locText(by key: String) -> String {
        let text = NSLocalizedString(key, comment: "")
        return text
    }
}



//MARK: - Extention for AddNewInfoView with protocol AddNewInfoViewInputProtocol to event processing

extension AddNewInfoView: AddNewInfoViewInputProtocol {
  
 func reloadFieldsData(with name: String, _ surname: String) {
        nameTextField.text = name
        surnameTextField.text = surname
        
        UIView.animate(withDuration: 0.3) {
            let alert = UIAlertController(title: self.locText(by: "Saved"), message: nil, preferredStyle: .alert)
            self.present(alert, animated: false)
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                alert.dismiss(animated: false)
            }
        }
    }
    
    
    func errorsNotification(with controller: UIViewController) {
        present(controller, animated: true)
    }
}
