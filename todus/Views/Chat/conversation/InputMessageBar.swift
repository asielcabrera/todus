//
//  InputMessageBar.swift
//  todus
//
//  Created by Wilder Lopez on 8/28/20.
//  Copyright © 2020 Asiel Cabrera. All rights reserved.
//

import SwiftUI

struct InputMessageBar: View {
    @Binding var typingMessage: String
    @EnvironmentObject var chatHelper: ChatHelper
    
    @State var selectedImage : UIImage? = nil
    @State var showCaptureImage = false
    @State var isCameraSelected = false
    
    @State var showActionSheet = false
    
    @State var messagetype : SenderMessageType = .text
    
    var body: some View {
        
        VStack(spacing: 0){

        Divider()
            HStack(alignment: .center , spacing: 15) {
            Button(action: {
                print("show action sheet")
                self.showActionSheet.toggle()
                
            }) {
                Image(systemName: "paperclip").font(.system(size: 25))
            }
            
            MultilineTextField("Mensaje", text: $typingMessage)
                .padding(.horizontal, 10)
                .overlay(
                    RoundedRectangle(cornerRadius: 25)
                    .stroke(Color.gray))
                .background(Color.white)

            ZStack{
                Button(action: {
                    print("microphone pressed")
                }) {
                    Image(systemName: "mic").resizable().frame(width: !typingMessage.isEmpty ? 0 : 20, height: !typingMessage.isEmpty ? 0 : 30, alignment: .center)
                    .scaledToFit()
                }

            Button(action: sendMessage) {
                Image(systemName: "arrow.up")
                .resizable()
                    .frame(width: typingMessage.isEmpty ? 0 : 16, height: typingMessage.isEmpty ? 0 : 18, alignment: .center)
                    .foregroundColor(.white)
                    .padding(.horizontal, 2)
                    .background(Circle()
                        .frame(width: typingMessage.isEmpty ? 0 : 35, height: typingMessage.isEmpty ? 0 : 35, alignment: .center)                )
            }

            }
            
        }
            .frame(minHeight: CGFloat(50))
            .padding(3)
            .padding(.horizontal, 10)
            .accentColor(.primaryTodusColor)
            
        }
        
        .actionSheet(isPresented: $showActionSheet) {
            ActionSheet(title: Text("Enviar ..."), buttons: [
                .default(Text("Cámara"), action: {
                    print("from Camera")
                    self.showCaptureImage.toggle()
                    self.isCameraSelected = true
                }),
                .default(Text("Foto"), action: {
                    print("from galery")
                    self.showCaptureImage.toggle()
                    self.isCameraSelected = false
                }),
                .default(Text("Archivo"), action: {
                    print("from file")
                }),
                .default(Text("Ubicación"), action: {
                    print("from location map")
                }),
                .default(Text("Contacto"), action: {
                    print("from contacts")
                }),
                .cancel(Text("Cancelar"))
            ])
        }
        .sheet(isPresented: $showCaptureImage, onDismiss: {
            if self.selectedImage != nil {
                print("image was selected")
                self.messagetype = .photo
                self.sendMessage()
            }
        }) {
            CaptureImageView(isShown: self.$showCaptureImage, image: self.$selectedImage, isCamera: self.$isCameraSelected)
        }
    }
    
    func sendMessage() {
        switch self.messagetype {
        case .text:
            
            chatHelper.sendMessage(MockMessage(id: UUID().uuidString, kind: .text(typingMessage), mockuser: DataSource.mockusers[1], createAt: Date()))
            typingMessage = ""
            break;
            
        case .photo:
            print("sending photo")
            let mediaPhoto : MediaItemRow = .init(image: self.selectedImage, placeholderImage: self.selectedImage!)
            chatHelper.sendMessage(MockMessage(id: UUID().uuidString, kind: .photo(mediaPhoto), mockuser: DataSource.me!, createAt: Date()))
            self.selectedImage = nil
            
            
        default:
            print("not supported yet")
        }
        
        self.messagetype = .text
        
    }
}

struct InputMessageBar_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color.red
            InputMessageBar(typingMessage: Binding<String>.constant("s")).background(Color.white)
        }
    }
}

enum SenderMessageType {
    case text, photo, video, file, location, contact
}
