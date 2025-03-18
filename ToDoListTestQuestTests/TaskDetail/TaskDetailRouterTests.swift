import XCTest
import CoreData
@testable import ToDoListTestQuest

final class TaskDetailRouterTests: XCTestCase {
    var sut: TaskDetailRouter!
    var testTask: ToDoTaskEntity!
    
    override func setUp() {
        super.setUp()
        sut = TaskDetailRouter()
        
        testTask = NSManagedObject(entity: ToDoListTestQuest.ToDoTaskEntity.entity(), insertInto: nil) as! ToDoListTestQuest.ToDoTaskEntity
        testTask.id = Int64(1)
        testTask.title = "Test"
        testTask.desc = "TestDesc"
        testTask.completed = false
        testTask.createdAt = Date()
    }
    
    override func tearDown() {
        sut = nil
        testTask = nil
        super.tearDown()
    }
    
    func testCreateDetailModule() {
        // Given
        // When
        let view = TaskDetailRouter.createDetailModule(with: testTask)
        
        // Then
        XCTAssertNotNil(view)
        XCTAssertNotNil(view.presenter)
        XCTAssertNotNil(view.presenter?.interactor)
        XCTAssertNotNil(view.presenter?.router)
        XCTAssertEqual(view.presenter?.interactor?.task, testTask)
        XCTAssertEqual(view.presenter?.interactor?.task?.id, testTask.id)
        XCTAssertEqual(view.presenter?.interactor?.task?.title, testTask.title)
        XCTAssertEqual(view.presenter?.interactor?.task?.desc, testTask.desc)
        XCTAssertEqual(view.presenter?.interactor?.task?.completed, testTask.completed)
        XCTAssertEqual(view.presenter?.interactor?.task?.createdAt, testTask.createdAt)
    }
}
