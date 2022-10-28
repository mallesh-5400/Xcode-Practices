//
//  FirstViewController.swift
//  Xcode-Practicess
//
//  Created by user227716 on 10/20/22.
//

import UIKit

class SecondViewController: UIViewController {
    
    lazy var registerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Go to tableview VC lsjdlsdjflksdjflksflkdsfjlskjfldskfjslfjslkfjdlkfjdslkfjldjfladsfjldksjf", for: .normal)
        button.backgroundColor = .blue
        button.subtitleLabel?.numberOfLines = 0
       // button.heightAnchor.constraint(equalToConstant: 40).isActive = true
       // button.widthAnchor.constraint(equalToConstant: 80).isActive = true
        button.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
        button.setTitleColor(.systemGreen, for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(registerButton)
        setUpConstraints()
        registerButton.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
    }
    
    func setUpConstraints() {
        registerButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        registerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        registerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
    }
    
    @objc func tapButton() {
       // let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        //let ThirdViewController = storyboard.instantiateViewController(withIdentifier: "ThirdViewController") as! ThirdViewController
        //self.navigationController?.pushViewController(ThirdViewController, animated: true)
        
        let thirdVC = ThirdViewController()
        thirdVC.navigationController?.isToolbarHidden = false
       self.navigationController?.pushViewController(thirdVC, animated: true)
        //secVC.modalPresentationStyle = .fullScreen
       // present(secVC, animated: true)
        //show(secVC, sender: self)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
