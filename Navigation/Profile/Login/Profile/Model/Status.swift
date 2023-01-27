//
//  Status.swift
//  Navigation
//
//  Created by Лаборатория on 27.01.2023.
//

enum ErrorsStatus: Error {
    case emptyStatusText
}

final class CheckStatusText {

    static let shared: CheckStatusText = .init()

    func checkAuthorization(statusText: String?) throws {
        guard statusText != "" else { throw ErrorsStatus.emptyStatusText }
    }

}
