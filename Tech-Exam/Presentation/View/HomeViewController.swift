//
//  HomeViewController.swift
//  Tech-Exam
//
//  Created by Mark Angelo Noquera on 7/11/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let homeViewModel = HomeViewModel()

    @IBOutlet private weak var welcomeLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.welcomeLabel.text = "Welcome!"
        self.loadApod()
    }
    
    func loadApod() {
        self.startLoading()
        self.homeViewModel.loadApod { bool in
            self.stopLoading()
            self.loadApod()
        }
    }
    
    func loadApodData() {
        self.titleLabel.text = self.homeViewModel.title
        self.descriptionLabel.text = self.homeViewModel.explanation
    }
}
