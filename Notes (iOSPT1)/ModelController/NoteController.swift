//
//  NoteController.swift
//  Notes (iOSPT1)
//
//  Created by Dongwoo Pae on 4/29/19.
//  Copyright © 2019 Dongwoo Pae. All rights reserved.
//

import Foundation

class NotesController {
    
    private(set) var notes: [Note] = []
    
    init() {
        
        createNote(withText: "Walk the dog!")
        createNote(withText: "Eat lunch!")
        createNote(withText: "Swift is asesome!")
    }
    
    func createNote(withText text: String) {
        let note = Note(text: text)
        notes.append(note)
    }
}
