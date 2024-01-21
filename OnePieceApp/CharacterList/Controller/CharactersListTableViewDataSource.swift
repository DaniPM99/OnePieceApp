//
//  CharactersListTableViewDataSource.swift
//  OnePieceApp
//
//  Created by Daniel Parra Martin on 21/1/24.
//

import Foundation
import UIKit

final class CharactersListTableViewDataSource: NSObject, UITableViewDataSource {
    private let tableView: UITableView
    
    private(set) var characters: [CharacterModel] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    init(tableView: UITableView, characters: [CharacterModel] = []) {
        self.tableView = tableView
        self.characters = characters
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterListCellView", for: indexPath) as! CharacterListCellView
        
        let character = characters[indexPath.row]
        cell.configure(character)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        characters.count
    }
    
    func set(characters: [CharacterModel]) {
        self.characters = characters
    }
}
