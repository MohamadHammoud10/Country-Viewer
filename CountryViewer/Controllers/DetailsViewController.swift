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
    // Initialize the countryFullNameLabel
    let countryFullNameLabel = UILabel()
    // Initialize the countryCapitalTitle
    let countryCapitalTitle = UILabel()
    // Initialize the countryCapitalLabel
    let countryCapitalLabel = UILabel()
    // Initialize the countryRegionTitle
    let countryRegionTitle = UILabel()
    // Initialize the countryRegionLabel
    let countryRegionLabel = UILabel()
    // Initialize the countryLanguagesTitle
    let countryLanguagesTitle = UILabel()
    // Initialize the countryLanguagesLabel
    let countryLanguagesLabel = UILabel()
    // Initialize the countryCurrencyNameTitle
    let countryCurrencyNameTitle = UILabel()
    // Initialize the countryCurrencyNameLabel
    let countryCurrencyNameLabel = UILabel()
    // Initialize the countryCurrencySymbolTitle
    let countryCurrencySymbolTitle = UILabel()
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
        countryFullNameTitle.textAlignment = .left
        // Set the font color:
        countryFullNameTitle.textColor = .black
        
        view.addSubview(countryFullNameTitle)
    }
    
    // Function to set up and configure the countryFullNameLabel
    func setUpCountryFullNameLabel() {
        // Set the text
        countryFullNameLabel.text = countryOfficialName
        // Set the font size
        countryFullNameLabel.font = .systemFont(ofSize: 18, weight: .regular)
        // Set the text alignment
        countryFullNameLabel.textAlignment = .left
        // Set the font color:
        countryFullNameLabel.textColor = .gray
        
        view.addSubview(countryFullNameLabel)
    }
    
    // Function to set up and configure the countryCapitalTitle
    func setUpCountryCapitalTitle() {
        // Set the text
        countryCapitalTitle.text = "Capital City:"
        // Set the font size
        countryCapitalTitle.font = .systemFont(ofSize: 18, weight: .bold)
        // Set the text alignment
        countryCapitalTitle.textAlignment = .right
        // Set the font color:
        countryCapitalTitle.textColor = .black
        
        view.addSubview(countryCapitalTitle)
    }
    
    // Function to set up and configure the countryCapitalLabel
    func setUpCountryCapitalLabel() {
        // Set the text
        countryCapitalLabel.text = countryCapitalCity
        // Set the font size
        countryCapitalLabel.font = .systemFont(ofSize: 18, weight: .regular)
        // Set the text alignment
        countryCapitalLabel.textAlignment = .right
        // Set the font color:
        countryCapitalLabel.textColor = .gray
        
        view.addSubview(countryCapitalLabel)
    }
    
    // Function to set up and configure the countryRegionTitle
    func setUpCountryRegionTitle() {
        // Set the text
        countryRegionTitle.text = "Region:"
        // Set the font size
        countryRegionTitle.font = .systemFont(ofSize: 18, weight: .bold)
        // Set the text alignment
        countryRegionTitle.textAlignment = .left
        // Set the font color:
        countryRegionTitle.textColor = .black
        
        view.addSubview(countryRegionTitle)
    }
    
    // Function to set up and configure the countryRegionLabel
    func setUpCountryRegionLabel() {
        // Set the text
        countryRegionLabel.text = countryRegion
        // Set the font size
        countryRegionLabel.font = .systemFont(ofSize: 18, weight: .regular)
        // Set the text alignment
        countryRegionLabel.textAlignment = .left
        // Set the font color:
        countryRegionLabel.textColor = .gray
        
        view.addSubview(countryRegionLabel)
    }
    
    // Function to set up and configure the countryLanguagesTitle
    func setUpCountrylanguagesTitle() {
        // Set the text
        countryLanguagesTitle.text = "Languages:"
        // Set the font size
        countryLanguagesTitle.font = .systemFont(ofSize: 18, weight: .bold)
        // Set the text alignment
        countryLanguagesTitle.textAlignment = .right
        // Set the font color:
        countryLanguagesTitle.textColor = .black
        
        view.addSubview(countryLanguagesTitle)
    }
    
    // Function to set up and configure the countryLanguagesLabel
    func setUpCountryLanguagesLabel() {
        // Set the text
        countryLanguagesLabel.text = countryLanguages?.joined(separator: ", ")
        // Set the font size
        countryLanguagesLabel.font = .systemFont(ofSize: 18, weight: .regular)
        // Set the text alignment
        countryLanguagesLabel.textAlignment = .right
        // Set the font color:
        countryLanguagesLabel.textColor = .gray
        
        view.addSubview(countryLanguagesLabel)
    }
    
    // Function to set up and configure the countryCurrencyeNameTitle
    func setUpCountryCurrencyNameTitle() {
        // Set the text
        countryCurrencyNameTitle.text = "Currency:"
        // Set the font size
        countryCurrencyNameTitle.font = .systemFont(ofSize: 18, weight: .bold)
        // Set the text alignment
        countryCurrencyNameTitle.textAlignment = .left
        // Set the font color:
        countryCurrencyNameTitle.textColor = .black
        
        view.addSubview(countryCurrencyNameTitle)
    }
    
    // Function to set up and configure the countryCurrencyNameLabel
    func setUpCountryCurrencyNameLabel() {
        // Set the text
        countryCurrencyNameLabel.text = countryCurrencyName
        // Set the font size
        countryCurrencyNameLabel.font = .systemFont(ofSize: 18, weight: .regular)
        // Set the text alignment
        countryCurrencyNameLabel.textAlignment = .left
        // Set the font color:
        countryCurrencyNameLabel.textColor = .gray
        
        view.addSubview(countryCurrencyNameLabel)
    }
    
    // Function to set up and configure the countryCurrencySymbolTitle
    func setUpCountryCurrencySymbolTitle() {
        // Set the text
        countryCurrencySymbolTitle.text = "Currency Symbol:"
        // Set the font size
        countryCurrencySymbolTitle.font = .systemFont(ofSize: 18, weight: .bold)
        // Set the text alignment
        countryCurrencySymbolTitle.textAlignment = .right
        // Set the font color:
        countryCurrencySymbolLabel.textColor = .black
        
        view.addSubview(countryCurrencySymbolTitle)
    }
    
    // Function to set up and configure the countryCurrencySymbolLabel
    func setUpCountryCurrencySymbolLabel() {
        // Set the text
        countryCurrencySymbolLabel.text = countryCurrencySymbol
        // Set the font size
        countryCurrencySymbolLabel.font = .systemFont(ofSize: 18, weight: .regular)
        // Set the text alignment
        countryCurrencySymbolLabel.textAlignment = .right
        // Set the font color:
        countryCurrencySymbolLabel.textColor = .gray
        
        view.addSubview(countryCurrencySymbolLabel)
    }
    
    // Function to set up and configure the view
    func setUpView() {
        // Set the background color of the view
        view.backgroundColor = .lightGray
        
        // Set up and configure the UI elements
        setUpFlagImageView()
        setUpCountryNameLabel()
        setUpCountryFullNameTitle()
        setUpCountryFullNameLabel()
        setUpCountryCapitalTitle()
        setUpCountryCapitalLabel()
        setUpCountryRegionTitle()
        setUpCountryRegionLabel()
        setUpCountrylanguagesTitle()
        setUpCountryLanguagesLabel()
        setUpCountryCurrencyNameTitle()
        setUpCountryCurrencyNameLabel()
        setUpCountryCurrencySymbolTitle()
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
        countryFullNameLabel.translatesAutoresizingMaskIntoConstraints = false
        countryCapitalTitle.translatesAutoresizingMaskIntoConstraints = false
        countryCapitalLabel.translatesAutoresizingMaskIntoConstraints = false
        countryRegionTitle.translatesAutoresizingMaskIntoConstraints = false
        countryRegionLabel.translatesAutoresizingMaskIntoConstraints = false
        countryLanguagesTitle.translatesAutoresizingMaskIntoConstraints = false
        countryLanguagesLabel.translatesAutoresizingMaskIntoConstraints = false
        countryCurrencyNameTitle.translatesAutoresizingMaskIntoConstraints = false
        countryCurrencyNameLabel.translatesAutoresizingMaskIntoConstraints = false
        countryCurrencySymbolTitle.translatesAutoresizingMaskIntoConstraints = false
        countryCurrencySymbolLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            flagImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            flagImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            flagImageView.widthAnchor.constraint(equalToConstant: 100),
            flagImageView.heightAnchor.constraint(equalToConstant: 100),
            
            countryNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            countryNameLabel.topAnchor.constraint(equalTo: flagImageView.bottomAnchor, constant: 10),
            
            countryFullNameTitle.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            countryFullNameTitle.topAnchor.constraint(equalTo: countryNameLabel.bottomAnchor, constant: 20),
            countryFullNameTitle.widthAnchor.constraint(equalToConstant: 200),
            countryFullNameTitle.heightAnchor.constraint(equalToConstant: 40),
            
            countryFullNameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            countryFullNameLabel.topAnchor.constraint(equalTo: countryFullNameTitle.bottomAnchor, constant: 10),
            countryFullNameLabel.widthAnchor.constraint(equalToConstant: 200),
            countryFullNameLabel.heightAnchor.constraint(equalToConstant: 40),
            
            countryCapitalTitle.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            countryCapitalTitle.topAnchor.constraint(equalTo: countryNameLabel.bottomAnchor, constant: 20),
            countryCapitalTitle.widthAnchor.constraint(equalToConstant: 200),
            countryCapitalTitle.heightAnchor.constraint(equalToConstant: 40),
            
            countryCapitalLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            countryCapitalLabel.topAnchor.constraint(equalTo: countryFullNameTitle.bottomAnchor, constant: 10),
            countryCapitalLabel.widthAnchor.constraint(equalToConstant: 200),
            countryCapitalLabel.heightAnchor.constraint(equalToConstant: 40),
            
            countryRegionTitle.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            countryRegionTitle.topAnchor.constraint(equalTo: countryFullNameLabel.bottomAnchor, constant: 20),
            countryRegionTitle.widthAnchor.constraint(equalToConstant: 200),
            countryRegionTitle.heightAnchor.constraint(equalToConstant: 40),
            
            countryRegionLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            countryRegionLabel.topAnchor.constraint(equalTo: countryRegionTitle.bottomAnchor, constant: 10),
            countryRegionLabel.widthAnchor.constraint(equalToConstant: 200),
            countryRegionLabel.heightAnchor.constraint(equalToConstant: 40),
            
            countryLanguagesTitle.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            countryLanguagesTitle.topAnchor.constraint(equalTo: countryCapitalLabel.bottomAnchor, constant: 20),
            countryLanguagesTitle.widthAnchor.constraint(equalToConstant: 200),
            countryLanguagesTitle.heightAnchor.constraint(equalToConstant: 40),
            
            countryLanguagesLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            countryLanguagesLabel.topAnchor.constraint(equalTo: countryLanguagesTitle.bottomAnchor, constant: 10),
            countryLanguagesLabel.widthAnchor.constraint(equalToConstant: 200),
            countryLanguagesLabel.heightAnchor.constraint(equalToConstant: 40),
            
            countryCurrencyNameTitle.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            countryCurrencyNameTitle.topAnchor.constraint(equalTo: countryRegionLabel.bottomAnchor, constant: 20),
            countryCurrencyNameTitle.widthAnchor.constraint(equalToConstant: 200),
            countryCurrencyNameTitle.heightAnchor.constraint(equalToConstant: 40),
            
            countryCurrencyNameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            countryCurrencyNameLabel.topAnchor.constraint(equalTo: countryCurrencyNameTitle.bottomAnchor, constant: 10),
            countryCurrencyNameLabel.widthAnchor.constraint(equalToConstant: 200),
            countryCurrencyNameLabel.heightAnchor.constraint(equalToConstant: 40),
            
            countryCurrencySymbolTitle.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            countryCurrencySymbolTitle.topAnchor.constraint(equalTo: countryLanguagesLabel.bottomAnchor, constant: 20),
            countryCurrencySymbolTitle.widthAnchor.constraint(equalToConstant: 200),
            countryCurrencySymbolTitle.heightAnchor.constraint(equalToConstant: 40),
            
            countryCurrencySymbolLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            countryCurrencySymbolLabel.topAnchor.constraint(equalTo: countryCurrencySymbolTitle.bottomAnchor, constant: 10),
            countryCurrencySymbolLabel.widthAnchor.constraint(equalToConstant: 200),
            countryCurrencySymbolLabel.heightAnchor.constraint(equalToConstant: 40)
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
