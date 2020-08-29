//
//  CustomTextView.swift
//  todus
//
//  Created by Wilder Lopez on 8/28/20.
//  Copyright © 2020 Asiel Cabrera. All rights reserved.
//

import SwiftUI
import UIKit

//struct TextView: UIViewRepresentable {
//
//    typealias UIViewType = UITextView
//    var configuration = { (view: UIViewType) in }
//
//    func makeUIView(context: UIViewRepresentableContext<Self>) -> UIViewType {
//        UIViewType()
//    }
//
//    func updateUIView(_ uiView: UIViewType, context: UIViewRepresentableContext<Self>) {
//        configuration(uiView)
//    }
//}

struct TextView: UIViewRepresentable {
    @Binding var text: String
    //new
    @Binding var calculatedHeight: CGFloat
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIView(context: Context) -> UITextView {

        let myTextView = UITextView()
        myTextView.delegate = context.coordinator

        myTextView.font = UIFont(name: "HelveticaNeue", size: 15)
        myTextView.isScrollEnabled = true
        myTextView.isEditable = true
        myTextView.isUserInteractionEnabled = true
        myTextView.backgroundColor = UIColor(white: 0.0, alpha: 0.05)

        //new
        myTextView.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        
        return myTextView
    }

    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
        
        //new
        TextView.recalculateHeight(view: uiView, result: $calculatedHeight)
    }
    
    //new
    static func recalculateHeight(view: UIView, result: Binding<CGFloat>) {
        let newSize = view.sizeThatFits(CGSize(width: view.frame.size.width, height: CGFloat.greatestFiniteMagnitude))
        if result.wrappedValue != newSize.height {
            DispatchQueue.main.async {
                result.wrappedValue = newSize.height // !! must be called asynchronously
            }
        }
    }

    class Coordinator : NSObject, UITextViewDelegate {

        var parent: TextView

        init(_ uiTextView: TextView) {
            self.parent = uiTextView
        }

        func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
            return true
        }

        func textViewDidChange(_ textView: UITextView) {
//            print("text now: \(String(describing: textView.text!))")
            self.parent.text = textView.text
        }
    }
}
