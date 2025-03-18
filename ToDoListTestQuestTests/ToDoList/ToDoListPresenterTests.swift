import XCTest
import CoreData
@testable import ToDoListTestQuest

final class ToDoListPresenterTests: XCTestCase {
    var sut: ToDoListPresenter!
    var mockView: MockToDoListView!
    var mockInteractor: MockToDoListInteractor!
    var mockRouter: MockToDoListRouter!
    var testTask: ToDoTaskEntity!
    
    override func setUp() {
        super.setUp()
        sut = ToDoListPresenter()
        mockView = MockToDoListView()
        mockInteractor = MockToDoListInteractor()
        mockRouter = MockToDoListRouter()
        
        sut.view = mockView
        sut.interactor = mockInteractor
        sut.router = mockRouter
        
        testTask = NSManagedObject(entity: ToDoListTestQuest.ToDoTaskEntity.entity(), insertInto: nil) as! ToDoListTestQuest.ToDoTaskEntity
        testTask.id = Int64(1)
        testTask.title = "Test"
        testTask.desc = "TestDesc"
        testTask.completed = false
        testTask.createdAt = Date()
    }
    
    override func tearDown() {
        sut = nil
        mockView = nil
        mockInteractor = nil
        mockRouter = nil
        testTask = nil
        super.tearDown()
    }
    
    func testViewWillAppear() {
        // Given
        // When
        sut.viewWillAppear()
        
        // Then
        XCTAssertTrue(mockInteractor.invokedRetrieveTodos)
        
        XCTAssertEqual(mockInteractor.invokedRetrieveTodosCount, 1)
    }
    
    func testShowTodoDetail() {
        // Given
        // When
        sut.showTodoDetail(testTask)
        
        // Then
        XCTAssertTrue(mockRouter.invokedPresentToDoDetailScreen)
        
        XCTAssertEqual(mockRouter.invokedPresentToDoDetailScreenCount, 1)
        
        XCTAssertEqual(mockRouter.invokedPresentToDoDetailScreenTask, testTask)
        XCTAssertEqual(mockRouter.invokedPresentToDoDetailScreenTask.id, testTask.id)
        XCTAssertEqual(mockRouter.invokedPresentToDoDetailScreenTask.title, testTask.title)
        XCTAssertEqual(mockRouter.invokedPresentToDoDetailScreenTask.desc, testTask.desc)
        XCTAssertEqual(mockRouter.invokedPresentToDoDetailScreenTask.completed, testTask.completed)
        XCTAssertEqual(mockRouter.invokedPresentToDoDetailScreenTask.createdAt, testTask.createdAt)
        
        XCTAssertTrue(mockRouter.invokedPresentToDoDetailScreenView === mockView)
        XCTAssertTrue(mockRouter.invokedPresentToDoDetailScreenView === sut.view)
    }
    
    func testAddTodo() {
        // Given
        // When
        sut.addTodo()
        
        // Then
        XCTAssertTrue(mockInteractor.invokedCreateTodo)
        
        XCTAssertEqual(mockInteractor.invokedCreateTodoCount, 1)
    }
    
    func testRemoveTodo() {
        // Given
        mockInteractor.invokedDeleteTodoTask = testTask
        
        // When
        sut.removeTodo(testTask)
        
        // Then
        XCTAssertTrue(mockInteractor.invokedDeleteTodo)
        
        XCTAssertEqual(mockInteractor.invokedDeleteTodoCount, 1)
        XCTAssertEqual(mockInteractor.invokedDeleteTodoTask, testTask)
        XCTAssertEqual(mockInteractor.invokedDeleteTodoTask.id, testTask.id)
        XCTAssertEqual(mockInteractor.invokedDeleteTodoTask.title, testTask.title)
        XCTAssertEqual(mockInteractor.invokedDeleteTodoTask.desc, testTask.desc)
        XCTAssertEqual(mockInteractor.invokedDeleteTodoTask.completed, testTask.completed)
        XCTAssertEqual(mockInteractor.invokedDeleteTodoTask.createdAt, testTask.createdAt)
    }
    
    func testToggleTaskCompleted() {
        // Given
        mockInteractor.invokedToggleTaskCompletedTodo = testTask
        
        // When
        sut.toggleTaskCompleted(testTask)
        
        // Then
        XCTAssertTrue(mockInteractor.invokedToggleTaskCompleted)
        
        XCTAssertEqual(mockInteractor.invokedToggleTaskCompletedCount, 1)
        XCTAssertEqual(mockInteractor.invokedToggleTaskCompletedTodo, testTask)
        XCTAssertEqual(mockInteractor.invokedToggleTaskCompletedTodo.id, testTask.id)
        XCTAssertEqual(mockInteractor.invokedToggleTaskCompletedTodo.title, testTask.title)
        XCTAssertEqual(mockInteractor.invokedToggleTaskCompletedTodo.desc, testTask.desc)
        XCTAssertEqual(mockInteractor.invokedToggleTaskCompletedTodo.completed, testTask.completed)
        XCTAssertEqual(mockInteractor.invokedToggleTaskCompletedTodo.createdAt, testTask.createdAt)
    }
    
    func testSearchTasks() {
        // Given
        let testText = "test"
        
        // When
        sut.searchTasks(by: testText)
        
        // Then
        XCTAssertTrue(mockInteractor.invokedSearchTasks)
        
        XCTAssertEqual(mockInteractor.invokedSearchTasksCount, 1)
        
        XCTAssertEqual(mockInteractor.invokedSearchTasksText, testText)
    }
    
    func testDidAddTodo() {
        // Given
        // When
        sut.didAddTodo(testTask)
        
        // Then
        XCTAssertTrue(mockRouter.invokedPresentToDoDetailScreen)
        
        XCTAssertEqual(mockRouter.invokedPresentToDoDetailScreenCount, 1)
        
        XCTAssertEqual(mockRouter.invokedPresentToDoDetailScreenTask, testTask)
        XCTAssertEqual(mockRouter.invokedPresentToDoDetailScreenTask.id, testTask.id)
        XCTAssertEqual(mockRouter.invokedPresentToDoDetailScreenTask.title, testTask.title)
        XCTAssertEqual(mockRouter.invokedPresentToDoDetailScreenTask.desc, testTask.desc)
        XCTAssertEqual(mockRouter.invokedPresentToDoDetailScreenTask.completed, testTask.completed)
        XCTAssertEqual(mockRouter.invokedPresentToDoDetailScreenTask.createdAt, testTask.createdAt)
        
        XCTAssertTrue(mockRouter.invokedPresentToDoDetailScreenView === mockView)
        XCTAssertTrue(mockRouter.invokedPresentToDoDetailScreenView === sut.view)
    }
    
    func testDidRemoveTodo() {
        // Given
        // When
        sut.viewWillAppear()
        
        // Then
        XCTAssertTrue(mockInteractor.invokedRetrieveTodos)
        
        XCTAssertEqual(mockInteractor.invokedRetrieveTodosCount, 1)
    }
    
    func testDidRetrieveTodos() {
        // Given
        
        // When
        sut.didRetrieveTodos([testTask])
        
        // Then
        XCTAssertTrue(mockView.invokedShowToDoList)
        
        XCTAssertEqual(mockView.invokedShowToDoListCount, 1)
        
        XCTAssertEqual(mockView.invokedShowToDoListTodos, [testTask])
        XCTAssertEqual(mockView.invokedShowToDoListTodos[0], testTask)
        XCTAssertEqual(mockView.invokedShowToDoListTodos[0].id, testTask.id)
        XCTAssertEqual(mockView.invokedShowToDoListTodos[0].title, testTask.title)
        XCTAssertEqual(mockView.invokedShowToDoListTodos[0].desc, testTask.desc)
        XCTAssertEqual(mockView.invokedShowToDoListTodos[0].completed, testTask.completed)
        XCTAssertEqual(mockView.invokedShowToDoListTodos[0].createdAt, testTask.createdAt)
    }
    
    func testDidToggledTaskCompleted() {
        // Given
        // When
        sut.viewWillAppear()
        
        // Then
        XCTAssertTrue(mockInteractor.invokedRetrieveTodos)
        
        XCTAssertEqual(mockInteractor.invokedRetrieveTodosCount, 1)
    }
    
    func testOnError() {
        // Given
        let errorDescription = NSError(domain: "test", code: -1).localizedDescription
        
        // When
        sut.onError(message: errorDescription)
        
        // Then
        XCTAssertTrue(mockView.invokedShowError)
        
        XCTAssertEqual(mockView.invokedShowErrorCount, 1)
        
        XCTAssertEqual(mockView.invokedShowErrorMessage, errorDescription)
    }
    
    func testDidSearchedTasks() {
        // Given
        // When
        sut.viewWillAppear()
        
        // Then
        XCTAssertTrue(mockInteractor.invokedRetrieveTodos)
        
        XCTAssertEqual(mockInteractor.invokedRetrieveTodosCount, 1)
    }
    
}
