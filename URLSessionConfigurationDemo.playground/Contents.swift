import UIKit

let sharedSession = URLSession.shared

// Access configuration properties already assigned
sharedSession.configuration.allowsCellularAccess

// Create a session object
let myDefaultConfiguration = URLSessionConfiguration.default
let eConfig = URLSessionConfiguration.ephemeral

// BG Config always needs an id to restart if app is killed
let backgroundConfig = URLSessionConfiguration.background(withIdentifier: "com.aarven.sessions")

// Change the pre-assgned property
myDefaultConfiguration.allowsCellularAccess = false
myDefaultConfiguration.allowsExpensiveNetworkAccess = true
myDefaultConfiguration.allowsConstrainedNetworkAccess = true


let myDefaultSession = URLSession(configuration: myDefaultConfiguration)
myDefaultSession.configuration.allowsConstrainedNetworkAccess // Should be true since we customized it

// To create a default session without customization
let session = URLSession(configuration: .default)
// This will be the default value true
session.configuration.allowsCellularAccess


    
