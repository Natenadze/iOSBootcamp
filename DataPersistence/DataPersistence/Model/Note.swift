//
//  Notes.swift
//  DataPersistence
//
//  Created by Davit Natenadze on 05.11.23.
//

import Foundation

struct Note {
    var noteText: String
}


extension Note {
    static let initial = [
        Note(noteText: "note 1"),
        Note(noteText: "note 2")
    ]
}
