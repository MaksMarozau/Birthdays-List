import UIKit

//MARK: - Final class MainLIstTableViewCell

final class MainLIstTableViewCell: UITableViewCell {

    
//MARK: - Properties of class
    
    private let visualeffectView = UIView()
    private let globalContainerView = UIView()
    private let leftContainerView = UIView()
    private let rightContainerView = UIView()
    
    private let fullNameVerticalStackview = UIStackView()
    private let nameLabel = UILabel()
    private let surnameLabel = UILabel()
    private let birthdayDateLabel = UILabel()
    
    
    
//MARK: - Initializators
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubviews()
        setConstraintes()
        configureUI()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
//MARK: - Adding of subviews
    
    private func addSubviews() {
        
        contentView.addSubviews(with: visualeffectView, globalContainerView)
        globalContainerView.addSubviews(with: leftContainerView, rightContainerView)
        
        leftContainerView.addSubview(fullNameVerticalStackview)
        fullNameVerticalStackview.addArrangedSubviews(with: nameLabel, surnameLabel)
        
        rightContainerView.addSubview(birthdayDateLabel)
    }
    

    
//MARK: - Setting of constraintes
    
    private func setConstraintes() {
        
        visualeffectView.translatesAutoresizingMaskIntoConstraints = false
        visualeffectView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12).isActive = true
        visualeffectView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5).isActive = true
        visualeffectView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5).isActive = true
        visualeffectView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        
        globalContainerView.translatesAutoresizingMaskIntoConstraints = false
        globalContainerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 13).isActive = true
        globalContainerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 6).isActive = true
        globalContainerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -9).isActive = true
        globalContainerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4).isActive = true
        
        
        leftContainerView.translatesAutoresizingMaskIntoConstraints = false
        leftContainerView.topAnchor.constraint(equalTo: globalContainerView.topAnchor).isActive = true
        leftContainerView.leadingAnchor.constraint(equalTo: globalContainerView.leadingAnchor,constant: 12).isActive = true
        leftContainerView.bottomAnchor.constraint(equalTo: globalContainerView.bottomAnchor).isActive = true
        leftContainerView.widthAnchor.constraint(equalTo: globalContainerView.widthAnchor, multiplier: 0.4).isActive = true
        
        
        rightContainerView.translatesAutoresizingMaskIntoConstraints = false
        rightContainerView.topAnchor.constraint(equalTo: globalContainerView.topAnchor).isActive = true
        rightContainerView.leadingAnchor.constraint(equalTo: leftContainerView.trailingAnchor).isActive = true
        rightContainerView.trailingAnchor.constraint(equalTo: globalContainerView.trailingAnchor, constant: -12).isActive = true
        rightContainerView.bottomAnchor.constraint(equalTo: globalContainerView.bottomAnchor).isActive = true

        
        fullNameVerticalStackview.translatesAutoresizingMaskIntoConstraints = false
        fullNameVerticalStackview.centerYAnchor.constraint(equalTo: leftContainerView.centerYAnchor).isActive = true
        fullNameVerticalStackview.heightAnchor.constraint(equalTo: leftContainerView.heightAnchor, multiplier: 0.7).isActive = true
        fullNameVerticalStackview.widthAnchor.constraint(equalTo: leftContainerView.widthAnchor, multiplier: 1).isActive = true
        
        
        birthdayDateLabel.translatesAutoresizingMaskIntoConstraints = false
        birthdayDateLabel.centerYAnchor.constraint(equalTo: rightContainerView.centerYAnchor).isActive = true
        birthdayDateLabel.centerXAnchor.constraint(equalTo: rightContainerView.centerXAnchor).isActive = true
        birthdayDateLabel.heightAnchor.constraint(equalTo: rightContainerView.heightAnchor, multiplier: 0.5).isActive = true
        birthdayDateLabel.widthAnchor.constraint(equalTo: rightContainerView.widthAnchor, multiplier: 0.9).isActive = true
    }
    
    
    
//MARK: - Configuration of User Interface

    private func configureUI() {
        
        contentView.backgroundColor = .clear
        
        visualeffectView.backgroundColor = .visualEffect
        visualeffectView.layer.cornerRadius = 12
        visualeffectView.layer.borderColor = UIColor.black.cgColor
        visualeffectView.layer.borderWidth = 1
        
        globalContainerView.backgroundColor = .backgroundSub
        globalContainerView.layer.cornerRadius = 12
        
        leftContainerView.backgroundColor = .clear
        rightContainerView.backgroundColor = .clear
        
        fullNameVerticalStackview.axis = .vertical
        fullNameVerticalStackview.distribution = .fillEqually
        
        nameLabel.textAlignment = .center
        nameLabel.font = UIFont(name: "MuktaMahee Bold", size: 23)
        nameLabel.textColor = .fontMain
        
        surnameLabel.textAlignment = .center
        surnameLabel.font = UIFont(name: "MuktaMahee Bold", size: 23)
        surnameLabel.textColor = .fontMain
        
        birthdayDateLabel.textAlignment = .center
        birthdayDateLabel.font = UIFont(name: "MuktaMahee Regular", size: 26)
        birthdayDateLabel.textColor = .fontMain
    }
    
    
    
//MARK: - getting and setting of data to fill in (public)
    
    func setData(name: String, surname: String, date: Date) {
        
        nameLabel.text = name
        
        surnameLabel.text = surname
        
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMMM yyyy"
        let dateStr = formatter.string(from: date)
        birthdayDateLabel.text = dateStr
    }
}
