//
//  EntryViewController.swift
//  ToDoList
//
//  Created by Mohamed Hamed on 3/23/21.
//

import RealmSwift
import UIKit

class EntryViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var textField: UITextField!
    @IBOutlet var datePicker: UIDatePicker!
    
    private let realm = try! Realm()
    public var completionHandler: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.becomeFirstResponder()
        textField.delegate = self
        
        datePicker.setDate(Date(), animated: true)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(didTapSaveButton))

    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }

    @objc func didTapSaveButton(){
        if let text = textField.text, !text.isEmpty{
            let date = datePicker.date
            
            realm.beginWrite()
            
            let newItem = ToDoListItem()
            newItem.date = date
            newItem.item = text
            realm.add(newItem)
            
            try! realm.commitWrite()
            
            completionHandler?()
            navigationController?.popToRootViewController(animated: true)
        }
        else {
            print("Add something")
        }
    }

}
