//
//  ViewController.swift
//  CountryViewer
//
//  Created by Mohamad Hammoud on 13/05/2025.
//

import UIKit
import CoreLocation

class MainViewController: UIViewController {

    // Initialize the countryManager
    var countryManager = CountryManager()
    
    // Initialize the locationManager
    let locationManager = CLLocationManager()
    
    // Initialize the glGeoCoder
    let geocoder = CLGeocoder()
    
    // Variable to hold present location if available
    var location: CLLocation?
    
    // Variable to hold the placemark
    var placemark: CLPlacemark?

    // Variables for holding the city and country the user is in
    var city: String?
    var country: String?
    var countryShortName: String?
    
    // Initialize the stackView1
    let stackView1 = UIStackView()
    // Initialize the stackView2
    let stackView2 = UIStackView()
    // Initialize the searchTextField
    let searchTextField = UITextField()
    // Initialize the searchButton
    let searchButton = UIButton()
    // Initialize the tableTitleLabel
    let tableTitleLabel = UILabel()
    // Initialize the tableView
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the delegate of the countryManager
        countryManager.delegate = self
                
        // Set up and configure the view
        setUpView()
    }

    // Function to set up and configure the stackView1
    func setUpStackView1() {
        // Set the axis and alignment
        stackView1.axis = .vertical
        stackView1.alignment = .trailing
        stackView1.distribution = .fill
        stackView1.spacing = 10
        
        view.addSubview(stackView1)
    }
    
    // Function to set up and configure the stackView2
    func setUpStackView2() {
        // Set the axis and alignment
        stackView2.axis = .horizontal
        stackView2.alignment = .fill
        stackView2.distribution = .fill
        stackView2.spacing = 10
        
        stackView1.addSubview(stackView2)
    }
    
    // Function to set up and configure the searxhTextField
    func setUpSearchTextField() {
        // Set the delegate of the searchTextField
        searchTextField.delegate = self
        
        // Set the font size
        searchTextField.font = .systemFont(ofSize: 25, weight: .light)
        // Set the background color
        searchTextField.backgroundColor = .systemFill
        // Set the text placeholder
        searchTextField.placeholder = "Search for a country"
        // Set the border style
        searchTextField.borderStyle = .roundedRect
        
        stackView2.addSubview(searchTextField)
    }
    
    // Function to set up and configure the searchButton
    func setUpSearchButton() {
        // Set the background image
        searchButton.setBackgroundImage(UIImage(systemName: "magnifyingglass")?.withTintColor(.label, renderingMode: .alwaysOriginal), for: .normal)
        
        // Add the action for pressing the search button
        searchButton.addTarget(self, action: #selector(searchCountry), for: .touchUpInside)
        
        stackView2.addSubview(searchButton)
    }
    
    // Function for searching for country after the search button is pressed
    @objc func searchCountry(sender: UIButton!) {
        // Unwrap the country name typed by the user
        if let country = searchTextField.text {
            // Make an api request with the country name typed by the user
            countryManager.fetchCountry(countryName: country)
        }
        
        // Clear the searchTextField after the user has finished typing
        searchTextField.text = ""
    }
    
    // Function to set up and configure the tableTitleLabel
    func setUpTableTitleLabel() {
        // Set the text
        tableTitleLabel.text = "My Countries"
        // Set the font size
        tableTitleLabel.font = .systemFont(ofSize: 25, weight: .bold)
        
        stackView1.addSubview(tableTitleLabel)
    }
    
    // Function to set up and configure the tableView
    func setUpTableView() {
        // Set the delegate of the tableView
        tableView.delegate = self
        // Set the datasource of the tableView
        tableView.dataSource = self
        
        // Set the corner radius
        tableView.layer.cornerRadius = 12
        tableView.clipsToBounds = true
        
        // Set the border width and color
        tableView.layer.borderWidth = 2.0
        tableView.layer.borderColor = UIColor.label.cgColor
        
        tableView.allowsSelection = true
        // Register the CustomCell to be used in the tableView
        tableView.register(CustomCell.self, forCellReuseIdentifier: CustomCell.identifier)
        
        stackView1.addSubview(tableView)
    }
    
    // Function to set up and configure the locationManager
    func setUpLocationManager() {
        // Set the delegate of the locationManager
        locationManager.delegate = self
        // Prompt the user for location services permission
        locationManager.requestWhenInUseAuthorization()
        // Request the location
        locationManager.requestLocation()
        // Start updating locations
        locationManager.startUpdatingLocation()
    }
    
    // Function to set up and configure the view
    func setUpView() {
        // Set the background color of the view
        view.backgroundColor = .systemBackground
        
        // Set up and configure the UI elements
        setUpLocationManager()
        setUpSearchTextField()
        setUpSearchButton()
        setUpStackView1()
        setUpStackView2()
        setUpTableTitleLabel()
        setUpTableView()
        
        // Set the constraints
        setUpConstraints()
    }
    
    // Function to set up the constraints
    func setUpConstraints() {
        stackView1.translatesAutoresizingMaskIntoConstraints = false
        stackView2.translatesAutoresizingMaskIntoConstraints = false
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        tableTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView1.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            stackView1.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            stackView1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            stackView1.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            
            stackView2.leadingAnchor.constraint(equalTo: stackView1.leadingAnchor, constant: 0),
            stackView2.trailingAnchor.constraint(equalTo: stackView1.trailingAnchor, constant: 0),
            stackView2.heightAnchor.constraint(equalToConstant: 40),
            
            searchTextField.leadingAnchor.constraint(equalTo: stackView2.leadingAnchor, constant: 0),
            searchTextField.heightAnchor.constraint(equalToConstant: 40),
            
            searchButton.leadingAnchor.constraint(equalTo: searchTextField.trailingAnchor, constant: 10),
            searchButton.trailingAnchor.constraint(equalTo: stackView2.trailingAnchor, constant: 0),
            searchButton.widthAnchor.constraint(equalToConstant: 40),
            searchButton.heightAnchor.constraint(equalToConstant: 40),
            
            tableTitleLabel.leadingAnchor.constraint(equalTo: stackView1.leadingAnchor, constant: 0),
            tableTitleLabel.trailingAnchor.constraint(equalTo: stackView1.trailingAnchor, constant: 0),
            tableTitleLabel.topAnchor.constraint(equalTo: stackView2.bottomAnchor, constant: 10),
            tableTitleLabel.heightAnchor.constraint(equalToConstant: 40),
            
            tableView.leadingAnchor.constraint(equalTo: stackView1.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: stackView1.trailingAnchor, constant: 0),
            tableView.topAnchor.constraint(equalTo: tableTitleLabel.bottomAnchor, constant: 10),
            tableView.heightAnchor.constraint(equalToConstant: 562.5)
        ])
    }
    
}

// MARK: - UITextFieldDelegate

extension MainViewController: UITextFieldDelegate {
    
    // UITextFieldDelegate Methods:
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("User Input: \(searchTextField.text!)")
        searchTextField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        // Check if the searchTextField is empty
        if textField.text != "" {
            return true
        } else {
            // Alert the user if the searchTextFIeld is empty
            let alert = UIAlertController(title: "Please type a country name", message: nil, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        // Unwrap the country name typed by the user
        if let country = searchTextField.text {
            // Make an api request with the country name typed by the user
            countryManager.fetchCountry(countryName: country)
        }
        
        // Clear the searchTextField after the user has finished typing
        searchTextField.text = ""
    }
    
}

// MARK: - CountryManagerDelegate

extension MainViewController: CountryManagerDelegate {
    
    // Function to add a country to the view
    func didAddCountry(_ countryManager: CountryManager, country: CountryModel) {
        DispatchQueue.main.async {
            
            // Loop over the tableView
            for section in 0..<self.tableView.numberOfSections {
                for row in 0..<self.tableView.numberOfRows(inSection: section) {
                    let indexPath = NSIndexPath(row: row, section: section)
                    let cell = self.tableView.cellForRow(at: indexPath as IndexPath) as! CustomCell
                    let cell0 = self.tableView.cellForRow(at: NSIndexPath(row: 0, section: 0) as IndexPath) as! CustomCell
                    let cell1 = self.tableView.cellForRow(at: NSIndexPath(row: 1, section: 0) as IndexPath) as! CustomCell
                    let cell2 = self.tableView.cellForRow(at: NSIndexPath(row: 2, section: 0) as IndexPath) as! CustomCell
                    let cell3 = self.tableView.cellForRow(at: NSIndexPath(row: 3, section: 0) as IndexPath) as! CustomCell
                    let cell4 = self.tableView.cellForRow(at: NSIndexPath(row: 4, section: 0) as IndexPath) as! CustomCell
                    
                    // Check if the table is full
                    if (cell0.countryLabel.text != "") && (cell1.countryLabel.text != "") && (cell2.countryLabel.text != "") && (cell3.countryLabel.text != "") && (cell4.countryLabel.text != "") {
                        // Alert the user if the tableView is full
                        let alert = UIAlertController(title: "The list is Full!", message: "Please remove some countries before adding more", preferredStyle: UIAlertController.Style.alert)
                        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                    } else {
                        // Check if country already exisits
                        if (cell0.countryLabel.text == country.name) || (cell1.countryLabel.text == country.name) || (cell2.countryLabel.text == country.name) || (cell3.countryLabel.text == country.name) || (cell4.countryLabel.text == country.name) {
                            // Alert the user that the country already exists
                            let alert = UIAlertController(title: "This country already exists in the table!", message: "Please search for a new country and try again", preferredStyle: UIAlertController.Style.alert)
                            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                            self.present(alert, animated: true, completion: nil)
                        } else {
                            // If a cell is empty, populate it
                            if cell.countryLabel.text == "" {
                                // Display the flag image from the url
                                let url = URL(string: country.flagImageURL)
                                let data = try? Data(contentsOf: url!)
                                
                                if let imageData = data {
                                    let image = UIImage(data: imageData)
                                    // Call the function that configures the cell
                                    cell.configure(with: image!, countryName: country.name, countryOfficialName: country.officialName, capitalName: country.capital, cca2: country.cca2, currencyName: country.currencyName, currencySymbol: country.currencySymbol, region: country.region, languages: country.languages)
                                    // Save the button tag so it can be used to delete the data
                                    // corresponding to that cell in UserDefaults
                                    cell.deleteButton.tag = row
                                    // Save the details to be passed on to the details page
                                    cell.officialName = country.officialName
                                    cell.region = country.region
                                    cell.languages = country.languages
                                    cell.flagImageURL = country.flagImageURL
                                    return
                                } else {
                                    // Alert the user that the flag image could not be loaded
                                    let alert = UIAlertController(title: "Something has gone wrong!", message: "Please check your internet connection and try again", preferredStyle: UIAlertController.Style.alert)
                                    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                                    self.present(alert, animated: true, completion: nil)
                                    // Load the default placeholder flag image
                                    // Call the function that configures the cell
                                    cell.configure(with: UIImage(systemName: "flag")!, countryName: country.name, countryOfficialName: country.officialName, capitalName: country.capital, cca2: country.cca2, currencyName: country.currencyName, currencySymbol: country.currencySymbol, region: country.region, languages: country.languages)
                                    // Save the details to be passed on to the details page
                                    cell.officialName = country.officialName
                                    cell.region = country.region
                                    cell.languages = country.languages
                                    cell.flagImageURL = country.flagImageURL
                                    return
                                }
                            }
                        }
                    }
                    
                }
            }
            
        }
    }
    
    // Function to handle errors
    func didFailWithError(error: Error) {
        DispatchQueue.main.async {
            // Alert the user if the searchTextFIeld is empty
            let alert = UIAlertController(title: "Something has gone wrong!", message: "Please check your internet connection and try again", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            print("Error: \(error)")
        }
    }
    
    // Function to show an alert in case the request was not found
    func showRequestNotFound() {
        // Alert the user that the request was not found
        let alert = UIAlertController(title: "Country not found!", message: "Please type the name of a real country and try again", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    // Function to show an alert in case the request was not received
    func showRequestNotReceived() {
        // Alert the user that the request was not received
        let alert = UIAlertController(title: "Response not received from the server!", message: "Please check your internet connection and try again", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}

// MARK: - UITableView

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Set the number of rows to 5
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.identifier, for: indexPath) as? CustomCell else {
            fatalError("The table could not dequeue a CustomCell.")
        }
        
        // Configure the first row
        if indexPath.row == 0 {
            
            // Check if location services are enabled
            let authStatus = CLLocationManager.authorizationStatus()
            
            // If the status is not determined, use the hardcoded data and
            // prompt the user to enable location services
            if authStatus == .notDetermined {
                // Configure the first row using the hardcoded data since location services are disabled
                DispatchQueue.main.async {
                    // Display the flag image from the url
                    let url = URL(string: "https://flagcdn.com/w320/lb.png")
                    let data = try? Data(contentsOf: url!)

                    if let imageData = data {
                        let image = UIImage(data: imageData)
                        // Call the function that configures the cell
                        cell.configure(with: image!, countryName: "Lebanon", countryOfficialName: "Lebanese Republic", capitalName: "Beirut", cca2: "LB", currencyName: "Lebanese Pound", currencySymbol: "ل.ل", region: "Asia", languages: ["Arabic, French"])
                        // Save the details to be passed on to the details page
                        cell.officialName = "Lebanese Republic"
                        cell.region = "Asia"
                        cell.languages = ["Arabic, French"]
                        cell.flagImageURL = "https://flagcdn.com/w320/lb.png"
                    } else {
                        // Load the default placeholder flag image
                        // Call the function that configures the cell
                        cell.configure(with: UIImage(systemName: "flag")!, countryName: "Lebanon", countryOfficialName: "Lebanese Republic", capitalName: "Beirut", cca2: "LB", currencyName: "Lebanese Pound", currencySymbol: "ل.ل", region: "Asia", languages: ["Arabic, French"])
                        // Save the details to be passed on to the details page
                        cell.officialName = "Lebanese Republic"
                        cell.region = "Asia"
                        cell.languages = ["Arabic, French"]
                        cell.flagImageURL = "https://flagcdn.com/w320/lb.png"
                        // Alert the user that the flag image could not be loaded
                        let alert = UIAlertController(title: "The image could not be uploaded!", message: "Please check your internet connection and try again", preferredStyle: UIAlertController.Style.alert)
                        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                    }
                }

                locationManager.requestWhenInUseAuthorization()
                locationManager.startUpdatingLocation()
            }
            
            // If the location services are disabled, use the hardcoded data
            if authStatus == .denied || authStatus == .restricted {
                print("Location Services are Disabled!")
                
                // Configure the first row using the hardcoded data since location services are disabled
                DispatchQueue.main.async {
                    // Display the flag image from the url
                    let url = URL(string: "https://flagcdn.com/w320/lb.png")
                    let data = try? Data(contentsOf: url!)
                    
                    if let imageData = data {
                        let image = UIImage(data: imageData)
                        // Call the function that configures the cell
                        cell.configure(with: image!, countryName: "Lebanon", countryOfficialName: "Lebanese Republic", capitalName: "Beirut", cca2: "LB", currencyName: "Lebanese Pound", currencySymbol: "ل.ل", region: "Asia", languages: ["Arabic, French"])
                        // Save the details to be passed on to the details page
                        cell.officialName = "Lebanese Republic"
                        cell.region = "Asia"
                        cell.languages = ["Arabic, French"]
                        cell.flagImageURL = "https://flagcdn.com/w320/lb.png"
                    } else {
                        // Load the default placeholder flag image
                        // Call the function that configures the cell
                        cell.configure(with: UIImage(systemName: "flag")!, countryName: "Lebanon", countryOfficialName: "Lebanese Republic", capitalName: "Beirut", cca2: "LB", currencyName: "Lebanese Pound", currencySymbol: "ل.ل", region: "Asia", languages: ["Arabic, French"])
                        // Save the details to be passed on to the details page
                        cell.officialName = "Lebanese Republic"
                        cell.region = "Asia"
                        cell.languages = ["Arabic, French"]
                        cell.flagImageURL = "https://flagcdn.com/w320/lb.png"
                        // Alert the user that the flag image could not be loaded
                        let alert = UIAlertController(title: "The image could not be uploaded!", message: "Please check your internet connection and try again", preferredStyle: UIAlertController.Style.alert)
                        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                    }
                }
            }
            
            // If the location services are enabled, fetch the country using the user's lcoation
            if authStatus == .authorizedWhenInUse || authStatus == .authorizedAlways {
                print("Location Services are Enabled!")
                print("Country of origin: \(country)")
                
                // Configure the first row according to the country the user is currently present in
                // Check if country is empty
                if country != nil {
                    // Make an api request with the country name typed by the user
                    countryManager.fetchCountry(countryName: country!)
                }
                
            }
            
        } else {
            // Empty other cells when configuring the first cell on app launch
            cell.countryLabel.text = ""
            cell.capitalLabel.text = ""
            cell.currencyNameLabel.text = ""
            cell.currencySymbolLabel.text = ""
            cell.customImageView.image = UIImage(systemName: "flag")
            cell.goToDetailsButton.isHidden = true
            cell.deleteButton.isHidden = true
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // return the height of the rows
        return 112.5
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("Cell Selected: \(indexPath.row)")
    }
    
}

// MARK: - CLLocationManagerDelegate

extension MainViewController: CLLocationManagerDelegate {
    
    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // Retreive the last updated location
        if let lastLocation = locations.last {
            // Stop the locationManager
            locationManager.stopUpdatingLocation()
            
            location = lastLocation
            geocoder.reverseGeocodeLocation(lastLocation, completionHandler: { (placemarks, error) in
                if error == nil, let placemark = placemarks, !placemark.isEmpty {
                    self.placemark = placemark.last
                }
                self.parsePlacemarks()
                self.tableView.reloadData()
            })
            
        }
    }
    
    public func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Location Manager Error: \(error)")
        // Stop the locationManager
        locationManager.stopUpdatingLocation()
        locationManager.delegate = nil
    }
    
    func parsePlacemarks() {
       if let _ = location {
            if let placemark = placemark {
                if let city = placemark.locality, !city.isEmpty {
                    self.city = city
                }
                if let country = placemark.country, !country.isEmpty {

                    self.country = country
                }
                if let countryShortName = placemark.isoCountryCode, !countryShortName.isEmpty {

                    self.countryShortName = countryShortName
                }
            }
        } else {
        }
    }
    
}
