//
//  ViewController.swift
//  whatsAppChatProject
//
//  Created by Luiza Menezes Vieira de Souza on 10/03/22.
//

import UIKit

class ViewController: UITableViewController {
    
    var chat: [ChatElements] = [ChatElements]()

    override func viewDidLoad() {
        super.viewDidLoad()
        createArrayOfChats()
        tableView.register(WhatsAppCell.self, forCellReuseIdentifier: WhatsAppCell.identifier)
        tableView.dataSource = self
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WhatsAppCell.identifier, for: indexPath) as? WhatsAppCell
        let currentLastItem = chat[indexPath.row]
        cell!.chat = currentLastItem
        return cell!
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chat.count
    }
    
    func createArrayOfChats() {
        chat.append(ChatElements(contactName: "Paul MacCartney", lastMessage: "Oi, tudo bem?", lastMessageTime: "10:30"))
        chat.append(ChatElements(contactName: "Calvin Klein", lastMessage: "Oi!", lastMessageTime: "05:08"))
        chat.append(ChatElements(contactName: "Rodolfo Valentino", lastMessage: "E aí?", lastMessageTime: "11:46"))
        
    }
}

