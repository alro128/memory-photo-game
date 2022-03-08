//
//  ImagePicker.swift
//  MemoryPhotoGame
//
//  Created by taiger on 03/07/2021.
//

import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {

    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        let parent: ImagePicker
        
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                parent.image = uiImage
            }
            parent.presentationMode.wrappedValue.dismiss()
        }

//        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
//            completionHandler(nil)
//        }
    }
    
    
    @Environment(\.presentationMode) var presentationMode
    @Binding var image: UIImage?
        
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {}
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    

}
