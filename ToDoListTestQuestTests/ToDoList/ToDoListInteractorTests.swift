import XCTest
import CoreData
@testable import ToDoListTestQuest

@MainActor
final class ToDoListInteractorTests: XCTestCase {
    var sut: ToDoListInteractor!
    var mockPresenter: MockToDoListPresenter!
    var mockCoreDataService: CoreDataServiceMock!
    var mockNetworkService: NetworkServiceMock!
    var testTask: ToDoListTestQuest.ToDoTaskEntity!
    var testTaskModel: TaskModel!
    
    override func setUp() {
        super.setUp()
        sut = ToDoListInteractor()
        mockPresenter = MockToDoListPresenter()
        mockCoreDataService = CoreDataServiceMock()
        mockNetworkService = NetworkServiceMock()
        
        sut.presenter = mockPresenter
        sut.coreDataService = mockCoreDataService
        sut.networkService = mockNetworkService
        
        testTaskModel = TaskModel(id: 1, title: "Test", description: "TestDesc", completed: false, createdAt: Date())
        testTask = NSManagedObject(entity: ToDoListTestQuest.ToDoTaskEntity.entity(), insertInto: nil) as! ToDoListTestQuest.ToDoTaskEntity
        testTask.id = Int64(1)
        testTask.title = "Test"
        testTask.desc = "TestDesc"
        testTask.completed = false
        testTask.createdAt = Date()
    }
    
    override func tearDown() {
        sut = nil
        mockPresenter = nil
        mockCoreDataService = nil
        mockNetworkService = nil
        testTask = nil
        super.tearDown()
    }
    
    func testRetrieveTodosWithNetworkService() async throws {
        // Given
        mockCoreDataService.invokedFetchTasksResult = []
        mockCoreDataService.invokedFetchTasksResultSaved = [testTask]
        mockNetworkService.invokedFetchTodosWithResult = [testTaskModel]
        
        // When
        sut.retrieveTodos()
        try await Task.sleep(nanoseconds: 1_000_000_000)
        
        // Then
        XCTAssertTrue(mockCoreDataService.invokedFetchTasks)
        XCTAssertTrue(mockNetworkService.invokedFetchTodos)
        XCTAssertTrue(mockCoreDataService.invokedCreateTaskArray)
        XCTAssertTrue(mockPresenter.invokedDidRetrieveTodo)
        
        XCTAssertEqual(mockCoreDataService.invokedFetchTasksCount, 2)
        XCTAssertEqual(mockNetworkService.invokedFetchTodosCount, 1)
        XCTAssertEqual(mockCoreDataService.invokedCreateTaskArrayCount, 1)
        XCTAssertEqual(mockPresenter.invokedDidRetrieveTodoCount, 1)
        
        XCTAssertEqual(mockCoreDataService.invokedFetchTasksResult, [])
        XCTAssertEqual(mockNetworkService.invokedFetchTodosWithResult, [testTaskModel])
        XCTAssertEqual(mockCoreDataService.invokedCreateTaskArrayTasks, [testTaskModel])
        XCTAssertEqual(mockPresenter.invokedDidRetrieveTodoTodos, [testTask])
        XCTAssertEqual(mockPresenter.invokedDidRetrieveTodoTodos[0].id, testTask.id)
        XCTAssertEqual(mockPresenter.invokedDidRetrieveTodoTodos[0].title, testTask.title)
        XCTAssertEqual(mockPresenter.invokedDidRetrieveTodoTodos[0].desc, testTask.desc)
        XCTAssertEqual(mockPresenter.invokedDidRetrieveTodoTodos[0].completed, testTask.completed)
        XCTAssertEqual(mockPresenter.invokedDidRetrieveTodoTodos[0].createdAt, testTask.createdAt)
    }
    
    func testRetrieveTodosWithNetworkServiceError() async throws {
        // Given
        mockCoreDataService.invokedFetchTasksResult = []
        mockCoreDataService.invokedFetchTasksResultSaved = []
        mockNetworkService.invokedFetchTodosWithResult = []
        let errorDescription = NSError(domain: "Test", code: -1).localizedDescription
        mockNetworkService.invokedFetchTodosError = NSError(domain: "Test", code: -1)
        
        // When
        sut.retrieveTodos()
        try await Task.sleep(nanoseconds: 1_000_000_000)
        
        // Then
        XCTAssertTrue(mockCoreDataService.invokedFetchTasks)
        XCTAssertTrue(mockNetworkService.invokedFetchTodos)
        XCTAssertTrue(mockPresenter.invokedOnError)
        
        XCTAssertEqual(mockCoreDataService.invokedFetchTasksCount, 1)
        XCTAssertEqual(mockNetworkService.invokedFetchTodosCount, 1)
        XCTAssertEqual(mockPresenter.invokedOnErrorCount, 1)
        
        XCTAssertEqual(mockCoreDataService.invokedFetchTasksResult, [])
        XCTAssertEqual(mockNetworkService.invokedFetchTodosWithResult, [])
        XCTAssertEqual(mockPresenter.invokedOnErrorMessage, errorDescription)
    }
    
    func testRetrieveTodosWithCoreDataService() {
        // Given
        mockCoreDataService.invokedFetchTasksResult = [testTask]
        mockNetworkService.invokedFetchTodosWithResult = []
        
        // When
        sut.retrieveTodos()
        
        // Then
        XCTAssertTrue(mockCoreDataService.invokedFetchTasks)
        XCTAssertFalse(mockNetworkService.invokedFetchTodos)
        XCTAssertTrue(mockPresenter.invokedDidRetrieveTodo)
        
        XCTAssertEqual(mockCoreDataService.invokedFetchTasksCount, 1)
        XCTAssertEqual(mockNetworkService.invokedFetchTodosCount, 0)
        XCTAssertEqual(mockPresenter.invokedDidRetrieveTodoCount, 1)
        XCTAssertEqual(mockCoreDataService.invokedFetchTasksResult, [testTask])
        XCTAssertEqual(mockCoreDataService.invokedFetchTasksResult[0].id, testTask.id)
        XCTAssertEqual(mockCoreDataService.invokedFetchTasksResult[0].title, testTask.title)
        XCTAssertEqual(mockCoreDataService.invokedFetchTasksResult[0].desc, testTask.desc)
        XCTAssertEqual(mockCoreDataService.invokedFetchTasksResult[0].completed, testTask.completed)
        XCTAssertEqual(mockCoreDataService.invokedFetchTasksResult[0].createdAt, testTask.createdAt)
        XCTAssertEqual(mockPresenter.invokedDidRetrieveTodoTodos, [testTask])
    }
    
    func testCreateTodo() {
        // Given
        mockCoreDataService.invokedCreateTaskResult = testTask
        
        // When
        sut.createTodo()
        
        // Then
        XCTAssertTrue(mockCoreDataService.invokedCreateTask)
        XCTAssertTrue(mockPresenter.invokedDidAddTodo)
        
        XCTAssertEqual(mockCoreDataService.invokedCreateTaskCount, 1)
        XCTAssertEqual(mockPresenter.invokedDidAddTodoCount, 1)
        
        XCTAssertEqual(mockPresenter.invokedDidAddTodoTask, testTask)
    }
    
    func testDeleteTodo() {
        // Given
        
        // When
        sut.deleteTodo(testTask)
        
        // Then
        XCTAssertTrue(mockCoreDataService.invokedDeleteTask)
        XCTAssertTrue(mockPresenter.invokedDidRemoveTodo)
        
        XCTAssertEqual(mockCoreDataService.invokedDeleteTaskCount, 1)
        XCTAssertEqual(mockPresenter.invokedDidRemoveTodoCount, 1)
        
        XCTAssertEqual(mockCoreDataService.invokedDeleteTaskTask, testTask)
    }
    
    func testToggleTaskCompleted() {
        // Given
        
        // When
        sut.toggleTaskCompleted(testTask)
        
        // Then
        XCTAssertTrue(mockCoreDataService.invokedUpdateTask)
        XCTAssertTrue(mockPresenter.invokedDidToggledTaskCompleted)
        
        XCTAssertEqual(mockCoreDataService.invokedUpdateTaskCount, 1)
        XCTAssertEqual(mockPresenter.invokedDidToggledTaskCompletedCount, 1)
        
        XCTAssertEqual(mockCoreDataService.invokedUpdateTaskTask, testTask)
    }
    
    func testSearchTasksWithText() {
        // Given
        let searchText = "test"
        
        // When
        sut.searchTasks(by: searchText)
        
        // Then
        XCTAssertTrue(mockPresenter.invokedDidSearchedTasks)
        
        XCTAssertEqual(mockPresenter.invokedDidSearchedTasksCount, 1)
        
        XCTAssertEqual(sut.filter, searchText)
    }
    
    func testSearchTaskWithEmptyText() {
        // Given
        let searchText: String = ""
        
        // When
        sut.searchTasks(by: searchText)
        
        // Then
        XCTAssertTrue(mockPresenter.invokedDidSearchedTasks)
        
        XCTAssertEqual(mockPresenter.invokedDidSearchedTasksCount, 1)
        
        XCTAssertNil(sut.filter)
    }
}
