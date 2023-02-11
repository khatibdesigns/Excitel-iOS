//
//  CountriesTableViewCell.swift
//  MyExcitel
//
//  Created by Nader Alkatib on 11.02.23.
//

import UIKit
import SDWebImage
import Alamofire

class CountriesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var countryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
        
    }
    
    func configureCell(data: Countries) {
        DispatchQueue.main.async {
            self.iconImageView.sd_setImage(with: URL(string: "\(data.flag ?? "")"), placeholderImage: UIImage(named: "Icon_placeholder"), options: .continueInBackground)
            self.countryLabel.text! = "\(data.capitalName ?? "")"
        }
    }
}
