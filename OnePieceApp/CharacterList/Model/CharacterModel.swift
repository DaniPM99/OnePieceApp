//
//  CharacterModel.swift
//  OnePieceApp
//
//  Created by Daniel Parra Martin on 21/1/24.
//

import Foundation

struct CharacterModel: Decodable {
    let name: String
    let status: String
    let bounty: String
    let external_url: String
}
