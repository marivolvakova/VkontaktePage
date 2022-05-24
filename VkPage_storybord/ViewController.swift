//
//  ViewController.swift
//  VkPage_storybord
//
//  Created by Мария Вольвакова on 23.05.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupLayout()
        setupView()
    }
    // MARK: - Creation Images

    lazy var photoImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "photo")
        image.widthAnchor.constraint(equalToConstant: 80).isActive = true
        image.heightAnchor.constraint(equalToConstant: 80).isActive = true
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 40
        return image
    }()
    
    lazy var onlineImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "iphone.homebutton")
        image.tintColor = .lightGray
        image.layer.masksToBounds = true
        image.heightAnchor.constraint(equalToConstant: 17).isActive = true
        return image
    }()
    
    lazy var viewLine: UIView = {
        let view = UIView()
        view.backgroundColor = .secondaryLabel
        view.heightAnchor.constraint(equalToConstant: 2).isActive = true
        view.layer.masksToBounds = true
        return view
    }()
    
    // MARK: - CREATION LABLES
    
    lazy var nameLable: UILabel = {
        let name = UILabel()
        name.font = .systemFont(ofSize: 18, weight: .semibold)
        name.textColor = .white
        name.text = "Мария Вольвакова"
        return name
    }()
    lazy var statusLable: UILabel = {
        let status = UILabel()
        status.text = "Установить статус"
        status.textColor = .systemCyan
        status.font = .systemFont(ofSize: 16, weight: .medium)
        return status
    }()
    lazy var onlineLable: UILabel = {
        let online = UILabel()
        online.text = "online"
        online.textColor = .lightGray
        online.font = .systemFont(ofSize: 15, weight: .medium)
        return online
    }()
    
    // MARK: - Creation Buttons
    
    lazy var buttonEditing: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Редактировать", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .medium)
        button.heightAnchor.constraint(equalToConstant: 45).isActive = true
        button.backgroundColor = .secondaryLabel
        button.tintColor = .white
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 10
        return button
    }()
    
    lazy var historyButton = createHorizontalButtons(with: "История", and: "camera")
    lazy var noteButton = createHorizontalButtons(with: "Запись", and: "square.and.pencil")
    lazy var photoButton = createHorizontalButtons(with: "Фото", and: "photo")
    lazy var clipButton = createHorizontalButtons(with: "Клип", and: "play.rectangle")
    
    
    lazy var cityButton = createVerticalButton(with: "Город: Москва", colour: .lightGray, iconImage: "house")
    lazy var followersButton = createVerticalButton(with: "35 подписчиков", colour: .lightGray, iconImage: "dot.radiowaves.up.forward")
    lazy var jobButton = createVerticalButton(with: "Указать место работы", colour: .systemCyan, iconImage: "briefcase")
    lazy var presentButton = createVerticalButton(with: "Получить подарок", colour: .systemPurple, iconImage: "staroflife")
    lazy var moreButton = createVerticalButton(with: "Подробная информация", colour: .white, iconImage: "i.circle")
    
    
    
    func createHorizontalButtons(with title: String, and icon: String ) -> UIButton {
        let button = UIButton(type: .system)
        button.layer.masksToBounds = true
        
        button.setTitle(title, for: .normal)
        button.tintColor = .systemCyan
        button.setImage(.init(systemName: icon), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 10, weight: .semibold)
        
        button.configuration = UIButton.Configuration.plain()
        button.configuration?.imagePlacement = .top
        button.configuration?.imagePadding = 10
    
        return button
    }
    
    func createVerticalButton(with title: String, colour: UIColor, iconImage: String) -> UIButton {
        let button = UIButton(type: .system)
        button.layer.masksToBounds = true

        button.setImage(.init(systemName: iconImage), for: .normal)
                button.setTitle(title, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 9, weight: .medium)
        button.tintColor = colour
        
        button.configuration = UIButton.Configuration.plain()
        button.configuration?.imagePadding = 10
        return button
    }

// MARK: - Stacks
    
    lazy var parentStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 30
        return stackView
    }()
    
    lazy var topStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 15
        return stackView
    }()
    
    lazy var inTopStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 0
        stackView.distribution = .fillProportionally
        stackView.alignment = .leading
        return stackView
    }()
    
    lazy var onlineIconeStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.distribution = .fill
        stackView.alignment = .fill
        return stackView
    }()
    
    lazy var horizontalButtonsStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        
        return stackView
    }()
    
    lazy var verticalButtonsStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.alignment = .leading
        
        return stackView
    }()

    
    // MARK: - Hierarchy
    
    func setupHierarchy() {
        view.addSubview(parentStack)
        
        parentStack.addArrangedSubview(topStack)
        topStack.addArrangedSubview(photoImage)
        topStack.addArrangedSubview(inTopStack)
        
        inTopStack.addArrangedSubview(nameLable)
        inTopStack.addArrangedSubview(statusLable)
        inTopStack.addArrangedSubview(onlineIconeStack)

        onlineIconeStack.addArrangedSubview(onlineLable)
        onlineIconeStack.addArrangedSubview(onlineImage)
        
        parentStack.addArrangedSubview(buttonEditing)
        parentStack.addArrangedSubview(horizontalButtonsStack)
        parentStack.addArrangedSubview(viewLine)
        
        horizontalButtonsStack.addArrangedSubview(historyButton)
        horizontalButtonsStack.addArrangedSubview(noteButton)
        horizontalButtonsStack.addArrangedSubview(photoButton)
        horizontalButtonsStack.addArrangedSubview(clipButton)
        
        parentStack.addArrangedSubview(verticalButtonsStack)
        verticalButtonsStack.addArrangedSubview(cityButton)
        verticalButtonsStack.addArrangedSubview(followersButton)
        verticalButtonsStack.addArrangedSubview(jobButton)
        verticalButtonsStack.addArrangedSubview(presentButton)
        verticalButtonsStack.addArrangedSubview(moreButton)
        
    }
    
    func setupLayout() {
        parentStack.translatesAutoresizingMaskIntoConstraints = false
        
        parentStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 18).isActive = true
        parentStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -18).isActive = true
        parentStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
    }
    
    func setupView() {
        view.backgroundColor = .black
    }
    

}



