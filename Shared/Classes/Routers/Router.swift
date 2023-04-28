//
//  Router.swift
//  Alamofire
//
//  Created by Macbook on 22/04/23.
//

import Foundation

public enum Destination {
    case reviewsPage(movieId: Int)
    case detailsPage(details: MovieDetails)
    case collectionsPage(genre: MovieGenre)
    case discoverPage
}

public class Router {
    public static var route: ((Destination) -> Void)?
}
