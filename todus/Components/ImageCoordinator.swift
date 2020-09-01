//
//  ImageCoordinator.swift
//  DonExpress-SwiftUI-iOS
//
//  Created by Wilder Lopez on 6/2/20.
//  Copyright © 2020 Wilder Lopez. All rights reserved.
//

import SwiftUI

class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    @Binding var isCoordinatorShown: Bool
    @Binding var imageInCoordinator: UIImage?
    @Binding var isCameraCoordinator: Bool
    init(isShown: Binding<Bool>, image: Binding<UIImage?>, isCamera: Binding<Bool>) {
        _isCoordinatorShown = isShown
        _imageInCoordinator = image
        _isCameraCoordinator = isCamera
    }
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let unwrapImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
        imageInCoordinator = unwrapImage
        isCoordinatorShown = false
        isCameraCoordinator = false
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        isCoordinatorShown = false
        isCameraCoordinator = false
    }
}
