import Foundation

// Thread safe -> FileManager does the heavy lifting
// Only handful directories are available on iOS
// Each app have their own sandbox which have these directories
// documentDirectory -> User document directory
// userDomainMask -> user's personal directory
public extension FileManager {
    static var documentDirectoryUrl: URL {
        `default`.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
}
