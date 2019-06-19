//
//  PhotoCommentViewController.swift
//  PhotoScroll
//
//  Created by Tintash on 19/06/2019.
//  Copyright © 2019 raywenderlich. All rights reserved.
//

import UIKit

class PhotoCommentViewController: UIViewController {
  
  
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var scrollView: UIScrollView!
  @IBOutlet weak var nameTextField: UITextField!
  var photoName: String?
  var photoIndex: Int!
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    NotificationCenter.default.addObserver(self, selector: #selector(PhotoCommentViewController.keyboardWillShow(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
    
    NotificationCenter.default.addObserver(self, selector: #selector(PhotoCommentViewController.keyboardWillHide(_:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
    
    if let photoName = photoName {
      self.imageView.image = UIImage(named: photoName)
    }
  }
  
  func adjustInsetForKeyboardShow(_ show: Bool, notification: Notification){
    let userInfo = notification.userInfo ?? [:]
    let keyboardFrame = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
    let adjustmentHeight = (keyboardFrame.height + 20) * (show ? 1 : -1)
    scrollView.contentInset.bottom += adjustmentHeight
    scrollView.scrollIndicatorInsets.bottom += adjustmentHeight
  }
  
  @objc func keyboardWillShow(_ notification: Notification){
    print("keyboardWillShow")
    adjustInsetForKeyboardShow(true, notification: notification)
  }
  
  @objc func keyboardWillHide(_ notification: Notification){
    print("keyboardWillHide")
    adjustInsetForKeyboardShow(false, notification: notification)
  }
  
  @IBAction func hideKeyboard(_ sender: Any) {
    nameTextField.endEditing(true)
  }
  
    @IBAction func openZoomingController(_ sender: Any) {
        performSegue(withIdentifier: "zooming", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let id = segue.identifier,
      let zoomVC = segue.destination as? ZoomedPhotoViewController,
      id == "zooming"{
      zoomVC.photoName = photoName
    }
  }
  
  deinit {
    NotificationCenter.default.removeObserver(self)
  }
}
