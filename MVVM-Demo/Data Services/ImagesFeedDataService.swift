//
//  ImagesFeedService.swift
//  MVVM-Demo
//
//  Created by Hussein AlRyalat on 10/12/2022.
//

import Foundation
import RxSwift

struct ImageFeedListRequestInput: Encodable {
    var query: String
}

protocol ImagesFeedDataService: DataServiceProtocol {
    func images(with input: ImageFeedListRequestInput) -> Observable<[ImageResponse]>
}
