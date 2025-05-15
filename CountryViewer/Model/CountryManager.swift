//
//  CountryManager.swift
//  CountryViewer
//
//  Created by Mohamad Hammoud on 14/05/2025.
//

import Foundation
import UIKit

// Create the CountryManagerDelegate
protocol CountryManagerDelegate {
    // Declare the delegate functions
    // Function to add a country to the tableview
    func didAddCountry(_ countryManager: CountryManager, country: CountryModel)
    // Function to handle errors during the network request
    func didFailWithError(error: Error)
    // Function to display an alert if a request was not found
    func showRequestNotFound()
    // Function to display an alert if a request was no received (mainly connection related)
    func showRequestNotReceived()
}

struct CountryManager {
    
    // Initialize the CounntryManagerDelegate
    var delegate: CountryManagerDelegate?
    
    // Variable to hold the version number of the restcountries api
    let version = "3.1"
    // Variable to hold the url used to call the restcountries api
    let apiURL = "https://restcountries.com/v"
    
    // Function to fetch the country from the api request
    func fetchCountry(countryName: String) {
        // Parse the full url with the version number and country name typed by the user
        let urlString = "\(apiURL)\(version)/name/\(countryName)/"
        // Perform the network request
        performRequest(urlString: urlString)
    }
    
    // Function to perform the network request
    func performRequest(urlString: String) {
        print("fetching from url: \(urlString)")
        
        // Initialize the url from the urlString
        if let url = URL(string: urlString) {
            // Initialize the urlSession
            let session = URLSession(configuration: .default)
            
            // Create the dataTask for the urlSession
            let task = session.dataTask(with: url) { (data, response, error) in
                // Check the status code of the request
                if let httpResponse = response as? HTTPURLResponse {
                    print("statusCode: \(httpResponse.statusCode)")
                    // If the request was not found:
                    if httpResponse.statusCode == 404 {
                        DispatchQueue.main.async {
                            // Display an alert in case the request was not found
                            delegate?.showRequestNotFound()
                        }
                    } else {
                        // Check for errors
                        if error != nil {
                            // Handle any errors
                            delegate?.didFailWithError(error: error!)
                            print("Error: \(error!)")
                            return
                        }
                        
                        // Unwrap the data retreived from the api request and parse the JSON
                        if let retreivedData = data {
                            if let country = parseJSON(countryData: retreivedData) {
                                // Add the country to the main viewcontroller
                                delegate?.didAddCountry(self, country: country)
                            }
                        }
                    }
                } else {
                    // Display an alert in case the request was not received
                    DispatchQueue.main.async {
                        delegate?.showRequestNotReceived()
                    }
                }
            }
            
            // Start the dataTask
            task.resume()
        }
    }
    
    // Function to parse JSON
    func parseJSON(countryData: Data) -> CountryModel? {
        // Initialize the JSON decoder
        let decoder = JSONDecoder()
        // Decode the JSON
        do {
            let decodedData = try decoder.decode([CountryData].self, from: countryData)
            
            // Save the decoded data objects
            let name = decodedData[0].name.common
            let officialName = decodedData[0].name.official
            let cca2 = decodedData[0].cca2
            let capital = decodedData[0].capital[0]
            let currencyName = decodedData[0].currencies.values.first?.name
            let currencySymbol = decodedData[0].currencies.values.first?.symbol
            let flagImageURL = decodedData[0].flags.png
            let region = decodedData[0].region
            let languages = Array(decodedData[0].languages.values)

            print("Name: \(name)")
            print("Official Name: \(officialName)")
            print("CCA2: \(cca2)")
            print("Capital: \(capital)")
            print("Currency Name: \(currencyName)")
            print("Currency Symbol: \(currencySymbol)")
            print("Flag Image URL: \(flagImageURL)")
            print("Region: \(region)")
            print("Languages: \(languages)")
            
            // Initialize a country object
            let country = CountryModel(name: name, officialName: officialName, cca2: cca2, capital: capital, currencyName: currencyName!, currencySymbol: currencySymbol!, flagImageURL: flagImageURL, region: region, languages: languages)
            
            return country
        } catch {
            // Handle any erros
            delegate?.didFailWithError(error: error)
            print("Error: \(error)")
            return nil
        }
    }
    
}
