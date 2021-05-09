//
//  Target.swift
//  YesTestApp
//
//  Created by Владислав Афанасьев on 09.05.2021.
//

import Foundation
import Moya

enum Target: TargetType {
    case getDateList

    var baseURL: URL {
        return URL(string: "http://event-social-stage.herokuapp.com")!
    }

    var path: String {
        switch self {
        case .getDateList:
            return "/parse/classes/Event"
        }
    }

    var method: Moya.Method {
        return .get
    }

    var sampleData: Data {
        return Data() // TODO: User real data
    }

    var task: Task {
        switch self {
        case .getDateList:
            return .requestPlain
        }
    }

    var validationType: ValidationType {
        switch self {
        case .getDateList:
            return .successAndRedirectCodes
        }
    }

    var headers: [String: String]? {
        return ["X-Parse-Application-Id": "jf9j_fJfiP90"]
    }
}
