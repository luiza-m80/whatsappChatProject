//
//  WhatsAppCell.swift
//  whatsAppChatProject
//
//  Created by Luiza Menezes Vieira de Souza on 11/03/22.
//

import UIKit

protocol WhatsAppCellProtocol {
    func initializer()
    func subViews()
    func addConstraints()
}

extension WhatsAppCellProtocol {
    func initializer() {
        subViews()
        addConstraints()
    }
}

class WhatsAppCell: UITableViewCell {
    
    static let identifier = "WhatsAppCell"
    
    var chat: ChatElements? {
        didSet {
            contactNameLabel.text = chat?.contactName
            contactLastMessage.text = chat?.lastMessage
            contactTimeOfMessage.text = chat?.lastMessageTime
        }
    }
    
    private lazy var contactNameLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var contactLastMessage : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var contactTimeOfMessage: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .right
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var icon: UIImageView = {
        let iconImage = UIImageView(image: UIImage(named: "icon1"))
        iconImage.translatesAutoresizingMaskIntoConstraints = false
        iconImage.contentMode = .scaleAspectFit
        return iconImage
    }()
    
    private lazy var groupNameAndMessage: UIStackView = {
       let stackViewNameAndTime = UIStackView(arrangedSubviews: [contactNameLabel, contactLastMessage])
        stackViewNameAndTime.translatesAutoresizingMaskIntoConstraints = false
        stackViewNameAndTime.spacing = 8
        stackViewNameAndTime.distribution = .fill
        stackViewNameAndTime.alignment = .fill
        stackViewNameAndTime.axis = .vertical
        return stackViewNameAndTime
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
                
        initializer()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }

}
    
extension WhatsAppCell: WhatsAppCellProtocol {
    func subViews() {
        addSubview(icon)
        addSubview(groupNameAndMessage)
        addSubview(contactTimeOfMessage)
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            
            icon.centerYAnchor.constraint(equalTo: groupNameAndMessage.centerYAnchor),
            icon.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 18),
            icon.heightAnchor.constraint(equalToConstant: 40),
            icon.widthAnchor.constraint(equalToConstant: 40),
            
            groupNameAndMessage.topAnchor.constraint(equalTo: self.topAnchor, constant: 24),
            groupNameAndMessage.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 18),
            groupNameAndMessage.trailingAnchor.constraint(equalTo: contactTimeOfMessage.leadingAnchor, constant: -18),
            groupNameAndMessage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -24),
            
            contactTimeOfMessage.centerYAnchor.constraint(equalTo: groupNameAndMessage.centerYAnchor),
            contactTimeOfMessage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -18),
            contactTimeOfMessage.widthAnchor.constraint(equalToConstant: 100)
            
        ])
    }
    
}
