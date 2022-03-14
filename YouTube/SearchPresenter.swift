//
//  SearchPresenter.swift
//  YouTube
//
//  Created by 都甲裕希 on 2022/03/14.
//

import Foundation

protocol SearchPresenterInput{
    //入力された文字を格納する変数
    var inputText: String {get set}
    
    //textFieldが閉じたときに呼ばれるメソッド
    func setText(text: String?)
    
    //searchButtonが押されたときに呼ばれるメソッド
    func pushSearchButton()
}

protocol searchPresenterOutput{
    //VideoListsViewControllerに画面遷移させるメソッド
    func transitionToVideoLists(text: String)
}

final class SearchPresenter: SearchPresenterInput{
    
    private var view: searchPresenterOutput!
    var inputText = String()
    
    init(view: searchPresenterOutput){
        self.view = view
    }
    
    func setText(text: String?) {
        print(self.inputText)
        guard let inputText = text else{return}
        self.inputText = inputText
    }
    
    func pushSearchButton() {
        view.transitionToVideoLists(text: inputText)
    }
    
    
    
}
