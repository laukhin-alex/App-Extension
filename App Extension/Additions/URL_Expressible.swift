//
//  URL_Expressible.swift
//  App Extension
//
//  Created by Александр on 09.09.2022.
//

import Foundation

extension URL: ExpressibleByStringLiteral {

    public init(stringLiteral value: String) {
        self = URL(string: value) ?? "https://www.google.com"
    }

}
