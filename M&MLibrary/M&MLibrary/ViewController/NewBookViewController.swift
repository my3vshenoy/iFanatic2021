//
//  NewBookViewController.swift
//  M&MLibrary
//
//  Created by My3 Shenoy on 1/25/22.
//

import UIKit

final class NewBookViewController: UITableViewController {
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var authorTextField: UITextField!
    @IBOutlet weak var bookImageView: UIImageView!
    
    @IBAction func uploadImage() {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        picker.sourceType = UIImagePickerController.isSourceTypeAvailable(.camera) ? .camera : .photoLibrary
        present(picker, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - UIImagePickerDelegate
extension NewBookViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.editedImage] as? UIImage else { return }
        bookImageView.image = selectedImage
        dismiss(animated: true)
    }
}

// MARK: - UITextFieldDelegate
extension NewBookViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
      if textField == titleTextField {
        return authorTextField.becomeFirstResponder()
      } else {
        return textField.resignFirstResponder()
      }
    }
}
