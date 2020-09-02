//
//  CaptureImageView.swift
//  DonExpress-SwiftUI-iOS
//
//  Created by Wilder Lopez on 6/2/20.
//  Copyright © 2020 Wilder Lopez. All rights reserved.
//

import UIKit
import SwiftUI

struct CaptureImageView {
  
    /// MARK: - Properties
    @Binding var isShown: Bool
    @Binding var image: UIImage?
    @Binding var isCamera: Bool
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(isShown: $isShown, image: $image, isCamera: $isCamera)
    }
}
extension CaptureImageView: UIViewControllerRepresentable {
    func makeUIViewController(context: UIViewControllerRepresentableContext<CaptureImageView>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        if isCamera{
            print("ActivateCamera")
            picker.sourceType = .camera
        }
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController,
                                context: UIViewControllerRepresentableContext<CaptureImageView>) {
        
    }
}

