//
//  DetailsViewController.swift
//  MyExcitel
//
//  Created by Nader Alkatib on 13.02.23.
//

import UIKit

class DetailsViewController: UIViewController, Storyboarded {
    
    // MARK: Variables
    var viewModel: DetailsViewModel!
    private var data: Countries!
    private var portraitView: CountryDetailsPortrait = .fromNib()
    private var landscapeView: CountryDetailsLandscape = .fromNib()
    
    // MARK: Outlets
    @IBOutlet weak var holderView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.setupViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.viewModel.ready()
    }
    
    private func setupUI() {
        if UIDevice.current.orientation.isLandscape {
            self.addView(view: landscapeView, in: self.holderView)
        } else {
            self.addView(view: portraitView, in: self.holderView)
        }
    }
    
    private func setupViewModel() {
        self.viewModel.didUpdate = { [weak self] country in
            guard let strongSelf = self else { return }
            strongSelf.data = country
            strongSelf.title = "\(country.name ?? "")"
            strongSelf.portraitView.configureView(country: strongSelf.data)
            strongSelf.landscapeView.configureView(country: strongSelf.data)
            
            strongSelf.setupUI()
        }
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        self.setupUI()
    }
}
