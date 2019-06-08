//
//  SettingsController.swift
//  MatchFireStore
//
//  Created by Shawn Taikratoke on 6/8/19.
//  Copyright © 2019 Shawn Taikratoke. All rights reserved.
//

import UIKit

class SettingsController: UITableViewController {
    
    lazy var image1Button = createButton()
    lazy var image2Button = createButton()
    lazy var image3Button = createButton()

    
    func createButton() -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle("Select Photo", for: .normal)
        button.backgroundColor = .white
        return button
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavagationItems()
        tableView.backgroundColor = UIColor(white: 0.95, alpha: 1)
        tableView.tableFooterView = UIView()
    }
    
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView()
        header.backgroundColor = .blue
        
        
        header.addSubview(image1Button)
        let padding: CGFloat = 16
        image1Button.anchor(top: header.topAnchor, leading: header.leadingAnchor, bottom: header.bottomAnchor, trailing: nil, padding: .init(top: padding, left: padding, bottom: padding, right: 0))
        image1Button.widthAnchor.constraint(equalTo: header.widthAnchor, multiplier: 0.45).isActive = true
        return header
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 300
    }
    
    fileprivate func setupNavagationItems() {
        navigationItem.title = "Settings"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(handleCancel))
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(handleCancel)),
            UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(handleCancel))
        ]
    }
    
    @objc fileprivate func handleCancel(){
        dismiss(animated: true)
    }
}
