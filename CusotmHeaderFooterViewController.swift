//
//  ViewController.swift
//  FillTableViewWithAPIData
//
//  Created by user226203 on 9/22/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    private let tableView = UITableView()
    private var safeArea: UILayoutGuide!
    
    private let names1 = ["Ramu", "Shyamu", "Mohan", "Maadhava"]
    private let profession1 = ["Student", "iOS developer", "Hard worker", "God"]
   
    private let names2 = ["Ramu2", "Shyamu2", "Mohan2", "Maadhava2"]
    private let profession2 = ["Student", "iOS developer", "Hard worker", "God"]
    
    private var sectionTitleData1:[Int: [String]] = [:]
    private var sectionSubtitleData2:[Int: [String]] = [:]
    
    private var dataArray = [AmiiboModel]()
    private let titleArray = ["Section", "Section", "Section", "Section"]
    private let countArray = [1, 2, 3, 4]
    
    private lazy var tableViewHeaderView: UILabel = {
        let label = UILabel()
        label.numberOfLines = .zero
        label.translatesAutoresizingMaskIntoConstraints = false
        label.heightAnchor.constraint(equalToConstant: 20).isActive = true
        label.font = UIFont.boldSystemFont(ofSize: 30.0)
        return label
    }()
    
    private lazy var tableViewFooterrView: UILabel = {
        let label = UILabel()
        label.numberOfLines = .zero
        label.translatesAutoresizingMaskIntoConstraints = false
        label.heightAnchor.constraint(equalToConstant: 20).isActive = true
        label.font = UIFont.boldSystemFont(ofSize: 30.0)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        safeArea = view.layoutMarginsGuide
        
        //MARK: - Get API data here
        
       
            NetworkHandler.shared.getAPIData() {
                [weak self] dataModel in
                DispatchQueue.main.async {
                    self?.dataArray = dataModel
                    self?.tableView.reloadData()
                }
            }
        
        
        //tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
        setUpTableViw()
        
        //MARK:- TableView Maim header title
        
        tableView.tableHeaderView = tableViewHeaderView
        tableView.tableFooterView = tableViewFooterrView
        
        //MARK: - Register Cusotm Header and Footer
        
        tableView.register(CustomHeaderAndFooter.self, forHeaderFooterViewReuseIdentifier: "sectionHeaderAndFooter")
        
        //MARK: - Setting Section Data
        
        sectionTitleData1 = [0: names1, 1: names2]
        sectionSubtitleData2 = [0: profession1, 2: profession2]
        
    }
    
    func setUpTableViw() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        tableView.addSubview(tableViewHeaderView)
        tableView.addSubview(tableViewFooterrView)
        
        tableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor).isActive = true
        
        tableViewHeaderView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
        tableViewHeaderView.centerXAnchor.constraint(equalTo: tableView.centerXAnchor).isActive = true
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionTitleData1[section]?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        
       /* let nameObject = names[indexPath.row]
        let professionObject = profession[indexPath.row]
        cell.title.text = nameObject
        cell.subTitle.text = professionObject*/
        
       // let arrayData = dataArray[indexPath.row]
        cell.title.text = sectionTitleData1[indexPath.section]?[indexPath.row]
        cell.subTitle.text = sectionSubtitleData2[indexPath.section]?[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "List of Players"
//    }
//
//    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
//        return "End of the list"
//    }
//
    
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let action = UIContextualAction(style: .destructive, title: "Delete") {action, view, completionHandler in
            
            self.dataArray.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .bottom)
            
            completionHandler(true)
        }
        return UISwipeActionsConfiguration(actions: [action])
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let trailingAction = UIContextualAction(style: .destructive, title: "Trailing Delete") {
            action, view, completionHandler in
            
            self.dataArray.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
            
        }
        return UISwipeActionsConfiguration(actions: [trailingAction])
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
       let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "sectionHeaderAndFooter") as? CustomHeaderAndFooter
       view?.titleLabel.text = titleArray[section]
       view?.countLabel.text = String(countArray[section])
       
       return view
       
   }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return titleArray.count
    }

}
