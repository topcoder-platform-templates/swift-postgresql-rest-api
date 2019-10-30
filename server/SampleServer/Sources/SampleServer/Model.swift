//
//  Model.swift
//  SampleServer
//
//  Created by Volkov Alexander on 10/12/19.
//

import Foundation

/// The model object
struct Model: Codable {
    
    /// the fields
    var id: UUID?
    let handle: String
}
