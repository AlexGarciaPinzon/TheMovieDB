//
//  TokenModel.swift
//  ExamenCoppel
//
//  Created by Gabriel Alexandro Garcia Pinzon on 24/11/21.
//

import Foundation

struct TokenModel: Decodable{
    let success: Bool?
    let expires_at: String?
    let request_token: String?
}

struct SessionModel: Decodable {
    let success: String?
    let session_id: String?
}
