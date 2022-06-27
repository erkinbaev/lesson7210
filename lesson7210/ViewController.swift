
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var personTableView: UITableView!
    
    var addButton = UIButton()
    
    var persons: [PersonModel] = [
        PersonModel(name: "Kuban", image: UIImage(named: "1")!),
        PersonModel(name: "Aidar", image: UIImage(named: "2")!),
        PersonModel(name: "Nursultan", image: UIImage(named: "3")!),
        PersonModel(name: "Sasha", image: UIImage(named: "1")!),
        PersonModel(name: "Sevara", image: UIImage(named: "2")!),
        PersonModel(name: "Meder", image: UIImage(named: "3")!),
        PersonModel(name: "Mirdin", image: UIImage(named: "1")!),
        PersonModel(name: "Azamat", image: UIImage(named: "2")!),
        PersonModel(name: "Orozbek", image: UIImage(named: "3")!),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        personTableView.dataSource = self
        personTableView.delegate = self
        
        addButton.backgroundColor = .blue
        addButton.setTitle("+", for: .normal)
        addButton.layer.cornerRadius = 100 / 2
        addButton.addTarget(self, action: #selector(addPerson), for: .touchUpInside)
        
        view.addSubview(addButton)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        
        addButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
        addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
        addButton.heightAnchor.constraint(equalToConstant: 100).isActive = true
        addButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    @objc func addPerson() {
        persons.insert(PersonModel(name: "New Person", image: UIImage(systemName: "person")!), at: 0)
        print(dump(persons))
        personTableView.reloadData()
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personCell", for: indexPath) as! PersonCell
        cell.personName.text = persons[indexPath.row].name
        cell.personImageView.image = persons[indexPath.row].image
      //  cell.backgroundColor = .cyan
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row), \(persons[indexPath.row].name)")
    }
}
