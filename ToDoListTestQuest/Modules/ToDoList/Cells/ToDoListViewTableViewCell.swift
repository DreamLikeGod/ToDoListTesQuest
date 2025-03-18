//
//  ToDoListViewTableViewCell.swift
//  ToDoListTestQuest
//
//  Created by Егор Ершов on 11.03.2025.
//

import UIKit

class ToDoListViewTableViewCell: UITableViewCell {

    lazy var previewContentView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .titleColor
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.textAlignment = .left
        label.textColor = .descriptionColor
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textColor = .dateColor
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var checkboxButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "circlebadge"), for: .normal)
        button.setImage(UIImage(systemName: "checkmark.circle"), for: .selected)
        button.imageView?.contentMode = .scaleAspectFit
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var cellContstraints: [NSLayoutConstraint] = []
    var previewContraints: [NSLayoutConstraint] = []
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        createView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        titleLabel.text = ""
        descriptionLabel.text = ""
        dateLabel.text = ""
        checkboxButton.isSelected = false
    }
    
    func setupCell(with task: ToDoTaskEntity) {
        descriptionLabel.text = task.desc == "" ? "Нет описания" : task.desc
        dateLabel.text = task.createdAt?.formattedDateString() ?? Date().formattedDateString()
        if task.completed {
            checkboxButton.isSelected = true
            checkboxButton.tintColor = .tintAppColor
            titleLabel.text = ""
            titleLabel.attributedText = NSAttributedString(string: (task.title == "") ? "Нет названия" : task.title!,
                                                     attributes: [NSAttributedString.Key.strikethroughStyle : NSUnderlineStyle.single.rawValue,
                                                                  NSAttributedString.Key.strikethroughColor : UIColor.completedColor.cgColor])
            titleLabel.textColor = .completedColor
            descriptionLabel.textColor = .completedColor
        } else {
            checkboxButton.isSelected = false
            checkboxButton.tintColor = .completedColor
            titleLabel.text = ""
            titleLabel.attributedText = NSAttributedString(string: (task.title == "") ? "Нет названия" : task.title!,
                                                     attributes: [NSAttributedString.Key.strikethroughStyle : NSUnderlineStyle.single.rawValue,
                                                                  NSAttributedString.Key.strikethroughColor : UIColor.clear.cgColor])
            titleLabel.textColor = .titleColor
            descriptionLabel.textColor = .descriptionColor
        }
    }
    
    func createView() {
        backgroundColor = .clear
        selectionStyle = .none
        contentView.backgroundColor = .clear
        
        contentView.addSubview(checkboxButton)
        NSLayoutConstraint.activate([
            checkboxButton.heightAnchor.constraint(equalToConstant: 24),
            checkboxButton.widthAnchor.constraint(equalToConstant: 24),
            checkboxButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            checkboxButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
        ])
        
        contentView.addSubview(previewContentView)
        NSLayoutConstraint.activate([
            previewContentView.topAnchor.constraint(equalTo: contentView.topAnchor),
            previewContentView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            previewContentView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
        
        previewContentView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: previewContentView.topAnchor, constant: 12),
            titleLabel.heightAnchor.constraint(equalToConstant: 22)
        ])
        
        previewContentView.addSubview(descriptionLabel)
        NSLayoutConstraint.activate([
            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 6),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 32)
        ])
        
        previewContentView.addSubview(dateLabel)
        NSLayoutConstraint.activate([
            dateLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            dateLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 6),
            dateLabel.bottomAnchor.constraint(equalTo: previewContentView.bottomAnchor, constant: -12),
            dateLabel.heightAnchor.constraint(equalToConstant: 16)
        ])
        
        cellContstraints = [
            previewContentView.leadingAnchor.constraint(equalTo: checkboxButton.trailingAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: previewContentView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: previewContentView.trailingAnchor)
        ]
        
        previewContraints = [
            previewContentView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: previewContentView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: previewContentView.trailingAnchor, constant: -16)
        ]
        
        dissmissPreview()
    }
    
    func previewCreate() -> UIView {
        NSLayoutConstraint.deactivate(cellContstraints)
        NSLayoutConstraint.activate(previewContraints)
        
        previewContentView.backgroundColor = .systemGray4
        return previewContentView
    }
    
    func dissmissPreview(){
        NSLayoutConstraint.deactivate(previewContraints)
        NSLayoutConstraint.activate(cellContstraints)
        
        previewContentView.backgroundColor = .black
    }
    
}
