import UIKit

class CountriesViewController: UIViewController {

    // MARK:- IBOutlets
    
    @IBOutlet var countriesTableView: UITableView!
    
    // MARK:- Internal Variables
    
    var countries = [Country]() {
        didSet {
            countriesTableView.reloadData()
        }
    }
    
    // MARK:- Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        loadData()
    }
    
    // MARK:- Private Methods
    
    private func configureTableView() {
        countriesTableView.dataSource = self
        countriesTableView.delegate = self
    }
    
    private func loadData() {
        countries = Country.countries
    }
}

// MARK:- UITableViewDelegate Conformance

extension CountriesViewController: UITableViewDelegate {}

// MARK:- UITableViewDataSource Conformance

extension CountriesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "countryCell", for: indexPath) as? CountryTableViewCell else {
            fatalError("Developer Error: Unexpected class for cell with reuseID countryCell")
        }
        let country = countries[indexPath.row]
        cell.setup(with: country)
        return cell
    }
}

