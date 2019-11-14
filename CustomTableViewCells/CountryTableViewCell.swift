import UIKit

class CountryTableViewCell: UITableViewCell {
    
    // MARK:- IBOutlets
    
    @IBOutlet var countryNameLabel: UILabel!
    @IBOutlet var countryImageView: UIImageView!
    @IBOutlet var countryDescriptionLabel: UILabel!
    
    // MARK:- Internal Methods
    
    func setup(with country: Country) {
        countryNameLabel.text = country.name
        countryImageView.image = UIImage(named: country.imageName)
        countryDescriptionLabel.text = country.description
    }
}
