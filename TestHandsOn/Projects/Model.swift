//
//  Todo.swift
//  Medium
//
//  Created by Gabriela Bezerra on 07/06/20.
//

import Foundation

struct Organization: Codable {
    let id: Int?
    let bridgeId: Int?
    let name: String?
    let url: String?
}

struct Program: Codable {
    let id: Int
    let region: String
    let organization: Organization
    let active: Bool
    let title: String
    let summary: String
    let projectLink: String
    let contactURL: String?
    let goal: Double
    let funding: Double
    let remaining: Double
    let numberOfDonations: Int
}
