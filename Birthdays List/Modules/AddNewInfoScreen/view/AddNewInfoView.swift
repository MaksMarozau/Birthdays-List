import UIKit

//MARK: - Protocol for extention AddNewInfoView with MVP-archetecture's methods

protocol AddNewInfoViewInputProtocol: AnyObject {
    
}



//MARK: - Final class AddNewInfoView

final class AddNewInfoView: UIViewController {
    
    
//MARK: - Properties of class
    
    private let containerView = UIView()
    private let saveButton = UIButton()
    
    private let verticalStackView = UIStackView()
    private let birthdayDataPicker = UIDatePicker()

    private let titleLabel = UILabel()
    private let nameTextField = UITextField()
    private let surnameTextField = UITextField()
    
    
    
//MARK: - Lifecycle of controller
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubviews(with: containerView, saveButton)
        containerView.addSubviews(with: verticalStackView, birthdayDataPicker)
        verticalStackView.addArrangedSubviews(with: titleLabel, nameTextField, surnameTextField)
        
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
        title = "New Info"
        navigationController?.topViewController?.navigationItem.leftBarButtonItem?.tintColor = .visualEffect
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
        saveButton.setTitle("Save", for: .normal)
        saveButton.setTitleColor(.fontMain, for: .normal)
        saveButton.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        saveButton.layer.borderWidth = 1
        saveButton.layer.borderColor = UIColor.visualEffect.cgColor
        
        verticalStackView.axis = .vertical
        verticalStackView.distribution = .fillEqually
        verticalStackView.spacing = 25
        
        titleLabel.textAlignment = .center
        titleLabel.textColor = .fontMain
        titleLabel.font = UIFont(name: "MuktaMahee Bold", size: 23)
        titleLabel.text = "Enter some information below:"
        
        nameTextField.backgroundColor = .backgroundField
        nameTextField.borderStyle = .bezel
        nameTextField.layer.borderWidth = 1
        nameTextField.layer.borderColor = UIColor.visualEffect.cgColor
        nameTextField.textAlignment = .center
        nameTextField.textColor = .fontMain
        nameTextField.placeholder = "Name"
        
        surnameTextField.backgroundColor = .backgroundField
        surnameTextField.borderStyle = .bezel
        surnameTextField.layer.borderWidth = 1
        surnameTextField.layer.borderColor = UIColor.visualEffect.cgColor
        surnameTextField.textAlignment = .center
        surnameTextField.textColor = .fontMain
        surnameTextField.placeholder = "Surname"
        
        birthdayDataPicker.datePickerMode = .date
        birthdayDataPicker.preferredDatePickerStyle = .wheels
        birthdayDataPicker.date = .now
        birthdayDataPicker.maximumDate = .now
    }
    
    
    private func setCircleCornerRadius() {
        
        nameTextField.layer.cornerRadius = nameTextField.frame.height / 2
        nameTextField.clipsToBounds = true
        
        surnameTextField.layer.cornerRadius = nameTextField.frame.height / 2
        surnameTextField.clipsToBounds = true
        
        saveButton.layer.cornerRadius = nameTextField.frame.height / 2
        saveButton.clipsToBounds = true
    }
}
 


//MARK: - Extention Extention for AddNewInfoView with protocol AddNewInfoViewInputProtocol

extension AddNewInfoView: AddNewInfoViewInputProtocol {
    
    
}
