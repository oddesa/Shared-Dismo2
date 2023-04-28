//
//  MovieTrailerResponse.swift
//  Dismo 2
//
//  Created by Jehnsen Hirena Kane on 16/04/23.
//

import Foundation

public struct MovieTrailerResponse: Codable {
    public let id: Int
    public let results: [MovieTrailerDetail]
    public var officialTrailerKey:  String? {
        return results.first{$0.official}?.key ?? results.first?.key
    }
}

public struct MovieTrailerDetail: Codable {
    public let id: String
    public let key: String
    public let official: Bool
}

