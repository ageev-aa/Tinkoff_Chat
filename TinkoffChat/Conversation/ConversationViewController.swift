//
//  ConversationViewController.swift
//  TinkoffChat
//
//  Created by Aleksandr on 08.10.2018.
//  Copyright © 2018 Aleksandr. All rights reserved.
//

import UIKit


class ConversationViewController: UITableViewController {
    
    
    var messages: [MessageModel] = MessageModel.messages

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 44
    }
    
    // MARK: - UITableViewDataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(messages.count)
        return messages.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var identifier: String
        let message = self.messages[indexPath.row]
        if (message.isIncoming){
            identifier = "IncomingMessageCell"
            let dequeuedCell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! IncomingMessageTableViewCell
            dequeuedCell.configureCell(configuration: message)
            return dequeuedCell
        } else {
            identifier = "OutgoingMessageCell"
            let dequeuedCell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! OutgoingMessageTableViewCell
            dequeuedCell.configureCell(configuration: message)
            return dequeuedCell
        }
    }
    
    
    // MARK: - UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
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
