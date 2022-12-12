//
//  ImagesStore.swift
//  MVVM-Demo
//
//  Created by Hussein AlRyalat on 10/12/2022.
//

import Foundation
import RxSwift

final class ImagesRestStore: ImagesFeedDataService {
    private let key: String
    
    init(key: String) {
        self.key = key
    }
    
    func images(with input: ImageFeedListRequestInput) -> Observable<[ImageResponse]> {
        return Observable.create { subscribe in
            subscribe.onCompleted()
            return Disposables.create()
        }
    }
}
