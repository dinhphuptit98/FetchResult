//
//  ViewController.swift
//  FetchResult
//
//  Created by dinhphu98 on 5/8/18.
//  Copyright © 2018 dinhphu98. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UIImagePickerControllerDelegate , UINavigationControllerDelegate{

    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var properties: UITextField!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var photoHero: UIImageView!
    
    var hero : Hero?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func configureView(){
        
            name.text = hero?.name
            properties.text = hero?.properties
            photoHero.image = hero?.photo as? UIImage
        
    }
    // chọn ảnh
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage
        photoHero.image = selectedImage
        dismiss(animated: true, completion: nil)
    }
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        present( imagePickerController , animated: true, completion: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let masterController = segue.destination as? MasterTableViewController {
            let context = masterController.fetchedResultsController.managedObjectContext
           
            if masterController.tableView.indexPathForSelectedRow == nil {
                hero = Hero(context: context)
            }
            hero?.name = name.text
            hero?.properties = properties.text
            hero?.photo = photoHero.image
            
            CoreDataServices.shared.saveContext()
        }
        
    }
    
}

