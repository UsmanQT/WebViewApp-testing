//
//  ChatView.swift
//  WebApp
//
//  Created by Usman Tahir Qureshi on 2/9/23.
//

import SwiftUI
import UIKit

class ChatView: UIView{
    

    @State var chatMessages: [ChatMessage] = ChatMessage.dummyMessages
    @State var messageText: String = ""
    let textField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Enter text here"
        return textField
      }()
    
    let listView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        return scrollView
      }()
    
    let addButton: UIButton = {
        let button = UIButton()
        button.setTitle("Send", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        return button
      }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
      }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
      }
    
    private func setupView() {
        
        
//        var currentY: CGFloat = 0
//          for item in chatMessages {
//            let label = UILabel()
//              label.text = item.messageContent
//
//            label.sizeToFit()
//            label.frame = CGRect(x: 0, y: currentY, width: listView.frame.width, height: label.frame.height)
//            listView.addSubview(label)
//            currentY += label.frame.height
//          }
        
        addSubview(listView)
        addSubview(textField)
        addSubview(addButton)
        
        
        
        
        

          
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        listView.translatesAutoresizingMaskIntoConstraints = false
        addButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
          textField.topAnchor.constraint(equalTo: topAnchor, constant: 16),
          textField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
          textField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
          
          listView.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 16),
          listView.leadingAnchor.constraint(equalTo: leadingAnchor),
          listView.trailingAnchor.constraint(equalTo: trailingAnchor),
          listView.bottomAnchor.constraint(equalTo: addButton.topAnchor, constant: -16),
          
          addButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
          addButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
          addButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
          addButton.heightAnchor.constraint(equalToConstant: 44)
        ])
        let items = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5"]
          var currentY: CGFloat = 0
          for item in items {
            let label = UILabel()
            label.text = item
            label.sizeToFit()
            label.frame = CGRect(x: 1, y: currentY, width: 300, height: 600)
            listView.addSubview(label)
            currentY += 100
          }
        // Set the content size of the scroll view to allow scrolling
        listView.contentSize = CGSize(width: 300, height: currentY)
        listView.backgroundColor = .lightGray
      }
    
//    var body: some View {
//        VStack {
//            ScrollView{
//                LazyVStack {
//                    ForEach(chatMessages, id:\.id) { message in
//                        self.messageView(message: message)
//                    }
//                }
//            }.padding()
//            HStack{
//                TextField("Enter a message", text: $messageText)
//                    .padding()
//                    .background(.gray.opacity(0.1))
//                    .cornerRadius(12)
//                Button {
//                    self.sendMessage()
//                } label: {
//                    Text("Send")
//                        .foregroundColor(.white)
//                        .padding()
//                        .background(.black)
//                        .cornerRadius(12)
//                }
//            }
//            .padding()
//        }
//    }
//
//    func messageView(message: ChatMessage) -> some View {
//        HStack {
//            if message.sender == .student{ Spacer() }
//            Text(message.messageContent)
//                .foregroundColor(message.sender == .student ? .white : .black)
//                .padding()
//                .background(message.sender == .student ? .blue : .gray.opacity(0.1))
//            .cornerRadius(16)
//            if message.sender == .chatgpt {Spacer()}
//        }
//    }
//
//    func sendMessage() {
//        self.chatMessages.append(ChatMessage(id: UUID().uuidString, messageContent: "Are there any restaurants open after 12:00?", sender: .student, dateOfMessage: Date()))
//        messageText=""
//
//    }
}
