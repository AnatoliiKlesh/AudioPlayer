//
//  TrackInfo.swift
//  AudioPlayer
//
//  Created by Михаил Андреев on 11/10/2019.
//  Copyright © 2019 Squad of 4. All rights reserved.
//

import Foundation

//Тут будет модель, содержащая информацию о треке
struct TrackInfo {
    struct TrackInfo {
        let artistNameLabel: String
        let trackNameLabel: String
        let coverImage: String
        let userRating: UserRating?
        let trackReleaseYearLabel: String
    }

    enum UserRating: String {
        case dontLike = "I do not like 👎"
        case notInteresting = "Not interesed ✊"
        case like = "I like this 👍"
    }
}
