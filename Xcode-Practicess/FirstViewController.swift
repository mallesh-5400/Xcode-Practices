//
//  FirstViewController.swift
//  Xcode-Practicess
//
//  Created by user227716 on 10/20/22.
//

import UIKit

class FirstViewController: UIViewController {
    
    private var loginURL: String?
    
    lazy var registerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Login", for: .normal)
        button.backgroundColor = .blue
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.widthAnchor.constraint(equalToConstant: 150).isActive = true
        button.setTitleColor(.systemGreen, for: .normal)
        //button.layer.borderWidth = 2
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 20
        return button
    }()
    
    lazy var email: UITextField = {
       let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.heightAnchor.constraint(equalToConstant: 40).isActive = true
        text.placeholder = "Email Id"
        text.layer.borderWidth = 1
        text.layer.borderColor = .init(red: 150/255, green: 40/255, blue: 100/255, alpha: 1)
        text.clearButtonMode = .always
       // text.borderStyle = .bezel
        return text
    }()

    lazy var password: UITextField = {
       let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.heightAnchor.constraint(equalToConstant: 40).isActive = true
        text.placeholder = "password"
        text.layer.borderWidth = 1
        text.rightViewMode = .always
        text.layer.borderColor = .init(red: 150/255, green: 40/255, blue: 100/255, alpha: 1)
        text.clearButtonMode = .whileEditing
        
        return text
    }()
    
    lazy var errorLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isHidden = true
        return label
    }()
    
    private lazy var stackView: UIStackView = {
       let stack = UIStackView(arrangedSubviews: [email, password, errorLabel])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 5
        stack.axis = .vertical
        stack.distribution = .fill
        return stack
    }()
    
    private var emailText: String {
        return email.text ?? " "
    }
    
    private var passwordText: String {
        return password.text ?? " "
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(registerButton)
        view.addSubview(stackView)
        setUpConstraints()
        registerButton.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
    }
//    override func viewWillAppear(_ animated: Bool) {
//        email.text = ""
//        password.text = ""
//
//        print("viewWillAppear Called")
//    }
//
    override func viewDidAppear(_ animated: Bool) {
        email.text = ""
        password.text = ""
        errorLabel.isHidden = true
        print("viewDidAppear Called")
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        print("view will disappear called")
    }
    override func viewLayoutMarginsDidChange() {
        super.viewLayoutMarginsDidChange()
        
        print(#function)
    }
    func setUpConstraints() {
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60).isActive = true
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        registerButton.centerXAnchor.constraint(equalTo: stackView.centerXAnchor).isActive = true
        registerButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 40).isActive = true
       
    }
    
    @objc func tapButton() {
        

//        if !emailText.validateText(validate: .email) {
//            errorLabel.isHidden = false
//            errorLabel.text = "Email Id is not in correct format"
//            return
//        }
//
//        if !passwordText.validateText(validate: .password) {
//            errorLabel.isHidden = false
//            errorLabel.text = "Password is not in correct format"
//            return
//        }
        
        
        generateURLLink(emailId: emailText, password: passwordText)
        
        userCredentialsCorrect() {
            model in
            DispatchQueue.main.async { [weak self] in
                guard let model = model else {
                    debugPrint("No such login credentials")
                    return
                }
            
                if self?.emailText == model[0].color, self?.passwordText == model[0].manufacturer {
                    let secVC = SecondViewController()
                    self?.navigationController?.pushViewController(secVC, animated: true)
                } else {
                    let alerVC = UIAlertController(title: "Warning", message: "No Such User Found. Please do register", preferredStyle: .alert)
                    alerVC.addAction(UIAlertAction(title: "Ok", style: .cancel))
                    self?.present(alerVC, animated: true)
                }
            }
        }
       
        if !emailText.validateText(validate: .email) {
            errorLabel.isHidden = false
            errorLabel.text = "Email Id is not in correct format"
            return
        }
        
        if !passwordText.validateText(validate: .password) {
            errorLabel.isHidden = false
            errorLabel.text = "Password is not in correct format"
            return
        }
        
       let secVC = SecondViewController()
       self.navigationController?.pushViewController(secVC, animated: true)
//        //secVC.modalPresentationStyle = .fullScreen
//       // present(secVC, animated: true)
//        //show(secVC, sender: self)
    }

    
    
    //MARK: - Here query items will be considered as optional parameters. If we wrong value to them then the result will be displayed with all the records. If we give correct values then only it will give specific result otherwise it wont.
    
    func generateURLLink(emailId: String, password: String) {
        loginURL = "\(Endpoints.baseUrl)\(Endpoints.smartPhonePath)?color=\(emailId)&&manufacturer=\(password)"
    }
    
    func userCredentialsCorrect(apiDataModel: @escaping([PhoneDetails]?) -> Void) {
        
        NetworkManager.shared.getUserAPIData(url: URL(string: loginURL ?? ""),resultType: PhoneModel.self) {
            result in
            apiDataModel(result?.data)
        }
    }


}
