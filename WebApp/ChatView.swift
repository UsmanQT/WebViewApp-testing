//
//  ChatView.swift
//  WebApp
//
//  Created by Usman Tahir Qureshi on 2/9/23.
//

import SwiftUI

struct ChatView: UIViewController{
   
    @State var chatMessages: [ChatMessage] = ChatMessage.dummyMessages
    @State var messageText: String = ""
    var body: some View {
        VStack {
            ScrollView{
                LazyVStack {
                    ForEach(chatMessages, id:\.id) { message in
                        messageView(message: message)
                    }
                }
            }.padding()
            HStack{
                TextField("Enter a message", text: $messageText)
                    .padding()
                    .background(.gray.opacity(0.1))
                    .cornerRadius(12)
                Button {
                    sendMessage()
                } label: {
                    Text("Send")
                        .foregroundColor(.white)
                        .padding()
                        .background(.black)
                        .cornerRadius(12)
                }
            }
            .padding()
        }
    }
    
    func messageView(message: ChatMessage) -> some View {
        HStack {
            if message.sender == .student{ Spacer() }
            Text(message.messageContent)
                .foregroundColor(message.sender == .student ? .white : .black)
                .padding()
                .background(message.sender == .student ? .blue : .gray.opacity(0.1))
            .cornerRadius(16)
            if message.sender == .chatgpt {Spacer()}
        }
    }
    
    func sendMessage() {
        self.chatMessages.append(ChatMessage(id: UUID().uuidString, messageContent: "Are there any restaurants open after 12:00?", sender: .student, dateOfMessage: Date()))
        messageText=""
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
