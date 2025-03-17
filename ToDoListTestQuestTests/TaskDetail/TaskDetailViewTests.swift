//import XCTest
//@testable import ToDoListTestQuest
//
//final class TaskDetailViewTests: XCTestCase {
//    var view: TaskDetailView!
//    var mockPresenter: MockTaskDetailPresenter!
//    var testTask: ToDoTaskEntity!
//    
//    override func setUp() {
//        super.setUp()
//        view = TaskDetailView()
//        mockPresenter = MockTaskDetailPresenter()
//        view.presenter = mockPresenter
//        
//        testTask = ToDoTaskEntity()
//        testTask.title = "Test Task"
//        testTask.desc = "Test Description"
//        
//        view.loadViewIfNeeded()
//    }
//    
//    override func tearDown() {
//        view = nil
//        mockPresenter = nil
//        testTask = nil
//        super.tearDown()
//    }
//    
//    func testViewSetup() {
//        // Then
//        XCTAssertNotNil(view.titleTaskTextField)
//        XCTAssertNotNil(view.dateTaskLabel)
//        XCTAssertNotNil(view.descriptionTaskTextView)
//        XCTAssertEqual(view.titleTaskTextField.placeholder, "Название задачи")
//        XCTAssertEqual(view.descriptionTaskTextView.text, "Опиши задачу...")
//    }
//    
//    func testViewDidLoad() {
//        // When
//        view.viewDidLoad()
//        
//        // Then
//        XCTAssertTrue(mockPresenter.viewDidLoadCalled)
//    }
//    
//    func testShowTaskDetail() {
//        // When
//        view.showTaskDetail(testTask)
//        
//        // Then
//        XCTAssertEqual(view.titleTaskTextField.text, testTask.title)
//        XCTAssertEqual(view.descriptionTaskTextView.text, testTask.desc)
//    }
//    
//    func testTextViewDidBeginEditing() {
//        // Given
//        view.descriptionTaskTextView.text = "Введите описание задачи"
//        
//        // When
//        view.textViewDidBeginEditing(view.descriptionTaskTextView)
//        
//        // Then
//        XCTAssertEqual(view.descriptionTaskTextView.text, "")
//    }
//    
//    func testTextViewDidEndEditing() {
//        // Given
//        view.descriptionTaskTextView.text = ""
//        
//        // When
//        view.textViewDidEndEditing(view.descriptionTaskTextView)
//        
//        // Then
//        XCTAssertEqual(view.descriptionTaskTextView.text, "Введите описание задачи")
//    }
//    
//    func testTextFieldShouldReturn() {
//        // When
//        let result = view.textFieldShouldReturn(view.titleTaskTextField)
//        
//        // Then
//        XCTAssertTrue(result)
//        XCTAssertFalse(view.titleTaskTextField.isFirstResponder)
//    }
//    
//    func testKeyboardHandling() {
//        // Given
//        let keyboardHeight: CGFloat = 300
//        let keyboardFrame = CGRect(x: 0, y: 0, width: 375, height: keyboardHeight)
//        let notification = Notification(name: UIResponder.keyboardWillShowNotification,
//                                     object: nil,
//                                     userInfo: [UIResponder.keyboardFrameEndUserInfoKey: NSValue(cgRect: keyboardFrame)])
//        
//        // When
//        view.kbWillShow(notification)
//        
//        // Then
//        XCTAssertEqual(view.view.frame.origin.y, -keyboardHeight)
//        
//        // When
//        view.kbWillHide()
//        
//        // Then
//        XCTAssertEqual(view.view.frame.origin.y, 0)
//    }
//} 
