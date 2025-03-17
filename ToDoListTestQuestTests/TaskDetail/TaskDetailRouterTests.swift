//import XCTest
//@testable import ToDoListTestQuest
//
//final class TaskDetailRouterTests: XCTestCase {
//    var router: TaskDetailRouter!
//    var mockView: MockTaskDetailView!
//    var testTask: ToDoTaskEntity!
//    
//    override func setUp() {
//        super.setUp()
//        mockView = MockTaskDetailView()
//        router = TaskDetailRouter()
//        router.view = mockView
//        
//        testTask = ToDoTaskEntity()
//        testTask.title = "Test Task"
//        testTask.desc = "Test Description"
//    }
//    
//    override func tearDown() {
//        router = nil
//        mockView = nil
//        testTask = nil
//        super.tearDown()
//    }
//    
//    func testCreateDetailModule() {
//        // When
//        let view = TaskDetailRouter.createDetailModule(with: testTask)
//        
//        // Then
//        XCTAssertNotNil(view)
//        XCTAssertNotNil(view.presenter)
//        XCTAssertNotNil((view.presenter as? TaskDetailPresenter)?.router)
//        XCTAssertNotNil((view.presenter as? TaskDetailPresenter)?.interactor)
//        XCTAssertNotNil((view.presenter as? TaskDetailPresenter)?.view)
//        XCTAssertEqual((view.presenter as? TaskDetailPresenter)?.task?.title, testTask.title)
//    }
//    
//    func testDissmissDetailModule() {
//        // Given
//        let navigationController = UINavigationController(rootViewController: mockView)
//        
//        // When
//        router.dissmissDetailModule(from: mockView)
//        
//        // Then
//        XCTAssertEqual(navigationController.viewControllers.count, 1)
//        XCTAssertTrue(navigationController.viewControllers.first is MockTaskDetailView)
//    }
//} 
