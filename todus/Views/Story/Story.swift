//
//  Story.swift
//  todus
//
//  Created by Asiel Cabrera on 9/1/20.
//  Copyright © 2020 Asiel Cabrera. All rights reserved.
//

import SwiftUI
import Combine

struct StoryView: View {
    
    var imageNames:[String]
    @ObservedObject var storyTimer: StoryTimer
    
    init(imageNames: [String]) {
        self.imageNames = imageNames
        self.storyTimer = StoryTimer(items: self.imageNames.count, interval: 3.0)
    }
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .top){
                Image(self.imageNames[Int(self.storyTimer.progress)])
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: nil, alignment: .center)
                    .animation(.none)
                HStack(alignment: .center, spacing: 4) {
                    ForEach(self.imageNames.indices) { x in
                        LoadingRectangle(progress: min( max( (CGFloat(self.storyTimer.progress) - CGFloat(x)), 0.0) , 1.0) )
                            .frame(width: nil, height: 2, alignment: .leading)
                            .animation(.linear)
                    }
                    
                }.padding()
                
                HStack {
                    Image(DataSource.mockusers[1].avatar)
                        .resizable()
                        .frame(width: 55, height: 55)
                        .overlay(Circle().stroke(Color.primaryBubbleColor, lineWidth: 2))
                    
                    Text(DataSource.mockusers[1].name)
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .shadow(radius: 5)
                        .padding(.horizontal, 5)
                    
                    Text("12h")
                        .foregroundColor(.white)
                        .shadow(radius: 5)
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }, label: {
                        Image("menu")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(Color("secondary").opacity(0.4))
                    })
                }.padding(.top, 30)
                    .padding(.horizontal)
                
                HStack(alignment: .center, spacing: 0) {
                    Rectangle()
                        .foregroundColor(.clear)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            self.storyTimer.advance(by: -1)
                    }
                    Rectangle()
                        .foregroundColor(.clear)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            self.storyTimer.pause()
                    }
                    Rectangle()
                        .foregroundColor(.clear)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            self.storyTimer.advance(by: 1)
                    }
                }
            }
            .onAppear { self.storyTimer.start(endind: {}) }
            .onDisappear { self.storyTimer.cancel() }
        }
    }
}

struct StoryView_Previews: PreviewProvider {
    static var previews: some View {
        StoryView(imageNames: ["image01","image02","image03","image04","image05","image06","image07"])
    }
}

struct LoadingRectangle: View {
    var progress: CGFloat
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .foregroundColor(Color.white.opacity(0.3))
                    .cornerRadius(5)
                
                Rectangle()
                    .frame(width: geometry.size.width * self.progress, height: nil, alignment: .leading)
                    .foregroundColor(Color.white.opacity(0.9))
                    .cornerRadius(5)
            }
        }
    }
}

class StoryTimer: ObservableObject {
    
    @Published var progress: Double
    private var interval: TimeInterval
    private var max: Int
    private let publisher: Timer.TimerPublisher
    private var cancellable: Cancellable?
    private var ispause: Bool = false
    
    init(items: Int, interval: TimeInterval) {
        self.max = items
        self.progress = 0
        self.interval = interval
        self.publisher = Timer.publish(every: 0.1, on: .main, in: .default)
    }
    
    func start(endind: @escaping () -> Void ) {
        self.cancellable = self.publisher.autoconnect().sink(receiveValue: {  _ in
            var newProgress = self.progress + (0.1 / self.interval)
            if Int(newProgress) >= self.max {
                newProgress = 0
                endind()
                self.cancel()
            }
            self.progress = newProgress
            
        })
    }
    func advance(by number: Int) {
        let newProgress = Swift.max((Int(self.progress) + number) % self.max , 0)
        self.progress = Double(newProgress)
    }
    func cancel(){
        self.cancellable?.cancel()
    }
    func pause(){
        
        if !self.ispause { 
            self.cancellable?.cancel()
            print("pause")
            self.ispause = true
        } else {
            self.start(endind: {})
            self.ispause = false
            print(self.progress)
            print("run")
        }
        
    }
}

public func prueba<Result>( _ body: () throws -> Result) rethrows -> Result {
    try body()
}
