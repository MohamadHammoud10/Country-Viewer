//
//  DetailsViewController.swift
//  CountryViewer
//
//  Created by Mohamad Hammoud on 13/05/2025.
//

import UIKit

class DetailsViewController: UIViewController {

    // Variable to hold the flag image url
    var flagImageURL: String?
    // Variable to hold the country name
    var countryName: String?
    // Variable to hold the country official name
    var countryOfficialName: String?
    // Variable to hold the country capital city
    var countryCapitalCity: String?
    // Variable to hold the country region
    var countryRegion: String?
    // Variable to hold the country languages
    var countryLanguages: [String]?
    // Variable to hold the country currency name
    var countryCurrencyName: String?
    // Variable to hold the country currency symbol
    var countryCurrencySymbol: String?
    
    // Initialize the flagImageView
    let flagImageView = UIImageView()
    // Initialize the countryNameLabel
    let countryNameLabel = UILabel()
    // Initialize the countryFullNameTitle
    let countryFullNameTitle = UILabel()
    // Initialize the scrollView to hold the countryFullNameLabel to allow scrolling
    let countryFullNameScrollView = UIScrollView()
    // Initialize the countryFullNameLabel
    let countryFullNameLabel = UILabel()
    // Initialize the countryCapitalTitle
    let countryCapitalTitle = UILabel()
    // Initialize the scrollView to hold the countryCapitalLabel to allow scrolling
    let countryCapitalScrollView = UIScrollView()
    // Initialize the countryCapitalLabel
    let countryCapitalLabel = UILabel()
    // Initialize the countryRegionTitle
    let countryRegionTitle = UILabel()
    // Initialize the scrollView to hold the countryRegionLabel to allow scrolling
    let countryRegionScrollView = UIScrollView()
    // Initialize the countryRegionLabel
    let countryRegionLabel = UILabel()
    // Initialize the countryLanguagesTitle
    let countryLanguagesTitle = UILabel()
    // Initialize the scrollView to hold the countryLanguagesLabel to allow scrolling
    let countryLanguagesScrollView = UIScrollView()
    // Initialize the countryLanguagesLabel
    let countryLanguagesLabel = UILabel()
    // Initialize the countryCurrencyNameTitle
    let countryCurrencyNameTitle = UILabel()
    // Initialize the scrollView to hold the countryCurrencyNameLabel to allow scrolling
    let countryCurrencyNameScrollView = UIScrollView()
    // Initialize the countryCurrencyNameLabel
    let countryCurrencyNameLabel = UILabel()
    // Initialize the countryCurrencySymbolTitle
    let countryCurrencySymbolTitle = UILabel()
    // Initialize the scrollView to hold the countryCurrencySymbolLabel to allow scrolling
    let countryCurrencySymbolScrollView = UIScrollView()
    // Initialize the countryCurrencySymbolLabel
    let countryCurrencySymbolLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up and configure the view
        setUpView()
    }

    // Function to set up and configure the flagImageView
    func setUpFlagImageView() {
        // Set the content mode
        flagImageView.contentMode = .scaleAspectFill
        
        // Display the flag image from the url
        let url = URL(string: flagImageURL!)
        DispatchQueue.main.async {
            let data = try? Data(contentsOf: url!)
            
            if let imageData = data {
                let image = UIImage(data: imageData)
                self.flagImageView.image = image
                return
            }
        }
        
        view.addSubview(flagImageView)
    }
    
    // Function to set up and configure the countryNameLabel
    func setUpCountryNameLabel() {
        // Set the text
        countryNameLabel.text = countryName
        // Set the font size
        countryNameLabel.font = .systemFont(ofSize: 25, weight: .bold)
        // Set the font color:
        countryNameLabel.textColor = .black
        
        view.addSubview(countryNameLabel)
    }
    
    // Function to set up and configure the countryFullNameTitle
    func setUpCountryFullNameTitle() {
        // Set the text
        countryFullNameTitle.text = "Full Name:"
        // Set the font size
        countryFullNameTitle.font = .systemFont(ofSize: 18, weight: .bold)
        // Set the text alignment
        countryFullNameTitle.textAlignment = .center
        // Set the font color:
        countryFullNameTitle.textColor = .black
        
        view.addSubview(countryFullNameTitle)
    }
    
    // Function to set up and configure the countryFullNameScrollView
    func setUpCountryFullNameScrollView() {
        // Enable scrolling
        countryFullNameScrollView.isScrollEnabled = true
        // Set the content size
        countryFullNameScrollView.contentSize = CGSize(width: 1000, height: 40)
        countryFullNameScrollView.layoutIfNeeded()
        
        view.addSubview(countryFullNameScrollView)
    }
    
    // Function to set up and configure the countryFullNameLabel
    func setUpCountryFullNameLabel() {
        // Set the text
        countryFullNameLabel.text = countryOfficialName
        // Set the font size
        countryFullNameLabel.font = .systemFont(ofSize: 18, weight: .regular)
        // Set the text alignment
        countryFullNameLabel.textAlignment = .center
        // Set the font color:
        countryFullNameLabel.textColor = .white
        // Set the number of lines
        countryFullNameLabel.numberOfLines = 0
        
        countryFullNameScrollView.addSubview(countryFullNameLabel)
    }
    
    // Function to set up and configure the countryCapitalTitle
    func setUpCountryCapitalTitle() {
        // Set the text
        countryCapitalTitle.text = "Capital City:"
        // Set the font size
        countryCapitalTitle.font = .systemFont(ofSize: 18, weight: .bold)
        // Set the text alignment
        countryCapitalTitle.textAlignment = .center
        // Set the font color:
        countryCapitalTitle.textColor = .black
        
        view.addSubview(countryCapitalTitle)
    }
    
    // Function to set up and configure the countryCapitalcrollView
    func setUpCountryCapitalScrollView() {
        // Enable scrolling
        countryCapitalScrollView.isScrollEnabled = true
        // Set the content size
        countryCapitalScrollView.contentSize = CGSize(width: 1000, height: 40)
        countryCapitalScrollView.layoutIfNeeded()
        
        view.addSubview(countryCapitalScrollView)
    }
    
    // Function to set up and configure the countryCapitalLabel
    func setUpCountryCapitalLabel() {
        // Set the text
        countryCapitalLabel.text = countryCapitalCity
        // Set the font size
        countryCapitalLabel.font = .systemFont(ofSize: 18, weight: .regular)
        // Set the text alignment
        countryCapitalLabel.textAlignment = .center
        // Set the font color:
        countryCapitalLabel.textColor = .white
        // Set the number of lines
        countryCapitalLabel.numberOfLines = 0
        
        countryCapitalScrollView.addSubview(countryCapitalLabel)
    }
    
    // Function to set up and configure the countryRegionTitle
    func setUpCountryRegionTitle() {
        // Set the text
        countryRegionTitle.text = "Region:"
        // Set the font size
        countryRegionTitle.font = .systemFont(ofSize: 18, weight: .bold)
        // Set the text alignment
        countryRegionTitle.textAlignment = .center
        // Set the font color:
        countryRegionTitle.textColor = .black
        
        view.addSubview(countryRegionTitle)
    }
    
    // Function to set up and configure the countryRegionScrollView
    func setUpCountryRegionScrollView() {
        // Enable scrolling
        countryRegionScrollView.isScrollEnabled = true
        // Set the content size
        countryRegionScrollView.contentSize = CGSize(width: 1000, height: 40)
        countryRegionScrollView.layoutIfNeeded()
        
        view.addSubview(countryRegionScrollView)
    }
    
    // Function to set up and configure the countryRegionLabel
    func setUpCountryRegionLabel() {
        // Set the text
        countryRegionLabel.text = countryRegion
        // Set the font size
        countryRegionLabel.font = .systemFont(ofSize: 18, weight: .regular)
        // Set the text alignment
        countryRegionLabel.textAlignment = .center
        // Set the font color:
        countryRegionLabel.textColor = .white
        // Set the number of lines
        countryRegionLabel.numberOfLines = 0
        
        countryRegionScrollView.addSubview(countryRegionLabel)
    }
    
    // Function to set up and configure the countryLanguagesTitle
    func setUpCountrylanguagesTitle() {
        // Set the text
        countryLanguagesTitle.text = "Languages:"
        // Set the font size
        countryLanguagesTitle.font = .systemFont(ofSize: 18, weight: .bold)
        // Set the text alignment
        countryLanguagesTitle.textAlignment = .center
        // Set the font color:
        countryLanguagesTitle.textColor = .black
        
        view.addSubview(countryLanguagesTitle)
    }
    
    // Function to set up and configure the countryLanguagesScrollView
    func setUpCountryLanguagesScrollView() {
        // Enable scrolling
        countryLanguagesScrollView.isScrollEnabled = true
        // Set the content size
        countryLanguagesScrollView.contentSize = CGSize(width: 1000, height: 40)
        countryLanguagesScrollView.layoutIfNeeded()
        
        view.addSubview(countryLanguagesScrollView)
    }
    
    // Function to set up and configure the countryLanguagesLabel
    func setUpCountryLanguagesLabel() {
        // Set the text
        countryLanguagesLabel.text = countryLanguages?.joined(separator: ", ")
        // Set the font size
        countryLanguagesLabel.font = .systemFont(ofSize: 18, weight: .regular)
        // Set the text alignment
        countryLanguagesLabel.textAlignment = .center
        // Set the font color:
        countryLanguagesLabel.textColor = .white
        // Set the number of lines
        countryLanguagesLabel.numberOfLines = 0
        
        
        countryLanguagesScrollView.addSubview(countryLanguagesLabel)
    }
    
    // Function to set up and configure the countryCurrencyeNameTitle
    func setUpCountryCurrencyNameTitle() {
        // Set the text
        countryCurrencyNameTitle.text = "Currency:"
        // Set the font size
        countryCurrencyNameTitle.font = .systemFont(ofSize: 18, weight: .bold)
        // Set the text alignment
        countryCurrencyNameTitle.textAlignment = .center
        // Set the font color:
        countryCurrencyNameTitle.textColor = .black
        
        view.addSubview(countryCurrencyNameTitle)
    }
    
    // Function to set up and configure the countryCurrencyNameScrollView
    func setUpCountryCurrencyNameScrollView() {
        // Enable scrolling
        countryCurrencyNameScrollView.isScrollEnabled = true
        // Set the content size
        countryCurrencyNameScrollView.contentSize = CGSize(width: 1000, height: 40)
        countryCurrencyNameScrollView.layoutIfNeeded()
        
        view.addSubview(countryCurrencyNameScrollView)
    }
    
    // Function to set up and configure the countryCurrencyNameLabel
    func setUpCountryCurrencyNameLabel() {
        // Set the text
        countryCurrencyNameLabel.text = countryCurrencyName
        // Set the font size
        countryCurrencyNameLabel.font = .systemFont(ofSize: 18, weight: .regular)
        // Set the text alignment
        countryCurrencyNameLabel.textAlignment = .center
        // Set the font color:
        countryCurrencyNameLabel.textColor = .white
        // Set the number of lines
        countryCurrencyNameLabel.numberOfLines = 0
        
        countryCurrencyNameScrollView.addSubview(countryCurrencyNameLabel)
    }
    
    // Function to set up and configure the countryCurrencySymbolTitle
    func setUpCountryCurrencySymbolTitle() {
        // Set the text
        countryCurrencySymbolTitle.text = "Currency Symbol:"
        // Set the font size
        countryCurrencySymbolTitle.font = .systemFont(ofSize: 18, weight: .bold)
        // Set the text alignment
        countryCurrencySymbolTitle.textAlignment = .center
        // Set the font color:
        countryCurrencySymbolTitle.textColor = .black
        
        view.addSubview(countryCurrencySymbolTitle)
    }
    
    // Function to set up and configure the countryCurrencySymbolScrollView
    func setUpCountryCurrencySymbolScrollView() {
        // Enable scrolling
        countryCurrencySymbolScrollView.isScrollEnabled = true
        // Set the content size
        countryCurrencySymbolScrollView.contentSize = CGSize(width: 1000, height: 40)
        countryCurrencySymbolScrollView.layoutIfNeeded()
        
        view.addSubview(countryCurrencySymbolScrollView)
    }
    
    // Function to set up and configure the countryCurrencySymbolLabel
    func setUpCountryCurrencySymbolLabel() {
        // Set the text
        countryCurrencySymbolLabel.text = countryCurrencySymbol
        // Set the font size
        countryCurrencySymbolLabel.font = .systemFont(ofSize: 18, weight: .regular)
        // Set the text alignment
        countryCurrencySymbolLabel.textAlignment = .center
        // Set the font color:
        countryCurrencySymbolLabel.textColor = .white
        // Set the number of lines
        countryCurrencySymbolLabel.numberOfLines = 0
        
        countryCurrencySymbolScrollView.addSubview(countryCurrencySymbolLabel)
    }
    
    // Function to set up and configure the view
    func setUpView() {
        // Set the background color of the view
        view.backgroundColor = .lightGray
        
        // Set up and configure the UI elements
        setUpFlagImageView()
        setUpCountryNameLabel()
        setUpCountryFullNameTitle()
        setUpCountryFullNameScrollView()
        setUpCountryFullNameLabel()
        setUpCountryCapitalTitle()
        setUpCountryCapitalScrollView()
        setUpCountryCapitalLabel()
        setUpCountryRegionTitle()
        setUpCountryRegionScrollView()
        setUpCountryRegionLabel()
        setUpCountrylanguagesTitle()
        setUpCountryLanguagesScrollView()
        setUpCountryLanguagesLabel()
        setUpCountryCurrencyNameTitle()
        setUpCountryCurrencyNameScrollView()
        setUpCountryCurrencyNameLabel()
        setUpCountryCurrencySymbolTitle()
        setUpCountryCurrencySymbolScrollView()
        setUpCountryCurrencySymbolLabel()
        
        // Set the constraints
        setUpConstraints()
        
        // Draw the vertical line
        drawVerticalLine()
    }
    
    // Function to set up the constraints
    func setUpConstraints() {
        flagImageView.translatesAutoresizingMaskIntoConstraints = false
        countryNameLabel.translatesAutoresizingMaskIntoConstraints = false
        countryFullNameTitle.translatesAutoresizingMaskIntoConstraints = false
        countryFullNameScrollView.translatesAutoresizingMaskIntoConstraints = false
        countryFullNameLabel.translatesAutoresizingMaskIntoConstraints = false
        countryCapitalTitle.translatesAutoresizingMaskIntoConstraints = false
        countryCapitalScrollView.translatesAutoresizingMaskIntoConstraints = false
        countryCapitalLabel.translatesAutoresizingMaskIntoConstraints = false
        countryRegionTitle.translatesAutoresizingMaskIntoConstraints = false
        countryRegionScrollView.translatesAutoresizingMaskIntoConstraints = false
        countryRegionLabel.translatesAutoresizingMaskIntoConstraints = false
        countryLanguagesTitle.translatesAutoresizingMaskIntoConstraints = false
        countryLanguagesScrollView.translatesAutoresizingMaskIntoConstraints = false
        countryLanguagesLabel.translatesAutoresizingMaskIntoConstraints = false
        countryCurrencyNameTitle.translatesAutoresizingMaskIntoConstraints = false
        countryCurrencyNameScrollView.translatesAutoresizingMaskIntoConstraints = false
        countryCurrencyNameLabel.translatesAutoresizingMaskIntoConstraints = false
        countryCurrencySymbolTitle.translatesAutoresizingMaskIntoConstraints = false
        countryCurrencySymbolScrollView.translatesAutoresizingMaskIntoConstraints = false
        countryCurrencySymbolLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            flagImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            flagImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            flagImageView.widthAnchor.constraint(equalToConstant: 100),
            flagImageView.heightAnchor.constraint(equalToConstant: 100),
            
            countryNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            countryNameLabel.topAnchor.constraint(equalTo: flagImageView.bottomAnchor, constant: 10),
            
            countryFullNameTitle.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            countryFullNameTitle.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            countryFullNameTitle.topAnchor.constraint(equalTo: countryNameLabel.bottomAnchor, constant: 20),
            countryFullNameTitle.heightAnchor.constraint(equalToConstant: 40),
            
            countryFullNameScrollView.leadingAnchor.constraint(equalTo: countryFullNameTitle.leadingAnchor),
            countryFullNameScrollView.trailingAnchor.constraint(equalTo: countryFullNameTitle.trailingAnchor),
            countryFullNameScrollView.topAnchor.constraint(equalTo: countryFullNameTitle.bottomAnchor, constant: 10),
            countryFullNameScrollView.heightAnchor.constraint(equalToConstant: 40),

            countryFullNameLabel.leadingAnchor.constraint(equalTo: countryFullNameScrollView.leadingAnchor),
            countryFullNameLabel.trailingAnchor.constraint(equalTo: countryFullNameScrollView.trailingAnchor),
            countryFullNameLabel.centerXAnchor.constraint(equalTo: countryFullNameScrollView.centerXAnchor),
            countryFullNameLabel.centerYAnchor.constraint(equalTo: countryFullNameScrollView.centerYAnchor),
            
            countryCapitalTitle.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            countryCapitalTitle.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            countryCapitalTitle.topAnchor.constraint(equalTo: countryNameLabel.bottomAnchor, constant: 20),
            countryCapitalTitle.heightAnchor.constraint(equalToConstant: 40),
            
            countryCapitalScrollView.leadingAnchor.constraint(equalTo: countryCapitalTitle.leadingAnchor),
            countryCapitalScrollView.trailingAnchor.constraint(equalTo: countryCapitalTitle.trailingAnchor),
            countryCapitalScrollView.topAnchor.constraint(equalTo: countryCapitalTitle.bottomAnchor, constant: 10),
            countryCapitalScrollView.heightAnchor.constraint(equalToConstant: 40),
            
            countryCapitalLabel.leadingAnchor.constraint(equalTo: countryCapitalScrollView.leadingAnchor),
            countryCapitalLabel.trailingAnchor.constraint(equalTo: countryCapitalScrollView.trailingAnchor),
            countryCapitalLabel.centerXAnchor.constraint(equalTo: countryCapitalScrollView.centerXAnchor),
            countryCapitalLabel.centerYAnchor.constraint(equalTo: countryCapitalScrollView.centerYAnchor),
            
            countryRegionTitle.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            countryRegionTitle.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            countryRegionTitle.topAnchor.constraint(equalTo: countryFullNameScrollView.bottomAnchor, constant: 20),
            countryRegionTitle.heightAnchor.constraint(equalToConstant: 40),
            
            countryRegionScrollView.leadingAnchor.constraint(equalTo: countryRegionTitle.leadingAnchor),
            countryRegionScrollView.trailingAnchor.constraint(equalTo: countryRegionTitle.trailingAnchor),
            countryRegionScrollView.topAnchor.constraint(equalTo: countryRegionTitle.bottomAnchor, constant: 10),
            countryRegionScrollView.heightAnchor.constraint(equalToConstant: 40),
            
            countryRegionLabel.leadingAnchor.constraint(equalTo: countryRegionScrollView.leadingAnchor),
            countryRegionLabel.trailingAnchor.constraint(equalTo: countryRegionScrollView.trailingAnchor),
            countryRegionLabel.centerXAnchor.constraint(equalTo: countryRegionScrollView.centerXAnchor),
            countryRegionLabel.centerYAnchor.constraint(equalTo: countryRegionScrollView.centerYAnchor),
            
            countryLanguagesTitle.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            countryLanguagesTitle.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            countryLanguagesTitle.topAnchor.constraint(equalTo: countryCapitalScrollView.bottomAnchor, constant: 20),
            countryLanguagesTitle.heightAnchor.constraint(equalToConstant: 40),
            
            countryLanguagesScrollView.leadingAnchor.constraint(equalTo: countryLanguagesTitle.leadingAnchor),
            countryLanguagesScrollView.trailingAnchor.constraint(equalTo: countryLanguagesTitle.trailingAnchor),
            countryLanguagesScrollView.topAnchor.constraint(equalTo: countryLanguagesTitle.bottomAnchor, constant: 10),
            countryLanguagesScrollView.heightAnchor.constraint(equalToConstant: 40),
            
            countryLanguagesLabel.leadingAnchor.constraint(equalTo: countryLanguagesScrollView.leadingAnchor),
            countryLanguagesLabel.trailingAnchor.constraint(equalTo: countryLanguagesScrollView.trailingAnchor),
            countryLanguagesLabel.centerXAnchor.constraint(equalTo: countryLanguagesScrollView.centerXAnchor),
            countryLanguagesLabel.centerYAnchor.constraint(equalTo: countryLanguagesScrollView.centerYAnchor),
            
            countryCurrencyNameTitle.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            countryCurrencyNameTitle.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            countryCurrencyNameTitle.topAnchor.constraint(equalTo: countryRegionScrollView.bottomAnchor, constant: 20),
            countryCurrencyNameTitle.heightAnchor.constraint(equalToConstant: 40),
            
            countryCurrencyNameScrollView.leadingAnchor.constraint(equalTo: countryCurrencyNameTitle.leadingAnchor),
            countryCurrencyNameScrollView.trailingAnchor.constraint(equalTo: countryCurrencyNameTitle.trailingAnchor),
            countryCurrencyNameScrollView.topAnchor.constraint(equalTo: countryCurrencyNameTitle.bottomAnchor, constant: 10),
            countryCurrencyNameScrollView.heightAnchor.constraint(equalToConstant: 40),
            
            countryCurrencyNameLabel.leadingAnchor.constraint(equalTo: countryCurrencyNameScrollView.leadingAnchor),
            countryCurrencyNameLabel.trailingAnchor.constraint(equalTo: countryCurrencyNameScrollView.trailingAnchor),
            countryCurrencyNameLabel.centerXAnchor.constraint(equalTo: countryCurrencyNameScrollView.centerXAnchor),
            countryCurrencyNameLabel.centerYAnchor.constraint(equalTo: countryCurrencyNameScrollView.centerYAnchor),
            
            countryCurrencySymbolTitle.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            countryCurrencySymbolTitle.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            countryCurrencySymbolTitle.topAnchor.constraint(equalTo: countryLanguagesScrollView.bottomAnchor, constant: 20),
            countryCurrencySymbolTitle.heightAnchor.constraint(equalToConstant: 40),
            
            countryCurrencySymbolScrollView.leadingAnchor.constraint(equalTo: countryCurrencySymbolTitle.leadingAnchor),
            countryCurrencySymbolScrollView.trailingAnchor.constraint(equalTo: countryCurrencySymbolTitle.trailingAnchor),
            countryCurrencySymbolScrollView.topAnchor.constraint(equalTo: countryCurrencySymbolTitle.bottomAnchor, constant: 10),
            countryCurrencySymbolScrollView.heightAnchor.constraint(equalToConstant: 40),
            
            countryCurrencySymbolLabel.leadingAnchor.constraint(equalTo: countryCurrencySymbolScrollView.leadingAnchor),
            countryCurrencySymbolLabel.trailingAnchor.constraint(equalTo: countryCurrencySymbolScrollView.trailingAnchor),
            countryCurrencySymbolLabel.centerXAnchor.constraint(equalTo: countryCurrencySymbolScrollView.centerXAnchor),
            countryCurrencySymbolLabel.centerYAnchor.constraint(equalTo: countryCurrencySymbolScrollView.centerYAnchor)
        ])
    }
    
    // Function that draws a vertical line in the center of the cell
    func drawVerticalLine() {
        let caLayer = CAShapeLayer()
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: (self.view.frame.origin.x + (self.view.frame.width)/2), y: 190))
        bezierPath.addLine(to: CGPoint(x: (self.view.frame.origin.x + (self.view.frame.width)/2), y: 480))
        caLayer.path = bezierPath.cgPath
        caLayer.strokeColor = UIColor.black.cgColor
        caLayer.lineWidth = 1
        self.view.layer.addSublayer(caLayer)
    }
    
}
