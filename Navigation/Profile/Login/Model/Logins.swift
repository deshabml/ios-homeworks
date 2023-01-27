//
//  Logins.swift
//  Navigation
//
//  Created by Лаборатория on 27.01.2023.
//

import Foundation

enum ErrorsAuthorization: Error {
    case emptyAll
    case emptyLogin
    case emptyPassword
    case shortPassword
    case nonExistentlogin
    case nonExistentPassword
    case notMail
}

final class CheckAuthorization {

    static let shared: CheckAuthorization = .init()

    let defaultAccount: (login: String, password: String) = (login: "user@mail.ru", password: "Password")

    func checkAuthorization(login: String?, password: String?) throws {
        guard login != "" || password != "" else { throw ErrorsAuthorization.emptyAll }
        guard login != "" else { throw ErrorsAuthorization.emptyLogin}
        guard password != "" else { throw ErrorsAuthorization.emptyPassword}
        guard let password = password else { return }
        guard let login = login else { return }
        guard isMail(login: login) else { throw ErrorsAuthorization.notMail }
        guard password.count >= 8 else { throw ErrorsAuthorization.shortPassword }
        if login != defaultAccount.login { throw ErrorsAuthorization.nonExistentlogin }
        if password != defaultAccount.password { throw ErrorsAuthorization.nonExistentPassword }
    }

    private func isMail(login: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: login)
    }

}
