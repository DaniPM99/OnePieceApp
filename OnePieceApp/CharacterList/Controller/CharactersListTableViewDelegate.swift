//
//  CharactersListTableViewDelegate.swift
//  OnePieceApp
//
//  Created by Daniel Parra Martin on 21/1/24.
//

import Foundation
import UIKit

class CharactersListTableViewDelegate: NSObject, UITableViewDelegate {
    var didTapOnCell: ((Int) -> Void)?
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didTapOnCell?(indexPath.row)
    }
}
