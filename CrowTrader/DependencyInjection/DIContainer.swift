import Foundation

@MainActor
final class DIContainer {
    let coreDataController: CoreDataController
    let apiManager: APIManaging
    let snapsService: SnapsService


    init(){
        self.coreDataController = CoreDataController()
        self.apiManager = APIManager()
        self.snapsService = SnapsService(moc: coreDataController.container.viewContext)
    }
}
