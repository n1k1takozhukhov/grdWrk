import Foundation

@MainActor
final class DIContainer {
    let coreDataController: CoreDataController
    let apiManager: APIManaging

    init(){
        self.coreDataController = CoreDataController()
        self.apiManager = APIManager()
    }
}
