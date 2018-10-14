//
//  ConversationsListViewController.swift
//  TinkoffChat
//
//  Created by Aleksandr on 04.10.2018.
//  Copyright © 2018 Aleksandr. All rights reserved.
//

import UIKit

class ConversationsListViewController: UITableViewController, ThemesViewControllerDelegate {

    @IBAction func showThemeViewControllerAction(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let themeViewController = storyboard.instantiateViewController(withIdentifier: "themeViewController") as! ThemesViewController
        themeViewController.delegate = self
        self.present(themeViewController, animated: true, completion: nil)
    }
    
    var allConversations: [[ConversationModel]] = [ConversationModel.onlineConversations, ConversationModel.historyConversations]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    
    // MARK: - UITableViewDataSource
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.allConversations.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.allConversations[section].count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "Online" : "Offline"
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "ConversationCell"
        let dequeuedCell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! ConversationsTableViewCell
        dequeuedCell.configureCell(configuration: self.allConversations[indexPath.section][indexPath.row])
        return dequeuedCell
    }
    
    // MARK: - UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "conversationViewController") as! ConversationViewController
        
        navigationController?.pushViewController(vc,animated: true)
    }
    
    // MARK: - ThemesViewControllerDelegate
    
    func themesViewController(_ controller: ThemesViewController!, didSelectTheme selectedTheme: UIColor!) {
        if let color = selectedTheme{
            self.view.backgroundColor = color
        }
    }
}
