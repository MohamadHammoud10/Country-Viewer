//
//  CustomCell.swift
//  CountryViewer
//
//  Created by Mohamad Hammoud on 15/05/2025.
//

import UIKit

class CustomCell: UITableViewCell {
    
    // Variable to hold the flag image url to be passed on to the details page
    var flagImageURL: String?
    // Variable to hold the official name to be passed on to the details page
    var officialName: String?
    // Variable to hold the region to be passed on to the details page
    var region: String?
    // Variable to hold the languages to be passed on to the details page
    var languages: [String]?
    // Variable to hold the capital city name to be passed on to the details page
    var capital: String?
    
    // Initialize the class identifier
    static let identifier = "CustomCell"
    
    // Initialize the imageView to display the country's flag
    public let customImageView: UIImageView = {
        let imageView = UIImageView()
        
        // Set the content mode
        imageView.contentMode = .scaleAspectFill
        // Set the default image placeholder
        imageView.image = UIImage(systemName: "flag")
        // Set the tint color
        imageView.tintColor = .label
        
        // Make the imageView round
        imageView.layer.cornerRadius = 30
        imageView.clipsToBounds = true
        // Set the border width and color
        imageView.layer.borderWidth = 0.5
        imageView.layer.borderColor = UIColor.systemGray.cgColor
        
        return imageView
    }()
    
    // Initialize the label to display the country's name title
    public let countryTitleLabel: UILabel = {
        let label = UILabel()
        
        // Set the text color
        label.textColor = .label
        // Set the text alignment
        label.textAlignment = .center
        // Set the font
        label.font = .systemFont(ofSize: 18, weight: .regular)
        // Set the default text as empty
        label.text = "Country:"
        
        return label
    }()
    
    // Initialize the label to display the country's name
    public let countryLabel: UILabel = {
        let label = UILabel()
        
        // Set the text color
        label.textColor = .label
        // Set the text alignment
        label.textAlignment = .center
        // Set the font
        label.font = .systemFont(ofSize: 12, weight: .light)
        // Set the default text as empty
        label.text = ""
        // Adjust font size to fit if the text is too large
        label.adjustsFontSizeToFitWidth = true
        
        return label
    }()
    
    // Initialize the label to display the country's capital
    public let capitalLabel: UILabel = {
        let label = UILabel()
        
        // Set the text color
        label.textColor = .label
        // Set the text alignment
        label.textAlignment = .center
        // Set the font
        label.font = .systemFont(ofSize: 12, weight: .light)
        // Set the default text as empty
        label.text = ""
        // Adjust font size to fit if the text is too large
        label.adjustsFontSizeToFitWidth = true
        
        return label
    }()
    
    // Initialize the label to display the country's currency title
    public let currencyTitleLabel: UILabel = {
        let label = UILabel()
        
        // Set the text color
        label.textColor = .label
        // Set the text alignment
        label.textAlignment = .center
        // Set the font
        label.font = .systemFont(ofSize: 18, weight: .regular)
        // Set the default text as empty
        label.text = "Currency:"
        
        return label
    }()
    
    // Initialize the label to display the country's currency name
    public let currencyNameLabel: UILabel = {
        let label = UILabel()
        
        // Set the text color
        label.textColor = .label
        // Set the text alignment
        label.textAlignment = .center
        // Set the font
        label.font = .systemFont(ofSize: 12, weight: .light)
        // Set the default text as empty
        label.text = ""
        // Adjust font size to fit if the text is too large
        label.adjustsFontSizeToFitWidth = true
        
        return label
    }()
    
    // Initialize the label to display the country's currency symbol
    public let currencySymbolLabel: UILabel = {
        let label = UILabel()
        
        // Set the text color
        label.textColor = .label
        // Set the text alignment
        label.textAlignment = .center
        // Set the font
        label.font = .systemFont(ofSize: 12, weight: .light)
        // Set the default text as empty
        label.text = ""
        
        return label
    }()
    
    // Initialize the delete button of the custom cell
    public let deleteButton: UIButton = {
        let button = UIButton()
        
        // Set hidden if the cell is empty
        button.isHidden = true
        
        // Set the background image of the button
        button.setBackgroundImage(UIImage(systemName: "trash"), for: .normal)
        // Set the tint color
        button.tintColor = .label
        
        // Add the action for pressing the search button
        button.addTarget(self, action: #selector(deleteCountry), for: .touchUpInside)
        
        return button
    }()
    
    // Function for deleting a country after the delete button is pressed
    @objc func deleteCountry(sender: UIButton!) {
        // Reset the image to the original placeholder
        self.customImageView.image = UIImage(systemName: "flag")
        // Clear the labels
        self.countryLabel.text = ""
        self.capitalLabel.text = ""
        self.currencyNameLabel.text = ""
        self.currencySymbolLabel.text = ""
        // Hide the go and delete buttons again
        self.goToDetailsButton.isHidden = true
        self.deleteButton.isHidden = true
        print("Button Pressed: \(sender.tag)")
    }
    
    // Initialize the go to details button of the custom cell
    public let goToDetailsButton: UIButton = {
        let button = UIButton()
        
        // Set hidden if the cell is empty
        button.isHidden = true
        
        // Set the background image of the button
        button.setBackgroundImage(UIImage(systemName: "arrow.forward"), for: .normal)
        // Set the tint color
        button.tintColor = .label
        
        // Add the action for pressing the search button
        button.addTarget(self, action: #selector(goToDetails), for: .touchUpInside)
        
        return button
    }()
    
    // Function for opening the country details after the go button is pressed
    @objc func goToDetails(sender: UIButton!) {
        // Present the details screen
        let detailsVC = DetailsViewController()
        // Pass over the data on to the detailsVC
        detailsVC.flagImageURL = flagImageURL
        detailsVC.countryName = self.countryLabel.text
        detailsVC.countryCapitalCity = capital
        detailsVC.countryCurrencyName = self.currencyNameLabel.text
        detailsVC.countryCurrencySymbol = self.currencySymbolLabel.text
        detailsVC.countryOfficialName = officialName
        detailsVC.countryRegion = region
        detailsVC.countryLanguages = languages
        self.window?.rootViewController?.present(detailsVC, animated: true)
    }
    
    // Set up and configure the UI elements
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // Set up and configure the view
        self.setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Function to configure the image and label of the cell
    public func configure(with image: UIImage, countryName: String, countryOfficialName: String, capitalName: String, cca2: String, currencyName: String, currencySymbol: String, region: String, languages: [String]) {
        // Set the image
        self.customImageView.image = image
        // Set the capitalLabel text to format "Capital, CCA2"
        self.capitalLabel.text = "\(capitalName), \(cca2)"
        // Set the countryLabel text
        self.countryLabel.text = countryName
        // Set the currencyNameLabel text
        self.currencyNameLabel.text = currencyName.capitalized
        // Set the currencySymbolLabel text
        self.currencySymbolLabel.text = currencySymbol
        // Unhide the go and delete buttons
        self.goToDetailsButton.isHidden = false
        self.deleteButton.isHidden = false
        
        // Save the capital city without the cca2
        capital = capitalName
        
        // Save the data to UserDefaults
        UserDefaults.standard.set(true, forKey: "HasData")
    }
    
    // Function to set up and configure the view
    private func setUpView() {
        // Add the subviews
        self.contentView.addSubview(countryTitleLabel)
        self.contentView.addSubview(customImageView)
        self.contentView.addSubview(countryLabel)
        self.contentView.addSubview(capitalLabel)
        self.contentView.addSubview(currencyTitleLabel)
        self.contentView.addSubview(currencyNameLabel)
        self.contentView.addSubview(currencySymbolLabel)
        self.contentView.addSubview(deleteButton)
        self.contentView.addSubview(goToDetailsButton)
        
        customImageView.translatesAutoresizingMaskIntoConstraints = false
        countryTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        countryLabel.translatesAutoresizingMaskIntoConstraints = false
        capitalLabel.translatesAutoresizingMaskIntoConstraints = false
        currencyTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        currencyNameLabel.translatesAutoresizingMaskIntoConstraints = false
        currencySymbolLabel.translatesAutoresizingMaskIntoConstraints = false
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        goToDetailsButton.translatesAutoresizingMaskIntoConstraints = false
        
        // Set the constraints
        NSLayoutConstraint.activate([
            customImageView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            customImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 8),
            customImageView.widthAnchor.constraint(equalToConstant: 60),
            customImageView.heightAnchor.constraint(equalToConstant: 60),
            
            countryTitleLabel.leadingAnchor.constraint(equalTo: self.customImageView.trailingAnchor, constant: 16),
            countryTitleLabel.trailingAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            countryTitleLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 28.125/3),
            countryTitleLabel.heightAnchor.constraint(equalToConstant: 28.125),
            
            capitalLabel.leadingAnchor.constraint(equalTo: self.customImageView.trailingAnchor, constant: 0),
            capitalLabel.trailingAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            capitalLabel.topAnchor.constraint(equalTo: self.countryTitleLabel.bottomAnchor),
            capitalLabel.heightAnchor.constraint(equalToConstant: 28.125),
            
            countryLabel.leadingAnchor.constraint(equalTo: self.customImageView.trailingAnchor, constant: 0),
            countryLabel.trailingAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            countryLabel.heightAnchor.constraint(equalToConstant: 28.125),
            countryLabel.topAnchor.constraint(equalTo: self.capitalLabel.bottomAnchor),
            
            currencyTitleLabel.leadingAnchor.constraint(equalTo: self.contentView.centerXAnchor, constant: 16),
            currencyTitleLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -38),
            currencyTitleLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 28.125/3),
            currencyTitleLabel.heightAnchor.constraint(equalToConstant: 28.125),
            
            currencyNameLabel.leadingAnchor.constraint(equalTo: self.contentView.centerXAnchor, constant: 16),
            currencyNameLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -38),
            currencyNameLabel.topAnchor.constraint(equalTo: self.currencyTitleLabel.bottomAnchor),
            currencyNameLabel.heightAnchor.constraint(equalToConstant: 28.125),
            
            currencySymbolLabel.leadingAnchor.constraint(equalTo: self.contentView.centerXAnchor, constant: 16),
            currencySymbolLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -38),
            currencySymbolLabel.heightAnchor.constraint(equalToConstant: 28.125),
            currencySymbolLabel.topAnchor.constraint(equalTo: self.currencyNameLabel.bottomAnchor),
            
            deleteButton.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -8),
            deleteButton.widthAnchor.constraint(equalToConstant: 30),
            deleteButton.heightAnchor.constraint(equalToConstant: 30),
            deleteButton.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -12),
            
            goToDetailsButton.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -8),
            goToDetailsButton.widthAnchor.constraint(equalToConstant: 30),
            goToDetailsButton.heightAnchor.constraint(equalToConstant: 30),
            goToDetailsButton.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 12)
        ])
        
        // Draw a vertical line in the center of the cell
        let lineView1 = UIView(frame: CGRectMake(-8, 0, 0.5, 28.125))
        lineView1.backgroundColor = UIColor.label
        self.currencyNameLabel.addSubview(lineView1)
        let lineView2 = UIView(frame: CGRectMake(-8, 0, 0.5, 28.125))
        lineView2.backgroundColor = UIColor.label
        self.currencySymbolLabel.addSubview(lineView2)
        
        // Draw the horizontal line
        drawHorizontalLine()
    }
    
    // Function that draws a horizontal line that divide the cells
    func drawHorizontalLine() {
        let caLayer = CAShapeLayer()
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: 0, y: 112.5))
        bezierPath.addLine(to: CGPoint(x: 1000, y: 112.5))
        caLayer.path = bezierPath.cgPath
        caLayer.strokeColor = UIColor.systemGray.cgColor
        caLayer.lineWidth = 0.5
        self.contentView.layer.addSublayer(caLayer)
    }
    
}
