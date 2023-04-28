//
//  MovieReview.swift
//  MandiriDummyProject
//
//  Created by Jehnsen Hirena Kane on 13/04/23.
//

import Foundation


public struct MovieReview: Codable {
    public let author: String
    public let authorDetails: MovieAuthorReview?
    public let content: String
    public let createdAt:  String //"2017-02-13T22:23:01.268Z",
    public let id: String
    public let updatedAt: String // "2017-02-13T23:16:19.538Z",
    public let url: String
    
    enum Keys: String, CodingKey {
        case author
        case authorDetails = "author_details"
        case content
        case createdAt = "created_at"
        case id
        case updatedAt = "updated_at"
        case url
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Keys.self)
        self.author = try container.decodeIfPresent(String.self, forKey: .author) ?? ""
        self.authorDetails = try container.decodeIfPresent(MovieAuthorReview.self, forKey: .authorDetails)
        self.content = try container.decodeIfPresent(String.self, forKey: .content) ?? ""
        self.createdAt = try container.decodeIfPresent(String.self, forKey: .createdAt) ?? ""
        self.id = try container.decodeIfPresent(String.self, forKey: .id) ?? ""
        self.updatedAt = try container.decodeIfPresent(String.self, forKey: .updatedAt) ?? ""
        self.url = try container.decodeIfPresent(String.self, forKey: .url) ?? ""
    }
}

public struct MovieAuthorReview: Codable {
    public let name: String?
    public let username: String?
    public let avatarPath: String?
    public let rating: Float?
    
    public var avatarURL: URL? {
        guard let avatarPath = avatarPath else {
            return nil
        }
        return URL(string: "https://image.tmdb.org/t/p/w500\(avatarPath)")
    }
    
    enum Keys: String, CodingKey {
        case name
        case username
        case avatarPath = "avatar_path"
        case rating
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Keys.self)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.username = try container.decodeIfPresent(String.self, forKey: .username)
        self.avatarPath = try container.decodeIfPresent(String.self, forKey: .avatarPath)
        self.rating = try container.decodeIfPresent(Float.self, forKey: .rating)
    }
}
