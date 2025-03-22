import Foundation

@MainActor
final class DIContainer {
    let coreDataController: CoreDataController

    init(){
        self.coreDataController = CoreDataController()
    }
}
