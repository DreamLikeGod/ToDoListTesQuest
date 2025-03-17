import XCTest
import CoreData
@testable import ToDoListTestQuest

final class ToDoListRouterTests: XCTestCase {
    var router: ToDoListRouter!
    
    override func setUp() {
        super.setUp()
        router = ToDoListRouter()
    }
    
    override func tearDown() {
        router = nil
        super.tearDown()
    }
    
    func testCreateToDoListModule() {
        // When
        let view = ToDoListRouter.createTodoListModule()
        
        // Then
        XCTAssertNotNil(view)
        XCTAssertNotNil(view.presenter)
        XCTAssertNotNil(view.presenter?.interactor)
        XCTAssertNotNil(view.presenter?.router)
    }
} 
