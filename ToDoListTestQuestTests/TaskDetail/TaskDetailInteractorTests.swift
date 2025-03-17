//import XCTest
//@testable import ToDoListTestQuest
//
//final class TaskDetailInteractorTests: XCTestCase {
//    var interactor: TaskDetailInteractor!
//    var mockPresenter: MockTaskDetailPresenter!
//    var mockCoreDataService: CoreDataServiceMock!
//    var testTask: ToDoTaskEntity!
//    
//    override func setUp() {
//        super.setUp()
//        testTask = ToDoTaskEntity()
//        testTask.title = "Test Task"
//        testTask.desc = "Test Description"
//        
//        mockPresenter = MockTaskDetailPresenter()
//        mockCoreDataService = CoreDataServiceMock()
//        interactor = TaskDetailInteractor(task: testTask)
//        
//        interactor.presenter = mockPresenter
//        interactor.coreData = mockCoreDataService
//    }
//    
//    override func tearDown() {
//        interactor = nil
//        mockPresenter = nil
//        mockCoreDataService = nil
//        testTask = nil
//        super.tearDown()
//    }
//    
//    func testInitializationWithTask() {
//        // Then
//        XCTAssertNotNil(interactor.task)
//        XCTAssertEqual(interactor.task?.title, testTask.title)
//        XCTAssertEqual(interactor.task?.desc, testTask.desc)
//    }
//    
//    func testInitializationWithNilTask() {
//        // When
//        let nilTaskInteractor = TaskDetailInteractor(task: nil)
//        
//        // Then
//        XCTAssertNotNil(nilTaskInteractor.task)
//        XCTAssertEqual(nilTaskInteractor.task?.title, "")
//        XCTAssertEqual(nilTaskInteractor.task?.desc, "")
//    }
//    
//    func testUpdateTaskDetail() {
//        // Given
//        let newTitle = "Updated Title"
//        let newDescription = "Updated Description"
//        
//        // When
//        interactor.updateTaskDetail(newTitle, newDescription)
//        
//        // Then
//        XCTAssertEqual(testTask.title, newTitle)
//        XCTAssertEqual(testTask.desc, newDescription)
//        XCTAssertTrue(mockPresenter.didUpdateTaskDetailCalled)
//    }
//    
//    func testSaveTask() {
//        // Given
//        let finalTitle = "Final Title"
//        let finalDescription = "Final Description"
//        
//        // When
//        interactor.saveTask(finalTitle, finalDescription)
//        
//        // Then
//        XCTAssertEqual(testTask.title, finalTitle)
//        XCTAssertEqual(testTask.desc, finalDescription)
//        XCTAssertTrue(mockPresenter.didSaveTaskCalled)
//    }
//    
//    func testUpdateTaskDetailWithEmptyValues() {
//        // Given
//        let emptyTitle = ""
//        let emptyDescription = ""
//        
//        // When
//        interactor.updateTaskDetail(emptyTitle, emptyDescription)
//        
//        // Then
//        XCTAssertEqual(testTask.title, emptyTitle)
//        XCTAssertEqual(testTask.desc, emptyDescription)
//        XCTAssertTrue(mockPresenter.didUpdateTaskDetailCalled)
//    }
//    
//    func testSaveTaskWithEmptyValues() {
//        // Given
//        let emptyTitle = ""
//        let emptyDescription = ""
//        
//        // When
//        interactor.saveTask(emptyTitle, emptyDescription)
//        
//        // Then
//        XCTAssertEqual(testTask.title, emptyTitle)
//        XCTAssertEqual(testTask.desc, emptyDescription)
//        XCTAssertTrue(mockPresenter.didSaveTaskCalled)
//    }
//    
//    func testUpdateTaskDetailWithLongValues() {
//        // Given
//        let longTitle = String(repeating: "A", count: 1000)
//        let longDescription = String(repeating: "B", count: 5000)
//        
//        // When
//        interactor.updateTaskDetail(longTitle, longDescription)
//        
//        // Then
//        XCTAssertEqual(testTask.title, longTitle)
//        XCTAssertEqual(testTask.desc, longDescription)
//        XCTAssertTrue(mockPresenter.didUpdateTaskDetailCalled)
//    }
//    
//    func testSaveTaskWithLongValues() {
//        // Given
//        let longTitle = String(repeating: "A", count: 1000)
//        let longDescription = String(repeating: "B", count: 5000)
//        
//        // When
//        interactor.saveTask(longTitle, longDescription)
//        
//        // Then
//        XCTAssertEqual(testTask.title, longTitle)
//        XCTAssertEqual(testTask.desc, longDescription)
//        XCTAssertTrue(mockPresenter.didSaveTaskCalled)
//    }
//} 
