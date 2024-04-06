//
//  Artist.swift
//  SpotifyClone
//
//  Created by christian on 4/5/24.
//

import Foundation

@Observable
class ArtistService {
    
    // Uncomment the line below and insert your Rapid API Key
    // let rapidAPIKey = ""
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
