//
//  DetailViewController.swift
//  M&MLibrary
//
//  Created by My3 Shenoy on 1/25/22.
//

import UIKit

class DetailViewController: UITableViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bookImageView: UIImageView!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var reviewTextField: UITextView!
    
    @IBAction func updateImage() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerController.isSourceTypeAvailable(.camera) ? .camera : .photoLibrary
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true)
    }
    
    private let book: Book
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bookImageView.image = book.image
        titleLabel.text = book.title
        authorLabel.text = book.author
        bookImageView.layer.cornerRadius = 16
        bookImageView.layer.masksToBounds = true
        
        // Optional review info
        reviewTextField.addDoneButton()
        if let review = book.review {
            reviewTextField.text = review
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("This should never be called")
    }
    
    init?(coder: NSCoder, book: Book) {
        self.book = book
        super.init(coder: coder)
    }
}

//MARK: - UIImagePickerControllerDelegate
extension DetailViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.editedImage] as? UIImage else { return }
        bookImageView.image = selectedImage
        Library.saveImage(selectedImage, forBook: book)
        dismiss(animated: true)
    }
}

// MARK: - UITextViewDelegate
extension DetailViewController: UITextViewDelegate {
    func textViewDidEndEditing(_ textView: UITextView) {
        textView.resignFirstResponder()
    }
}

extension UITextView {
    func addDoneButton() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(self.resignFirstResponder))
        toolBar.items = [flexibleSpace, doneButton]
        self.inputAccessoryView = toolBar
    }
}
