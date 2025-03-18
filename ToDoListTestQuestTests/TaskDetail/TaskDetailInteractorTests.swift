import XCTest
import CoreData
@testable import ToDoListTestQuest

final class TaskDetailInteractorTests: XCTestCase {
    var sut: TaskDetailInteractor!
    var mockPresenter: MockTaskDetailPresenter!
    var mockCoreDataService: CoreDataServiceMock!
    var testTask: ToDoTaskEntity!
    
    override func setUp() {
        super.setUp()
        testTask = NSManagedObject(entity: ToDoListTestQuest.ToDoTaskEntity.entity(), insertInto: nil) as! ToDoListTestQuest.ToDoTaskEntity
        testTask.id = Int64(1)
        testTask.title = "Test"
        testTask.desc = "TestDesc"
        testTask.completed = false
        testTask.createdAt = Date()
        
        mockPresenter = MockTaskDetailPresenter()
        mockCoreDataService = CoreDataServiceMock()
        sut = TaskDetailInteractor(task: testTask)
        
        sut.presenter = mockPresenter
        sut.coreData = mockCoreDataService
    }
    
    override func tearDown() {
        sut = nil
        mockPresenter = nil
        mockCoreDataService = nil
        testTask = nil
        super.tearDown()
    }
    
    func testUpdateTaskDetailWithTitle() {
        // Given
        let newTitle = "Updated test"
        let newDescription = "Updated TestDesc"
        let newTask = testTask
        newTask?.title = newTitle
        newTask?.desc = newDescription
        
        // When
        sut.updateTaskDetail(newTitle, newDescription)
        
        // Then
        XCTAssertEqual(sut.task, newTask)
        XCTAssertEqual(sut.task?.id, newTask?.id)
        XCTAssertEqual(sut.task?.title, newTask?.title)
        XCTAssertEqual(sut.task?.desc, newTask?.desc)
        XCTAssertEqual(sut.task?.completed, newTask?.completed)
        XCTAssertEqual(sut.task?.createdAt, newTask?.createdAt)
        
        XCTAssertTrue(mockPresenter.invokedDidUpdateTaskDetail)
        XCTAssertEqual(mockPresenter.invokedDidUpdateTaskDetailCount, 1)
        XCTAssertEqual(mockPresenter.invokedDidUpdateTaskDetailTask, newTask)
        XCTAssertEqual(mockPresenter.invokedDidUpdateTaskDetailTask?.id, newTask?.id)
        XCTAssertEqual(mockPresenter.invokedDidUpdateTaskDetailTask?.title, newTask?.title)
        XCTAssertEqual(mockPresenter.invokedDidUpdateTaskDetailTask?.desc, newTask?.desc)
        XCTAssertEqual(mockPresenter.invokedDidUpdateTaskDetailTask?.completed, newTask?.completed)
        XCTAssertEqual(mockPresenter.invokedDidUpdateTaskDetailTask?.createdAt, newTask?.createdAt)
    }
    
    func testUpdateTaskDetailWithNoTitle() {
        // Given
        let newDescription = "Updated TestDesc"
        let newTask = testTask
        newTask?.desc = newDescription
        
        // When
        sut.updateTaskDetail(nil, newDescription)
        
        // Then
        XCTAssertEqual(sut.task, newTask)
        XCTAssertEqual(sut.task?.id, newTask?.id)
        XCTAssertEqual(sut.task?.title, newTask?.title)
        XCTAssertEqual(sut.task?.desc, newTask?.desc)
        XCTAssertEqual(sut.task?.completed, newTask?.completed)
        XCTAssertEqual(sut.task?.createdAt, newTask?.createdAt)
        
        XCTAssertTrue(mockPresenter.invokedDidUpdateTaskDetail)
        XCTAssertEqual(mockPresenter.invokedDidUpdateTaskDetailCount, 1)
        XCTAssertEqual(mockPresenter.invokedDidUpdateTaskDetailTask, newTask)
        XCTAssertEqual(mockPresenter.invokedDidUpdateTaskDetailTask?.id, newTask?.id)
        XCTAssertEqual(mockPresenter.invokedDidUpdateTaskDetailTask?.title, newTask?.title)
        XCTAssertEqual(mockPresenter.invokedDidUpdateTaskDetailTask?.desc, newTask?.desc)
        XCTAssertEqual(mockPresenter.invokedDidUpdateTaskDetailTask?.completed, newTask?.completed)
        XCTAssertEqual(mockPresenter.invokedDidUpdateTaskDetailTask?.createdAt, newTask?.createdAt)
    }
    
    func testSaveTaskWithTitle() {
        // Given
        let newTitle = "Updated test"
        let newDescription = "Updated TestDesc"
        let newTask = testTask
        newTask?.title = newTitle
        newTask?.desc = newDescription
        
        // When
        sut.saveTask(newTitle, newDescription)
        
        // Then
        XCTAssertEqual(sut.task, newTask)
        XCTAssertEqual(sut.task?.id, newTask?.id)
        XCTAssertEqual(sut.task?.title, newTask?.title)
        XCTAssertEqual(sut.task?.desc, newTask?.desc)
        XCTAssertEqual(sut.task?.completed, newTask?.completed)
        XCTAssertEqual(sut.task?.createdAt, newTask?.createdAt)
        
        XCTAssertTrue(mockCoreDataService.invokedUpdateTask)
        XCTAssertEqual(mockCoreDataService.invokedUpdateTaskCount, 1)
        XCTAssertEqual(mockCoreDataService.invokedUpdateTaskTask, newTask)
        XCTAssertEqual(mockCoreDataService.invokedUpdateTaskTask?.id, newTask?.id)
        XCTAssertEqual(mockCoreDataService.invokedUpdateTaskTask?.title, newTask?.title)
        XCTAssertEqual(mockCoreDataService.invokedUpdateTaskTask?.desc, newTask?.desc)
        XCTAssertEqual(mockCoreDataService.invokedUpdateTaskTask?.completed, newTask?.completed)
        XCTAssertEqual(mockCoreDataService.invokedUpdateTaskTask?.createdAt, newTask?.createdAt)
        
        XCTAssertTrue(mockPresenter.invokedDidSaveTask)
        XCTAssertEqual(mockPresenter.invokedDidSaveTaskCount, 1)
    }
    
    func testSaveTaskWithNoTitle() {
        // Given
        let newDescription = "Updated TestDesc"
        let newTask = testTask
        newTask?.desc = newDescription
        
        // When
        sut.saveTask(nil, newDescription)
        
        // Then
        XCTAssertEqual(sut.task, newTask)
        XCTAssertEqual(sut.task?.id, newTask?.id)
        XCTAssertEqual(sut.task?.title, newTask?.title)
        XCTAssertEqual(sut.task?.desc, newTask?.desc)
        XCTAssertEqual(sut.task?.completed, newTask?.completed)
        XCTAssertEqual(sut.task?.createdAt, newTask?.createdAt)
        
        XCTAssertTrue(mockCoreDataService.invokedUpdateTask)
        XCTAssertEqual(mockCoreDataService.invokedUpdateTaskCount, 1)
        XCTAssertEqual(mockCoreDataService.invokedUpdateTaskTask, newTask)
        XCTAssertEqual(mockCoreDataService.invokedUpdateTaskTask?.id, newTask?.id)
        XCTAssertEqual(mockCoreDataService.invokedUpdateTaskTask?.title, newTask?.title)
        XCTAssertEqual(mockCoreDataService.invokedUpdateTaskTask?.desc, newTask?.desc)
        XCTAssertEqual(mockCoreDataService.invokedUpdateTaskTask?.completed, newTask?.completed)
        XCTAssertEqual(mockCoreDataService.invokedUpdateTaskTask?.createdAt, newTask?.createdAt)
        
        XCTAssertTrue(mockPresenter.invokedDidSaveTask)
        XCTAssertEqual(mockPresenter.invokedDidSaveTaskCount, 1)
    }
}
