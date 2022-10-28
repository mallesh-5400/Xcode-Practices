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
        image.backgroundColor = UIColor(red: 45/255, green: 60/255, blue: 48/255, alpha: 1)
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
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.backgroundColor = .systemBlue
       // button.titleLabel?.numberOfLines = 0
        button.setTitle("Continue", for: .normal)
        button.isHidden = true
        return button
    }()
    
    lazy var mainStackView2: UIStackView = {
       let stackView = UIStackView(arrangedSubviews: [imagVW, innerStackView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = UIStackView.Alignment.center
        stackView.distribution = UIStackView.Distribution.fill
        stackView.axis = NSLayoutConstraint.Axis.horizontal
        stackView.spacing = 5
        return stackView
    }()
    
    lazy var innerStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [title, subTitle])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = UIStackView.Alignment.fill
        stackView.distribution = UIStackView.Distribution.fill
        stackView.axis = NSLayoutConstraint.Axis.vertical
        return stackView
    }()
    
    lazy var mainStackView1: UIStackView = {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = UIStackView.Alignment.center
        stackView.distribution = UIStackView.Distribution.fill
        stackView.axis = NSLayoutConstraint.Axis.vertical
        stackView.spacing = 5
        stackView.backgroundColor = UIColor.cyan
        return stackView
    }()
    
    
    
    
    private var buttonState: ContinueButtonState = .hidden
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
        setUpNewUI()
        
        //let gesture = UITapGestureRecognizer(target: self, action: #selector(buttonTap))
       // addGestureRecognizer(gesture)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func addViews() {
        addSubview(mainStackView1)
    }
    
    func setUpNewUI() {
        mainStackView1.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        mainStackView1.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        mainStackView1.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        mainStackView1.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        hideButton()
    }
    
    func unhideButton() {
        continueButton.isHidden = false
        buttonState = .unhidden
    }
    
    func hideButton() {
        continueButton.isHidden = true
        buttonState = .hidden
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
      //MARK: - If dont write below line also this function will behave we are expecting
      //  super.setSelected(selected, animated: animated)
        
        if continueButton.isHidden, selected {
            unhideButton()
        } else {
            hideButton()
        }
    }
}

enum ContinueButtonState {
    case hidden
    case unhidden
}
