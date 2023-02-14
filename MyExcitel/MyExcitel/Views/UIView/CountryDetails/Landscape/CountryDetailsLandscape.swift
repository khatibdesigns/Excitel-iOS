//
//  CountryDetailsLandscape.swift
//  MyExcitel
//
//  Created by Nader Alkatib on 13.02.23.
//

import UIKit
import SDWebImage
import MapKit

class CountryDetailsLandscape: UIView {

    @IBOutlet weak var countryMapView: MKMapView!
    @IBOutlet weak var nameButton: UIButton!
    @IBOutlet weak var regionButton: UIButton!
    @IBOutlet weak var populationButton: UIButton!
    @IBOutlet weak var capitalButton: UIButton!
    @IBOutlet weak var flagButton: UIButton!

    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        
    }
    
    func configureView(country: Countries) {
        self.setLocation(country: country)
        
        self.nameButton.setTitle("\(Strings.Labels.name): \(country.name ?? "")", for: .normal)
        self.regionButton.setTitle("\(Strings.Labels.region): \(country.region ?? "")", for: .normal)
        self.populationButton.setTitle("\(Strings.Labels.population): \(country.population ?? 0)", for: .normal)
        self.capitalButton.setTitle("\(Strings.Labels.capital): \(country.capitalName ?? "")", for: .normal)
        
        self.flagButton.setTitle("\(Strings.Labels.flag):", for: .normal)
        self.flagButton.setContentHuggingPriority(.defaultHigh, for: .vertical)
        self.flagButton.isUserInteractionEnabled = false
        self.flagButton.contentMode = .scaleAspectFit
        self.flagButton.semanticContentAttribute = .forceRightToLeft
        self.flagButton.sd_setImage(with:  URL(string:  "\(country.flag ?? "")"), for: .normal, placeholderImage:  UIImage(named: "Icon_placeholder")) { (image, _, _, _) in
            let scaledImage = resizeImage(image: image ?? UIImage(named: "Icon_placeholder")!, targetSize: CGSize(width: 28, height: 28))
            self.flagButton.setImage(scaledImage, for: .normal)
        }
    }
    private func setLocation(country: Countries) {
        let capital = "\(country.capitalName ?? ""), \(country.name ?? "")"
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(capital) { (placemarks, error) in
            if let error = error {
                print("Geocode failed with error: \(error)")
                return
            }
            
            if let placemark = placemarks?.first {
                let location = placemark.location!
                let region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 10000, longitudinalMeters: 10000)
                self.countryMapView.setRegion(region, animated: true)
                
                let annotation = MKPointAnnotation()
                annotation.coordinate = location.coordinate
                annotation.title = capital
                self.countryMapView.addAnnotation(annotation)
            }
        }
    }
}
