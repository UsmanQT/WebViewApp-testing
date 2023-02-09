//
//  ChatMessage.swift
//  WebApp
//
//  Created by Usman Tahir Qureshi on 2/9/23.
//


import Foundation

struct ChatMessage {
    let id: String
    let messageContent: String
    let sender: MessageSender
    let dateOfMessage: Date
}

extension ChatMessage{
    static var dummyMessages = [
        ChatMessage(id: UUID().uuidString, messageContent: "Are there any restaurants open after 12:00?", sender: .student, dateOfMessage: Date()),
        ChatMessage(id: UUID().uuidString, messageContent: "No, There won't be any restaurants open after 12:00 am in Allendale ", sender: .chatgpt, dateOfMessage: Date()),
        ChatMessage(id: UUID().uuidString, messageContent: "So Can I take the bus right now from Allendale to Downtown", sender: .student, dateOfMessage: Date()),
        ChatMessage(id: UUID().uuidString, messageContent: "Yes, you can", sender: .chatgpt, dateOfMessage: Date())
    ]
}

