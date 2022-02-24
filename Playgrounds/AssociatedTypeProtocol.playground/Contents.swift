import Foundation

// Associated Types
// My3 Shenoy
// www.my3vshenoy.com
// Blog Link: https://www.my3vshenoy.com/post/associated-types-for-protocols

protocol WebAddressProvider {
   associatedtype Address
   func getWebAddress() -> Address
}

struct HomePage: WebAddressProvider {
   typealias Address = String
   func getWebAddress() -> Address {
      "https://www.my3vshenoy.com"
   }
}

struct BlogPage: WebAddressProvider {
    typealias Address = URL
    func getWebAddress() -> Address {
       URL(string: "https://www.my3vshenoy.com/blog-1")!
     }
 }
 
 let homepage = HomePage()
 let homepageWebAddressString = homepage.getWebAddress()
 // ^^ Prints:  "https://www.my3vshenoy.com"
 
 let blogPage = BlogPage()
 let blogPageUrl = blogPage.getWebAddress()
 // ^^ Prints: "https://www.my3vshenoy.com/blog-1" with URL type
