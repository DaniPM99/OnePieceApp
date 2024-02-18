//
//  APIClient.swift
//  OnePieceApp
//
//  Created by Daniel Parra Martin on 21/1/24.
//

import Foundation

final class ListOfCharactersAPIClient {
    func getCharactersList() async -> CharacterModelResponse {
        let url = URL(string: "https://onepiecelogs.dev/api/characters/")!
        let (data, _) = try! await URLSession.shared.data(from: url)
        return try! JSONDecoder().decode(CharacterModelResponse.self, from: data)
    }
}
