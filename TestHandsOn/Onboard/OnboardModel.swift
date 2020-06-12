//
//  OnboardModel.swift
//  testeClass
//
//  Created by Yuri on 11/06/20.
//  Copyright © 2020 academy.ifce. All rights reserved.
//

import Foundation

struct Onboard {
    var title: String
    var subtitle: String
    var buttonTitle: String
    
    
    static func mockOnboard() -> [Onboard] {
        return [
            Onboard(title: "Primeira ação", subtitle: "Bem vindo ao app, muita coisa pode acontecer aqui, espero que você tenha uma boa experiência", buttonTitle: "Próximo"),
            Onboard(title: "Segunda ação", subtitle: "Bem vindo ao app, muita coisa pode acontecer aqui, espero que você tenha uma boa experiência", buttonTitle: "Próximo"),
            Onboard(title: "Última ação", subtitle: "Bem vindo ao app, muita coisa pode acontecer aqui, espero que você tenha uma boa experiência", buttonTitle: "Começar")
        ]
    }
}
