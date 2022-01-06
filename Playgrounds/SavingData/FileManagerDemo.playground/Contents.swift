import Foundation

// MARK: - FileManager Path Creation and saving
let url = FileManager.documentDirectoryUrl.path

// Path is name of the file
let remindersDataURL = URL(fileURLWithPath: "Reminders", relativeTo: FileManager.documentDirectoryUrl)

// Method two to do the same from above
let stringUrl = FileManager.documentDirectoryUrl.appendingPathComponent("String").appendingPathExtension(".txt")

// Make my own string and a URL to save it to
let string = "AlaskaTripDetails"
let tripDetailsUrl = URL(fileURLWithPath: string, relativeTo: FileManager.documentDirectoryUrl)

let tripDetailsString  = FileManager.documentDirectoryUrl.appendingPathComponent(string).appendingPathExtension("txt")

// MARK: - Saving and Loading Data in FileManager
let favoriteBytes: [UInt8]  = [
    240,    159,    152,    184,
    240,    159,    152,    185,
    0b1111_0000, 0b1001_1111,   0b1001_1000,    186,
    0xF0,   0x9F,   0x98,   8
]

let someUInt: UInt8 = 9
MemoryLayout.size(ofValue: someUInt)

MemoryLayout.size(ofValue: favoriteBytes.last)

let favoriteBytesData = Data(favoriteBytes)
let favoriteBytesUrl = URL(fileURLWithPath: "FavoriteByte", relativeTo: FileManager.documentDirectoryUrl)

// Could fail, so add a try
try favoriteBytesData.write(to: favoriteBytesUrl)


let savedFavoriteBytesData = try Data(contentsOf: favoriteBytesUrl)
let savedFavoriteBytesArray = Array(savedFavoriteBytesData)

// Data stored == Data retrieved
favoriteBytes == savedFavoriteBytesArray


// Store the file with file extension
try favoriteBytesData.write(to: favoriteBytesUrl.appendingPathExtension("txt"))
let favoritesString = String(data: savedFavoriteBytesData, encoding: .utf8)
