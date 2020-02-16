//
//  WordPressPost.swift
//  CryptoApp
//
//  Created by Daniel Stewart on 2/16/20.
//  Copyright © 2020 Instamobile. All rights reserved.
//

public class WordPressPost: GenericBaseModel {
    var link: String?
    var title: String?
    var text: String?
    var picture: String?
    public var description: String {
        return title ?? ""
    }

    required public init(jsonDict: [String: Any]) {
//        link            <- map["link"]
//        title           <- map["title"]
//        text            <- map["text"]
//        picture         <- map["picture"]
    }
}
