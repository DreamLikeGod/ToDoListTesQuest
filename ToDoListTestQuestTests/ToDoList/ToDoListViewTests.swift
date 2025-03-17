import XCTest
import CoreData
@testable import ToDoListTestQuest

final class ToDoListViewTests: XCTestCase {
    var sut: ToDoListView!
    var mockPresenter: MockToDoListPresenter!
    var testTask: ToDoTaskEntity!
    
    override func setUp() {
        super.setUp()
        sut = ToDoListView()
        mockPresenter = MockToDoListPresenter()
        sut.presenter = mockPresenter
        
        testTask = NSManagedObject(entity: ToDoListTestQuest.ToDoTaskEntity.entity(), insertInto: nil) as! ToDoListTestQuest.ToDoTaskEntity
        testTask.id = Int64(1)
        testTask.title = "Test"
        testTask.desc = "TestDesc"
        testTask.completed = false
        testTask.createdAt = Date()
        
        sut.loadViewIfNeeded()
    }
    
    override func tearDown() {
        sut = nil
        mockPresenter = nil
        testTask = nil
        super.tearDown()
    }
    
    func testViewSetup() {
        // Given
        // When
        sut.setupView()
        // Then
        XCTAssertNotNil(sut.titleLabel)
        XCTAssertNotNil(sut.searchBar)
        XCTAssertNotNil(sut.footerView)
        XCTAssertNotNil(sut.taskCounter)
        XCTAssertNotNil(sut.createTaskButton)
        XCTAssertNotNil(sut.tableView)
        XCTAssertTrue(sut.tableView.delegate === sut)
        XCTAssertTrue(sut.tableView.dataSource === sut)
    }
    
    func testViewWillAppear() {
        // Given
        // When
        sut.viewWillAppear(true)

        // Then
        XCTAssertTrue(mockPresenter.invokedViewWillAppear)
        
        XCTAssertEqual(mockPresenter.invokedViewWillAppearCount, 1)
    }
    
    func testSetupContextMenu() {
        // Given
        // When
        sut.setupContextMenu()
        
        // Then
        XCTAssertNotNil(sut.tableView.contextMenuInteraction)
    }
    
    func testHandleCreateTask() {
        // Given
        // When
        sut.handlerCreateTask()
        
        // Then
        XCTAssertTrue(mockPresenter.invokedAddTodo)
        
        XCTAssertEqual(mockPresenter.invokedAddTodoCount, 1)
    }
    
    func testShowToDoList() {
        // Given
        let counts = 1
        
        // When
        sut.showToDoList(with: [testTask])
        
        // Then
        XCTAssertEqual(sut.tasks, [testTask])
        XCTAssertEqual(sut.tasks.count, counts)
        XCTAssertEqual(sut.taskCounter.text, "1 Задач")
        
        XCTAssertEqual(sut.tableView.visibleCells.count, counts)
        
        let cell = sut.tableView.visibleCells.first as? ToDoListTestQuest.ToDoListViewTableViewCell
        XCTAssertEqual(cell?.titleLabel.text, testTask.title!)
        XCTAssertEqual(cell?.descriptionLabel.text, testTask.desc!)
        XCTAssertEqual(cell?.dateLabel.text, testTask.createdAt!.formattedDateString())
        XCTAssertEqual(cell?.checkboxButton.isSelected, testTask.completed)
    }
    
    func testSearchBarTextDidChange() {
        // Given
        // When
        sut.searchBar(sut.searchBar, textDidChange: "Te")
        
        //Then
        XCTAssertTrue(mockPresenter.invokedSearchTasks)
        
        XCTAssertEqual(mockPresenter.invokedSearchTasksCount, 1)
        
        XCTAssertEqual(mockPresenter.invokedSearchTaskText, "Te")
    }
    
    func testDidSelectRowAt() {
        // Given
        let index = IndexPath(row: 0, section: 0)
        sut.tasks = [testTask]
        
        // When
        sut.tableView(sut.tableView, didSelectRowAt: index)
        
        // Then
        XCTAssertTrue(mockPresenter.invokedToggleTaskCompleted)
        
        XCTAssertEqual(mockPresenter.invokedToggleTaskCompletedCount, 1)
        
        XCTAssertEqual(mockPresenter.invokedToggleTaskCompletedTask, testTask)
    }
    
    func testEmptyTableView() {
        // Given
        // When
        sut.showToDoList(with: [])
        
        // Then
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 0)
    }
    
}
