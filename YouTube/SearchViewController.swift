//
//  SearchViewController.swift
//  YouTube
//
//  Created by 都甲裕希 on 2022/03/14.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    private var presenter: SearchPresenterInput!
    func inject(presenter: SearchPresenterInput){
        self.presenter = presenter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let presenter = SearchPresenter(view: self)
        inject(presenter: presenter)
        textField.delegate = self
        textField.returnKeyType = .search
    }
    
    
    @IBAction func searchButton(_ sender: Any) {
        presenter.pushSearchButton()
    }
    
}

extension SearchViewController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        textField.resignFirstResponder()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        presenter.setText(text: textField.text)
    }
}

extension SearchViewController: searchPresenterOutput{
    
    func transitionToVideoLists(text: String) {
        print("こんにちわ")
    }
    
}
