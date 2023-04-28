//
//  MovieGenres.swift
//  MandiriDummyProject
//
//  Created by Jehnsen Hirena Kane on 13/04/23.
//

import Foundation

public struct MovieGenreResponse: Codable {
    public let genres: [MovieGenre]
}

public struct MovieGenre: Codable {
    public let id: Int?
    public let name: String?
}
