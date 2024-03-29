import UIKit

//MARK: - Protocol for extention MainListView with MVP-archetecture's methods

protocol MainListViewInputProtocol: AnyObject {
    
    func updateData(with data: [Birthday])
    func updateData()
}



//MARK: - Final class MainListView

final class MainListView: UIViewController {
    
    
//MARK: - Properties of class
    
    var interactor: MainListInteractorInputProtocol!
    var router: MainListRouterInputProtocol!
    
    private let tableView = UITableView()
    
    private var birthdays: [Birthday] = []
    
    
    
//MARK: - Lifecycle of controller
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(MainLIstTableViewCell.self, forCellReuseIdentifier: "MainLIstTableViewCell")
        
        view.addSubview(tableView)
        
        setConstraintes()
        configureUI()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        configureNavigationBar()
        viewWillStart()
    }
    
    
    
//MARK: - Configurations of Navigation bar
    
    private func configureNavigationBar() {
        
        navigationController?.navigationBar.prefersLargeTitles = true
        title = locText(by: "List Title")
        navigationController?.topViewController?.navigationItem.rightBarButtonItem = UIBarButtonItem(systemItem: .add, primaryAction: UIAction(handler: { _ in
            self.router.moveToAddingInfo()
        }))
        navigationController?.topViewController?.navigationItem.rightBarButtonItem?.tintColor = UIColor.visualEffect
        
        navigationController?.topViewController?.navigationItem.leftBarButtonItem = UIBarButtonItem(systemItem: .trash, primaryAction: UIAction(handler: { _ in
            self.tableView.isEditing.toggle()
        }))
        navigationController?.topViewController?.navigationItem.leftBarButtonItem?.tintColor = UIColor.red
    }
    
    
    
//MARK: - Setting of constraintes
    
    private func setConstraintes() {
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 22).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    
    
//MARK: - Configuration of User Interface
    
    private func configureUI() {
        
        view.backgroundColor = .backgroundMain
        
        tableView.backgroundColor = .clear
        tableView.rowHeight = 140
        tableView.separatorStyle = .none
    }
    
    
    
//MARK: - Works out before view will start
    
    private func viewWillStart() {
        interactor.loadData()
    }
    
    
    
//MARK: - Localization for text by title
    
    private func locText(by key: String) -> String {
        let text = NSLocalizedString(key, comment: "")
        return text
    }
}



//MARK: - Extention for MainScreenView with protocols UITableView

extension MainListView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return birthdays.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let birthday = birthdays[indexPath.row]
        
        let name = birthday.name ?? ""
        let surname = birthday.surname ?? ""
        let date = birthday.date ?? .now
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MainLIstTableViewCell", for: indexPath) as? MainLIstTableViewCell else { return UITableViewCell() }
        
        cell.backgroundColor = .clear
        cell.selectionStyle = .default
        
        cell.setData(name: name, surname: surname, date: date)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        let alert = UIAlertController(title: locText(by: "Delete"), message: locText(by: "Delete message"), preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: locText(by: "Yes"), style: .destructive, handler: { _ in
            let object = self.birthdays.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .left)
            self.interactor.deleteData(of: object)
        }))
        alert.addAction(UIAlertAction(title: locText(by: "No"), style: .cancel))
        present(alert, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let birthday = birthdays.remove(at: sourceIndexPath.row)
        birthdays.insert(birthday, at: destinationIndexPath.row)
    }
}



//MARK: - Extention Extention for MainListView with protocol MainListViewInputProtocol

extension MainListView: MainListViewInputProtocol {

    func updateData(with data: [Birthday]) {
        birthdays = data
        tableView.reloadData()
    }
    
    
    func updateData() {
        tableView.reloadData()
    }
}
