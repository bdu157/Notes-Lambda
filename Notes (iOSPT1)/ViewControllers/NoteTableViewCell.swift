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
    
    weak var delegate: NoteTableViewCellDelegate?
    
    private func updateView() {
        guard let notes = self.note else {return}
        self.noteLabel.text = notes.text
    }

    @IBAction func shareButtonTapped(_ sender: Any) {
        self.delegate?.shareNote(for: self)
    }
}
