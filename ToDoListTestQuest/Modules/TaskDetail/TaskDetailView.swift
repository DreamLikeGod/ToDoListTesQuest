//
//  TaskDetailView.swift
//  ToDoListTestQuest
//
//  Created by Егор Ершов on 08.03.2025.
//

import UIKit

class TaskDetailView: UIViewController  {

    var presenter: TaskDetailPresenterProtocol?
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = true
        return scrollView
    }()
    
    lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var headView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var titleTaskTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = .systemFont(ofSize: 34, weight: .bold)
        textField.textColor = .titleColor
        textField.delegate = self
        return textField
    }()
    
    lazy var dateTaskLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12, weight: .thin)
        label.textColor = .dateColor
        return label
    }()
    
    lazy var descriptionTaskTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.font = .systemFont(ofSize: 16)
        textView.textColor = .descriptionColor
        textView.textContainer.maximumNumberOfLines = 0
        textView.delegate = self
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupUI()
        setupTapGesture()
        setupKeyboardObservers()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        removeKeyboardObservers()
    }
    
    func setupUI() {
        
        view.backgroundColor = .black
        navigationItem.largeTitleDisplayMode = .never
        
        let button = UIButton()
        button.setTitle("Назад", for: .normal)
        button.setTitleColor(.tintAppColor, for: .normal)
        button.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        button.tintColor = .tintAppColor
        button.addTarget(self, action: #selector(handleBackButtonTapped), for: .touchUpInside)
        let backButton = UIBarButtonItem(customView: button)
        navigationItem.leftBarButtonItem = backButton
        
        view.addSubview(scrollView)
        scrollView.frame = view.bounds
        
        scrollView.addSubview(contentView)
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        contentView.addSubview(headView)
        NSLayoutConstraint.activate([
            headView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            headView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            headView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])
        
        headView.addSubview(titleTaskTextField)
        headView.addSubview(dateTaskLabel)
        NSLayoutConstraint.activate([
            titleTaskTextField.topAnchor.constraint(equalTo: headView.topAnchor),
            titleTaskTextField.leadingAnchor.constraint(equalTo: headView.leadingAnchor),
            titleTaskTextField.trailingAnchor.constraint(equalTo: headView.trailingAnchor),
            
            dateTaskLabel.topAnchor.constraint(equalTo: titleTaskTextField.bottomAnchor, constant: 8),
            dateTaskLabel.leadingAnchor.constraint(equalTo: headView.leadingAnchor),
            dateTaskLabel.trailingAnchor.constraint(equalTo: headView.trailingAnchor),
            dateTaskLabel.bottomAnchor.constraint(equalTo: headView.bottomAnchor)
        ])
        
        contentView.addSubview(descriptionTaskTextView)
        NSLayoutConstraint.activate([
            descriptionTaskTextView.topAnchor.constraint(equalTo: headView.bottomAnchor, constant: 16),
            descriptionTaskTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descriptionTaskTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            descriptionTaskTextView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
    }
    
    func setupTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }
    
    func setupKeyboardObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(kbWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(kbWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func removeKeyboardObservers() {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc
    func handleBackButtonTapped() {
        presenter?.exitFromScreen(titleTaskTextField.text, descriptionTaskTextView.text)
    }
    @objc
    func handleTapGesture() {
        view.endEditing(true)
        presenter?.updateTask(titleTaskTextField.text, descriptionTaskTextView.text)
    }
    @objc
    func kbWillShow(_ notification: Notification) {
        
    }
    @objc
    func kbWillHide() {
        
    }
    
}

extension TaskDetailView: TaskDetailViewProtocol {
    
    func showTaskDetail(_ from: ToDoTaskEntity) {
        if from.title!.isEmpty {
            self.titleTaskTextField.placeholder = "Название задачи"
        } else {
            self.titleTaskTextField.text = from.title
        }
        self.dateTaskLabel.text = from.createdAt?.formattedDateString()
        if from.desc!.isEmpty {
            self.descriptionTaskTextView.text = "Опиши задачу..."
            self.descriptionTaskTextView.textColor = .lightGray
        } else {
            self.descriptionTaskTextView.text = from.desc
        }
    }
     
}

extension TaskDetailView: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == .lightGray {
            textView.textColor = .descriptionColor
            textView.text = ""
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text == nil {
            textView.textColor = .lightGray
            textView.text = "Опиши задачу..."
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
    }
}

extension TaskDetailView: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text == nil {
            textField.placeholder = "Название задачи"
        }
    }
}
