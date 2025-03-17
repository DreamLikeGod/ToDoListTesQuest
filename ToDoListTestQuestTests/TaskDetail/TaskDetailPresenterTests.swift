//import XCTest
//@testable import ToDoListTestQuest
//
//final class TaskDetailPresenterTests: XCTestCase {
//    var presenter: TaskDetailPresenter!
//    var mockView: MockTaskDetailView!
//    var mockInteractor: MockTaskDetailInteractor!
//    var mockRouter: MockTaskDetailRouter!
//    var testTask: ToDoTaskEntity!
//    
//    override func setUp() {
//        super.setUp()
//        testTask = ToDoTaskEntity()
//        testTask.title = "Test Task"
//        testTask.desc = "Test Description"
//        
//        presenter = TaskDetailPresenter()
//        mockView = MockTaskDetailView()
//        mockInteractor = MockTaskDetailInteractor(task: testTask)
//        mockRouter = MockTaskDetailRouter()
//        
//        presenter.view = mockView
//        presenter.interactor = mockInteractor
//        presenter.router = mockRouter
//    }
//    
//    override func tearDown() {
//        presenter = nil
//        mockView = nil
//        mockInteractor = nil
//        mockRouter = nil
//        testTask = nil
//        super.tearDown()
//    }
//    
//    func testViewDidLoad() {
//        // When
//        presenter.viewDidLoad()
//        
//        // Then
//        XCTAssertTrue(mockView.showTaskDetailCalled)
//        XCTAssertEqual(mockView.displayedTask?.title, testTask.title)
//    }
//    
//    func testUpdateTask() {
//        // Given
//        let newTitle = "Updated Title"
//        let newDescription = "Updated Description"
//        
//        // When
//        presenter.updateTask(newTitle, newDescription)
//        
//        // Then
//        XCTAssertTrue(mockInteractor.updateTaskDetailCalled)
//        XCTAssertEqual(mockInteractor.lastUpdatedTitle, newTitle)
//        XCTAssertEqual(mockInteractor.lastUpdatedDescription, newDescription)
//    }
//    
//    func testExitFromScreen() {
//        // Given
//        let finalTitle = "Final Title"
//        let finalDescription = "Final Description"
//        
//        // When
//        presenter.exitFromScreen(finalTitle, finalDescription)
//        
//        // Then
//        XCTAssertTrue(mockInteractor.saveTaskCalled)
//        XCTAssertEqual(mockInteractor.lastSavedTitle, finalTitle)
//        XCTAssertEqual(mockInteractor.lastSavedDescription, finalDescription)
//    }
//    
//    func testDidUpdateTaskDetail() {
//        // When
//        presenter.didUpdateTaskDetail(testTask)
//        
//        // Then
//        XCTAssertTrue(mockView.showTaskDetailCalled)
//        XCTAssertEqual(mockView.displayedTask?.title, testTask.title)
//    }
//    
//    func testDidSaveTask() {
//        // When
//        presenter.didSaveTask()
//        
//        // Then
//        XCTAssertTrue(mockRouter.dismissDetailModuleCalled)
//    }
//} 
