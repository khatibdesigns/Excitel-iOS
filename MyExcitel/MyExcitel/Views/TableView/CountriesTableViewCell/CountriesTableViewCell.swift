//
//  CountriesTableViewCell.swift
//  MyExcitel
//
//  Created by Nader Alkatib on 12.02.23.
//

import UIKit
import SDWebImage

class CountriesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var dataLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    
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
            self.iconImageView.contentMode = .scaleAspectFit
            self.iconImageView.sd_setImage(with:  URL(string: "\(data.flag ?? "")"), placeholderImage:  UIImage(named: "Icon_placeholder")) { (image, _, _, _) in
                let scaledImage = resizeImage(image: image ?? UIImage(named: "Icon_placeholder")!, targetSize: self.iconImageView.frame.size)
                self.iconImageView.image = scaledImage
            }
            self.dataLabel.text! = "\(data.name ?? "")"
        }
    }
}
