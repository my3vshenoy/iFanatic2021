//
//  DetailViewController.swift
//  M&MLibrary
//
//  Created by My3 Shenoy on 1/25/22.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bookImageView: UIImageView!
    @IBOutlet weak var authorLabel: UILabel!
    
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
