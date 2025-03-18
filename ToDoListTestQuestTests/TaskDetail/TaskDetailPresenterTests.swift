import XCTest
import CoreData
@testable import ToDoListTestQuest

final class TaskDetailPresenterTests: XCTestCase {
    var sut: TaskDetailPresenter!
    var mockView: MockTaskDetailView!
    var mockInteractor: MockTaskDetailInteractor!
    var mockRouter: MockTaskDetailRouter!
    var testTask: ToDoTaskEntity!
    
    override func setUp() {
        super.setUp()
        testTask = NSManagedObject(entity: ToDoListTestQuest.ToDoTaskEntity.entity(), insertInto: nil) as! ToDoListTestQuest.ToDoTaskEntity
        testTask.id = Int64(1)
        testTask.title = "Test"
        testTask.desc = "TestDesc"
        testTask.completed = false
        testTask.createdAt = Date()
        
        sut = TaskDetailPresenter()
        mockView = MockTaskDetailView()
        mockInteractor = MockTaskDetailInteractor(task: testTask)
        mockRouter = MockTaskDetailRouter()
        
        sut.view = mockView
        sut.interactor = mockInteractor
        sut.router = mockRouter
    }
    
    override func tearDown() {
        sut = nil
        mockView = nil
        mockInteractor = nil
        mockRouter = nil
        testTask = nil
        super.tearDown()
    }
    
    func testViewDidLoad() {
        // Given
        // When
        sut.viewDidLoad()
        
        // Then
        XCTAssertTrue(mockView.invokedShowTaskDetail)
        XCTAssertEqual(mockView.invokedShowTaskDetailCount, 1)
        XCTAssertEqual(mockView.invokedShowTaskDetailTask, mockInteractor.task)
        XCTAssertEqual(mockView.invokedShowTaskDetailTask?.id, mockInteractor.task?.id)
        XCTAssertEqual(mockView.invokedShowTaskDetailTask?.title, mockInteractor.task?.title)
        XCTAssertEqual(mockView.invokedShowTaskDetailTask?.desc, mockInteractor.task?.desc)
        XCTAssertEqual(mockView.invokedShowTaskDetailTask?.completed, mockInteractor.task?.completed)
        XCTAssertEqual(mockView.invokedShowTaskDetailTask?.createdAt, mockInteractor.task?.createdAt)
        
        XCTAssertEqual(mockView.invokedShowTaskDetailTask, testTask)
        XCTAssertEqual(mockView.invokedShowTaskDetailTask?.id, testTask?.id)
        XCTAssertEqual(mockView.invokedShowTaskDetailTask?.title, testTask?.title)
        XCTAssertEqual(mockView.invokedShowTaskDetailTask?.desc, testTask?.desc)
        XCTAssertEqual(mockView.invokedShowTaskDetailTask?.completed, testTask?.completed)
        XCTAssertEqual(mockView.invokedShowTaskDetailTask?.createdAt, testTask?.createdAt)
    }
    
    func testUpdateTaskWithTitle() {
        // Given
        let newTitle = "Updated Test"
        let newDescription = "Updated TestDesc"
        let newTask = testTask
        newTask?.title = newTitle
        newTask?.desc = newDescription
        // When
        sut.updateTask(newTitle, newDescription)
        
        // Then
        XCTAssertTrue(mockInteractor.invokedUpdateTaskDetail)
        XCTAssertEqual(mockInteractor.invokedUpdateTaskDetailCount, 1)
        
        XCTAssertEqual(mockInteractor.task, newTask)
        XCTAssertEqual(mockInteractor.task?.id, newTask?.id)
        XCTAssertEqual(mockInteractor.task?.title, newTask?.title)
        XCTAssertEqual(mockInteractor.task?.desc, newTask?.desc)
        XCTAssertEqual(mockInteractor.task?.completed, newTask?.completed)
        XCTAssertEqual(mockInteractor.task?.createdAt, newTask?.createdAt)
    }
    
    func testUpdateTaskWithNilTitle() {
        // Given
        let newDescription = "Updated TestDesc"
        let newTask = testTask
        newTask?.desc = newDescription
        // When
        sut.updateTask(nil, newDescription)
        
        // Then
        XCTAssertTrue(mockInteractor.invokedUpdateTaskDetail)
        XCTAssertEqual(mockInteractor.invokedUpdateTaskDetailCount, 1)
        
        XCTAssertEqual(mockInteractor.task, newTask)
        XCTAssertEqual(mockInteractor.task?.id, newTask?.id)
        XCTAssertEqual(mockInteractor.task?.title, newTask?.title)
        XCTAssertEqual(mockInteractor.task?.desc, newTask?.desc)
        XCTAssertEqual(mockInteractor.task?.completed, newTask?.completed)
        XCTAssertEqual(mockInteractor.task?.createdAt, newTask?.createdAt)
    }
    
    func testExitFromScreenWithTitle() {
        // Given
        let newTitle = "Updated Test"
        let newDescription = "Updated TestDesc"
        let newTask = testTask
        newTask?.title = newTitle
        newTask?.desc = newDescription
        // When
        sut.exitFromScreen(newTitle, newDescription)
        
        // Then
        XCTAssertTrue(mockInteractor.invokedSaveTask)
        XCTAssertEqual(mockInteractor.invokedSaveTaskCount, 1)
        
        XCTAssertEqual(mockInteractor.task, newTask)
        XCTAssertEqual(mockInteractor.task?.id, newTask?.id)
        XCTAssertEqual(mockInteractor.task?.title, newTask?.title)
        XCTAssertEqual(mockInteractor.task?.desc, newTask?.desc)
        XCTAssertEqual(mockInteractor.task?.completed, newTask?.completed)
        XCTAssertEqual(mockInteractor.task?.createdAt, newTask?.createdAt)
    }
    
    func testExitFromScreenWithNilTitle() {
        // Given
        let newDescription = "Updated TestDesc"
        let newTask = testTask
        newTask?.desc = newDescription
        // When
        sut.exitFromScreen(nil, newDescription)
        
        // Then
        XCTAssertTrue(mockInteractor.invokedSaveTask)
        XCTAssertEqual(mockInteractor.invokedSaveTaskCount, 1)
        
        XCTAssertEqual(mockInteractor.task, newTask)
        XCTAssertEqual(mockInteractor.task?.id, newTask?.id)
        XCTAssertEqual(mockInteractor.task?.title, newTask?.title)
        XCTAssertEqual(mockInteractor.task?.desc, newTask?.desc)
        XCTAssertEqual(mockInteractor.task?.completed, newTask?.completed)
        XCTAssertEqual(mockInteractor.task?.createdAt, newTask?.createdAt)
    }
    
    func testDidUpdateTaskDetail() {
        // Given
        // When
        sut.didUpdateTaskDetail(testTask)
        
        // Then
        XCTAssertTrue(mockView.invokedShowTaskDetail)
        XCTAssertEqual(mockView.invokedShowTaskDetailCount, 1)
        XCTAssertEqual(mockView.invokedShowTaskDetailTask, testTask)
        XCTAssertEqual(mockView.invokedShowTaskDetailTask?.id, testTask?.id)
        XCTAssertEqual(mockView.invokedShowTaskDetailTask?.title, testTask?.title)
        XCTAssertEqual(mockView.invokedShowTaskDetailTask?.desc, testTask?.desc)
        XCTAssertEqual(mockView.invokedShowTaskDetailTask?.completed, testTask?.completed)
        XCTAssertEqual(mockView.invokedShowTaskDetailTask?.createdAt, testTask?.createdAt)
    }
    
    func testDidSaveTask() {
        // Given
        // When
        sut.didSaveTask()
        
        // Then
        XCTAssertTrue(mockRouter.invokedDissmissDetailModule)
        XCTAssertEqual(mockRouter.invokedDissmissDetailModuleCount, 1)
        XCTAssertTrue(mockRouter.invokedDissmissDetailModuleParameters === sut.view)
        XCTAssertTrue(mockRouter.invokedDissmissDetailModuleParameters === mockView)
    }
    
}
