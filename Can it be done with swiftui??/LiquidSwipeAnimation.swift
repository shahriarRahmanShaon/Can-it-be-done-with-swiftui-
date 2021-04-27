//
//  LiquidSwipeAnimation.swift
//  Can it be done with swiftui??
//
//  Created by sergio shaon on 19/4/21.
//

import SwiftUI

struct LiquidSwipeAnimation: View {
    @State var offset: CGSize = .zero
    @State var showHome: Bool = false
    
    var body: some View {
        ZStack{
            Color(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1))
                .clipShape(myShape(offset: offset))
                .edgesIgnoringSafeArea(.all)
                .overlay(
                    Image(systemName: "chevron.left")
                        .opacity(offset == .zero ? 1 : 0)
                        .font(.largeTitle)
                        .frame(width: 60, height: 60)
                        //.contentShape(Rectangle())
                        .offset(x: 15,y: 60)
                        .gesture(DragGesture()
                                    .onChanged({(value) in
                                        withAnimation(.interactiveSpring() ) {
                                            offset = value.translation
                                            print(offset)
                                        }
                                        
                                    })
                                    .onEnded({ (Value) in
                                        withAnimation(.spring()) {
                                            let screen = UIScreen.main.bounds
                                            if -offset.width > screen.width/2 {
                                                offset.width = -screen.height
                                                showHome.toggle()
                                            }else{
                                                offset = .zero
                                               
                                            }
                                            
                                        }
                                    })
                        
                        )
                        
                    , alignment: .topTrailing
                )
                .padding(.trailing)
            
            Text("cover me to see magic")
                
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(.white)
                .multilineTextAlignment(.leading)
            
            if showHome{
                Text("Hurrah! i'm home")
                    .onTapGesture {
                        offset = .zero
                        print(offset)
                        showHome.toggle()
                    }
            }
                
                
        }
        .statusBar(hidden: true)
    }
}

struct LiquidSwipeAnimation_Previews: PreviewProvider {
    static var previews: some View {
        LiquidSwipeAnimation()
    }
}

//MARK:- custom shape
struct myShape: Shape {
    let offset : CGSize
    func path(in rect: CGRect) -> Path {
        
        let width = rect.width + (-offset.width > 0 ? offset.width : 0)
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: rect.height))
        path.addLine(to: CGPoint(x: 0, y: rect.height))
        
        var to = 180 + offset.height - offset.width
        to = to<180 ? 180 : to
        let mid: CGFloat = 80 + ((to - 80)/2)
        
        // main theme is when user drags left it increases its size using that offset value
        path.move(to: CGPoint(x: rect.width, y: 80+offset.width > 80 ? 80 : 80+offset.width))
        path.addCurve(to: CGPoint(x: rect.width, y: to), control1: CGPoint(x: width-50, y: mid), control2: CGPoint( x: width-50, y: mid))
        
        
        return path
    }
    
    
}
