import UIKit

//MARK: - Protocol for extention MainListView with MVP-archetecture's methods

protocol MainListViewInputProtocol: AnyObject {
    
}



//MARK: - Final class MainListView

final class MainListView: UIViewController {
    
    
//MARK: - Properties of class
    
    private let tableView = UITableView()
    
    
    
    
    
//MARK: - Lifecycle of controller
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(tableView)
        
        setConstraintes()
        configureUI()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        configureNavigationBar()
        //                viewWillStart()
    }
    
    
    
//MARK: - Configurations of Navigation bar
    
    private func configureNavigationBar() {
        
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Birthdays List"
        
        navigationController?.topViewController?.navigationItem.rightBarButtonItem = UIBarButtonItem(systemItem: .add, primaryAction: UIAction(handler: { _ in
        
        }))
        
        navigationController?.topViewController?.navigationItem.leftBarButtonItem = UIBarButtonItem(systemItem: .trash, primaryAction: UIAction(handler: { _ in
            
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
        tableView.rowHeight = 160
        tableView.separatorStyle = .none
    }
    
    
    
//MARK: - Works out before view will start
    
    private func viewWillStart() {
        //                presenter.loadData()
    }
}



//MARK: - Extention for MainScreenView with protocols UITableView

extension MainListView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return UITableViewCell()
    }
    
    
    
    
}


//MARK: - Extention Extention for MainListView with protocol MainListViewInputProtocol

extension MainListView: MainListViewInputProtocol {
    
    
}