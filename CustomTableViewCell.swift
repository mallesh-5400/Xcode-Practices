//
//  CustomTableViewCell.swift
//  FillTableViewWithAPIData
//
//  Created by user226203 on 9/23/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    lazy var imagVW:UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .red
        image.heightAnchor.constraint(equalToConstant: 40).isActive = true
        image.widthAnchor.constraint(equalToConstant: 40).isActive = true
        return image
    }()
    
    lazy var title:UILabel = {
       let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.numberOfLines = 0
        return title
    }()
    
    lazy var subTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    lazy var continueButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 80).isActive = true
        button.heightAnchor.constraint(equalToConstant: 30).isActive = true
        button.backgroundColor = .systemBlue
        button.isHidden = true
        return button
    }()

//    override func awakeFromNib() {
//        super.awakeFromNib()
//       addViews()
//       setUpUI()
//    }
    
    private var buttonState: ContinueButtonState = .hidden
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
        setUpUI()
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(buttonTap))
        addGestureRecognizer(gesture)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func addViews() {
        addSubview(imagVW)
        addSubview(title)
        addSubview(subTitle)
        addSubview(continueButton)
    }
    func setUpUI() {
        imagVW.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        imagVW.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        imagVW.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
       // imagVW.bottomAnchor
       
        
        title.leadingAnchor.constraint(equalTo: trailingAnchor, constant: 50).isActive = true
        title.topAnchor.constraint(equalTo: topAnchor).isActive = true
        title.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        title.heightAnchor.constraint(greaterThanOrEqualToConstant: 20).isActive = true
        
        subTitle.leadingAnchor.constraint(equalTo: title.leadingAnchor).isActive = true
        subTitle.trailingAnchor.constraint(equalTo: title.trailingAnchor).isActive = true
        subTitle.topAnchor.constraint(equalTo: title.bottomAnchor).isActive = true
        //subTitle.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -5).isActive = true
        
        hideButton()
        
    }
    
    func unhideButton() {
        continueButton.isHidden = false
        continueButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        continueButton.topAnchor.constraint(equalTo: subTitle.bottomAnchor, constant: 5).isActive = true
        continueButton.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        buttonState = .unhidden
    }
    
    func hideButton() {
        continueButton.isHidden = true
        continueButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = false
        continueButton.topAnchor.constraint(equalTo: subTitle.bottomAnchor, constant: 5).isActive = false
        continueButton.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = false
        buttonState = .hidden
    }
    
   @objc func buttonTap() {
       buttonState == .hidden ? unhideButton() : hideButton()
    }
    
}

enum ContinueButtonState {
    case hidden
    case unhidden
}
