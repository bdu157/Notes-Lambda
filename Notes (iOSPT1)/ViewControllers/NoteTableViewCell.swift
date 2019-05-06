//
//  NoteTableViewCell.swift
//  Notes (iOSPT1)
//
//  Created by Dongwoo Pae on 4/29/19.
//  Copyright © 2019 Dongwoo Pae. All rights reserved.
//

import UIKit

//steps
//1. create Protocol
//2. weak var Delegate of protocol
//3. Call delegate method in IBAction
//4. assign the delegate


//this case we want the ViewController - NotesViewController to share the note not view

protocol NoteTableViewCellDelegate: AnyObject {
    func shareNote(for cell: NoteTableViewCell)
}

class NoteTableViewCell: UITableViewCell {

    @IBOutlet weak var noteLabel: UILabel!
    
    var note: Note? {
        didSet {
            self.updateView()
        }
    }
    
    weak var delegatessss: NoteTableViewCellDelegate?
    
    private func updateView() {
        guard let notes = self.note else {return}
        self.noteLabel.text = notes.text
    }

    @IBAction func shareButtonTapped(_ sender: Any) {
        self.delegatessss?.shareNote(for: self)   //when button pushed UIActivityViewController needs to pop up within NotesViewController not within NoteTableViewCell. so we use protocol and delegate to perform this - delegator - user tapped on this button what are you going to do to viewcontroller (delegate) then gives the func
    }
}
