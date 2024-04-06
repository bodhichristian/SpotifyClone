//
//  Artist.swift
//  SpotifyClone
//
//  Created by christian on 4/5/24.
//

import Foundation
import Observation

@Observable
class ArtistService {
    
    // Uncomment the line below and insert your Rapid API Key
    // let rapidAPIKey = ""
    var artistCollection: [Artist]?
    var fetchedArtist: Artist?
    var fetchFailed = false
    
    func search(for artistName: String) async throws {
        let headers = [
            "X-RapidAPI-Key": rapidAPIKey,
            "X-RapidAPI-Host": "theaudiodb.p.rapidapi.com"
        ]
        
        let urlStringPrefix = "https://theaudiodb.p.rapidapi.com/search.php?s="
        let formattedArtistName = artistName.replacingOccurrences(of: " ", with: "_")
        
        let urlString = urlStringPrefix + formattedArtistName
        guard let url = URL(string: urlString)
        else {
            fetchFailed = true
            throw ArtistServiceError.invalidArtistURL
        }
        
        var request = URLRequest(
            url: url,
            cachePolicy: .useProtocolCachePolicy,
            timeoutInterval: 10.0
        )
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        do { // Search for artist
            let (data, _) = try await URLSession.shared.data(for: request)
            let decoder = JSONDecoder()
            let response = try decoder.decode(ArtistSearchResponse.self, from: data)
            let artist = response.artists.first
            
            self.fetchedArtist = artist
        } catch {
            self.fetchFailed = true
            throw ArtistServiceError.failedToFetchArtist
        }
        
        do { // Fetch artist and banner images
            let artistImageData = try await fetchImageData(from: fetchedArtist?.artistImageURL ?? "")
            let bannerImageData = try await fetchImageData(from: fetchedArtist?.bannerImageURL ?? "")
            
            fetchedArtist?.artistImageData = artistImageData
            fetchedArtist?.bannerImageData = bannerImageData
        } catch {
            self.fetchFailed = true
            throw ArtistServiceError.failedToFetchImages
        }
    }
    
    func fetchArtistCollection() async {
        let artistNames = ["Twenty One Pilots", "Imagine Dragons", "Panic! At the Disco", "Arcade Fire", "Vampire Weekend", "Foster the People", "Mumford & Sons", "The 1975", "Twenty One Pilots", "Bastille", "Glass Animals", "The Lumineers", "Walk the Moon", "Paramore", "The Neighbourhood", "Of Monsters and Men", "Hozier", "alt-J", "Royal Blood", "The Strokes", "Muse", "Cage the Elephant", "The Black Keys", "Coldplay", "Vance Joy"]
        
        for artist in artistNames {
            do {
                try await search(for: artist)
            } catch {
                
            }
            if let fetchedArtist {
                artistCollection?.append(fetchedArtist)
            }
        }
    }
    
    func fetchImageData(from urlString: String) async throws-> Data? {
        guard let url = URL(string: urlString) else {
            throw ArtistServiceError.invalidImageURL
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            return data
        } catch {
            throw ArtistServiceError.failedToFetchImages
        }
    }
}


enum ArtistServiceError: Error, CustomStringConvertible {
    case failedToFetchArtist,
         failedToFetchImages,
         invalidArtistURL,
         invalidImageURL
    
    var description: String {
        switch self {
        case .failedToFetchArtist:
            return "Unable to find artist."
        case .failedToFetchImages:
            return "Unable to fetch artist images."
        case .invalidArtistURL:
            return "Bad URL for artist."
        case .invalidImageURL:
            return "Bad URL for image."
        }
    }
}
