//
//  DiscoverMovie.swift
//  MandiriDummyProject
//
//  Created by Jehnsen Hirena Kane on 13/04/23.
//

import Foundation


public struct GenredDiscoverMovies {
    public let genre: MovieGenre
    public let movies: [DiscoverMovie]
    public init(genre: MovieGenre, movies: [DiscoverMovie]) {
        self.genre = genre
        self.movies = movies
    }
}

public struct DiscoverMovie: Codable {
    public let posterPath: String?
    public let adult: Bool?
    public let overview: String?
    public let releaseDate: String?
    public let genreIds: [Int]?
    public let id: Int?
    public let title: String?
    public let backdropPath: String?
    public var posterURL: URL? {
        guard let posterPath = posterPath else {
            return nil
        }
        return URL(string: "https://image.tmdb.org/t/p/w500\(posterPath)")
    }
    
    enum Keys: String, CodingKey {
        case posterPath = "poster_path"
        case adult
        case overview
        case releaseDate = "release_date"
        case genreIds = "genre_ids"
        case id
        case title
        case backdropPath = "backdrop_path"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Keys.self)
        self.posterPath = try container.decodeIfPresent(String.self, forKey: .posterPath) 
        self.adult = try container.decodeIfPresent(Bool.self, forKey: .adult) 
        self.overview = try container.decodeIfPresent(String.self, forKey: .overview) 
        self.releaseDate = try container.decodeIfPresent(String.self, forKey: .releaseDate) 
        self.genreIds = try container.decodeIfPresent([Int].self, forKey: .genreIds)
        self.id = try container.decodeIfPresent(Int.self, forKey: .id)
        self.title = try container.decodeIfPresent(String.self, forKey: .title)
        self.backdropPath = try container.decodeIfPresent(String.self, forKey: .backdropPath)
    }
}
