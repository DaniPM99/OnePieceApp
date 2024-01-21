//
//  CharactersListViewController.swift
//  OnePieceApp
//
//  Created by Daniel Parra Martin on 21/1/24.
//

import UIKit

class CharactersListViewController: UIViewController {
    var mainView: CharacterListView { self.view as! CharacterListView }
    let apiClient = ListOfCharactersAPIClient()
    private var tableViewDataSource: CharactersListTableViewDataSource?
    private var tableViewDelegate: CharactersListTableViewDelegate?
    
    override func loadView() {
        view = CharacterListView()
        tableViewDelegate = CharactersListTableViewDelegate()
        
        tableViewDataSource = CharactersListTableViewDataSource(tableView: mainView.charactersTableView)
        mainView.charactersTableView.dataSource = tableViewDataSource
        mainView.charactersTableView.delegate = tableViewDelegate
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Do any additional setup after loading the view.
        
        tableViewDelegate?.didTapOnCell = { [weak self] index in
            print("Index \(index)")
            
            //Present New View Controller
            guard let dataSource = self?.tableViewDataSource else {
                return
            }
            
            let characterModel = dataSource.characters[index]
            let characterDetailViewController = CharacterDetailViewController(characterDetailModel: characterModel)
            self?.present(characterDetailViewController, animated: true)
        }
        Task {
            let characters = await apiClient.getCharactersList()
            tableViewDataSource?.set(characters: characters.results)
        }
    }
}
