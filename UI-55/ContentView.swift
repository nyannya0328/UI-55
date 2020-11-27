//
//  ContentView.swift
//  UI-55
//
//  Created by にゃんにゃん丸 on 2020/11/27.
//

import SwiftUI

struct ContentView: View {
    
    @State var txt = ""
    @State var Value : CGFloat = 0
    var body: some View {
        VStack{
            
            
            List(1..<100){_ in
                
                HStack(spacing:15){
                    
                    Image("p1")
                        .resizable()
                        .frame(width: 70, height: 70)
                        .cornerRadius(20)
                        
                    
                    
                    VStack(spacing:20){
                        Text("我")
                            .font(.title)
                            .fontWeight(.heavy)
                            .foregroundColor(.red)
                        
                        Text("ライオンなり")
                            .font(.callout)
                            .fontWeight(.bold)
                            .foregroundColor(Color.purple.opacity(1))
                        
                        
                        
                    }
                    
                }
                .padding()
                
                
                
            }
            
            TextField("ADD", text: $txt)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal,10)
        }
        .offset(y: -self.Value)
        .animation(.spring())
        
        .onAppear{
            
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { (noti) in
                
                let value = noti.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
                let height = value.height
                self.Value = height
            
                
                
                
            }
            
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { (noti) in
                self.Value = 0
            }
            
                
            }
            
            
            
        }
        
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
