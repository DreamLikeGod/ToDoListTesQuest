import XCTest
import CoreData
@testable import ToDoListTestQuest

final class TaskDetailViewTests: XCTestCase {
    var sut: TaskDetailView!
    var mockPresenter: MockTaskDetailPresenter!
    var testTask: ToDoTaskEntity!
    
    override func setUp() {
        super.setUp()
        sut = TaskDetailView()
        mockPresenter = MockTaskDetailPresenter()
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
        sut.setupUI()
        
        // Then
        XCTAssertNotNil(sut.scrollView)
        XCTAssertNotNil(sut.contentView)
        XCTAssertNotNil(sut.headView)
        XCTAssertNotNil(sut.titleTaskTextField)
        XCTAssertNotNil(sut.dateTaskLabel)
        XCTAssertNotNil(sut.descriptionTaskTextView)
        XCTAssertNotNil(sut.navigationItem.leftBarButtonItem)
    }
    
    func testHandleBackButtonTapped() {
        // Given
        let title = "Label task"
        let description = "Description Task"
        sut.titleTaskTextField.text = title
        sut.descriptionTaskTextView.text = description
        
        // When
        sut.handleBackButtonTapped()
        
        // Then
        XCTAssertTrue(mockPresenter.invokedExitFromScreen)
        XCTAssertEqual(mockPresenter.invokedExitFromScreenCount, 1)
        XCTAssertEqual(mockPresenter.invokedExitFromScreenParameters?.title, title)
        XCTAssertEqual(mockPresenter.invokedExitFromScreenParameters?.description, description)
    }
    
    func testHandleTapGesture() {
        // Given
        let title = "Label task"
        let description = "Description Task"
        sut.titleTaskTextField.text = title
        sut.descriptionTaskTextView.text = description
        
        // When
        sut.handleTapGesture()
        
        // Then
        XCTAssertTrue(mockPresenter.invokedUpdateTask)
        XCTAssertEqual(mockPresenter.invokedUpdateTaskCount, 1)
        XCTAssertEqual(mockPresenter.invokedUpdateTaskParameters?.title, title)
        XCTAssertEqual(mockPresenter.invokedUpdateTaskParameters?.description, description)
        XCTAssertFalse(sut.isEditing)
    }
    
    func testShowTaskDetailWithTitleAndDescriptionTask() {
        // Given
        // When
        sut.showTaskDetail(testTask)
        
        // Then
        XCTAssertEqual(sut.titleTaskTextField.text, testTask?.title)
        XCTAssertEqual(sut.descriptionTaskTextView.text, testTask?.desc)
        XCTAssertNotEqual(sut.descriptionTaskTextView.textColor, .lightGray)
        XCTAssertEqual(sut.dateTaskLabel.text, testTask?.createdAt?.formattedDateString())
    }
    
    func testShowTaskDetailWithTitleTask() {
        // Given
        let newTask = testTask!
        newTask.desc = ""
        let checkingString = "Опиши задачу..."
        
        // When
        sut.showTaskDetail(newTask)
        
        // Then
        XCTAssertEqual(sut.titleTaskTextField.placeholder, nil)
        XCTAssertEqual(sut.titleTaskTextField.text, newTask.title)
        XCTAssertEqual(sut.descriptionTaskTextView.text, checkingString)
        XCTAssertEqual(sut.descriptionTaskTextView.textColor, .lightGray)
        XCTAssertEqual(sut.dateTaskLabel.text, testTask?.createdAt?.formattedDateString())
    }
    
    func testShowTaskDetailWithDescriptionTask() {
        // Given
        let newTask = testTask!
        newTask.title = ""
        let checkingString = "Название задачи"
        
        // When
        sut.showTaskDetail(newTask)
        
        // Then
        XCTAssertEqual(sut.titleTaskTextField.placeholder, checkingString)
        XCTAssertEqual(sut.titleTaskTextField.text, "")
        XCTAssertEqual(sut.descriptionTaskTextView.text, newTask.desc)
        XCTAssertNotEqual(sut.descriptionTaskTextView.textColor, .lightGray)
        XCTAssertEqual(sut.dateTaskLabel.text, testTask?.createdAt?.formattedDateString())
    }
    
    func testTextViewDidBeginEditingWithPlaceholder() {
        // Given
        sut.descriptionTaskTextView.textColor = .lightGray
        sut.descriptionTaskTextView.text = "Опиши задачу..."
        
        // When
        sut.textViewDidBeginEditing(sut.descriptionTaskTextView)
        
        // Then
        XCTAssertEqual(sut.descriptionTaskTextView.text, "")
        XCTAssertEqual(sut.descriptionTaskTextView.textColor, .descriptionColor)
    }
    
    func testTextViewDidBeginEditingWithText() {
        // Given
        let testString = "Test Description for task"
        sut.descriptionTaskTextView.textColor = .descriptionColor
        sut.descriptionTaskTextView.text = testString
        
        // When
        sut.textViewDidBeginEditing(sut.descriptionTaskTextView)
        
        // Then
        XCTAssertEqual(sut.descriptionTaskTextView.text, testString)
        XCTAssertEqual(sut.descriptionTaskTextView.textColor, .descriptionColor)
    }
    
    func testTextViewDidEndEditingWithText() {
        // Given
        let testString = "Test Description for task"
        sut.descriptionTaskTextView.text = testString
        
        // When
        sut.textViewDidBeginEditing(sut.descriptionTaskTextView)
        
        // Then
        XCTAssertEqual(sut.descriptionTaskTextView.text, testString)
        XCTAssertEqual(sut.descriptionTaskTextView.textColor, .descriptionColor)
    }
    
    func testTextFieldDidEndEditingWithText() {
        // Given
        let testString = "Test string beginner"
        sut.titleTaskTextField.text = testString
        
        // When
        sut.textFieldDidEndEditing(sut.titleTaskTextField)
        
        // Then
        XCTAssertEqual(sut.titleTaskTextField.text, testString)
        XCTAssertEqual(sut.titleTaskTextField.placeholder, nil)
    }
    
}
