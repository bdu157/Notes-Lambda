//
//  NotesViewController.swift
//  Notes (iOSPT1)
//
//  Created by Dongwoo Pae on 4/29/19.
//  Copyright © 2019 Dongwoo Pae. All rights reserved.
//

import UIKit
// Assign the delegate when creating the delegator (view)
// adopt the protocol in our class declaration
// conform to the protocol
class NotesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, NoteTableViewCellDelegate {

    let notesController = NotesController()
    
    //Outlets and Properties
    
    @IBOutlet weak var noteTableView: UITableView!
    
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.noteTableView.delegate = self
        self.noteTableView.dataSource = self

    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.notesController.notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoteCell", for: indexPath)
        
        guard let noteCell = cell as? NoteTableViewCell else {return cell}
        let note = notesController.notes[indexPath.row]
        noteCell.note = note
        noteCell.delegate = self
        return cell

    }
    
   
    // MARK: - Navigation
/*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToDetail" {
            guard let cell = sender as? NoteTableViewCell,
                let detailVC = segue.destination as? DetailViewController else {return}

            detailVC.note = cell.note
        }

    }

 */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToDetail" {
            guard let selectedRow = self.noteTableView.indexPathForSelectedRow,
                let detailVC = segue.destination as? DetailViewController else { return }
            
            let note = self.notesController.notes[selectedRow.row]
            detailVC.note = note
        }
    }


    @IBAction func saveNoteButtonTapped(_ sender: Any) {
        guard let text = self.textView.text else {return}
        
        notesController.createNote(withText: text)
        self.textView.text = nil
        self.noteTableView.reloadData()
        
    }
    
    func shareNote(for cell: NoteTableViewCell) {
        guard let note = cell.note else {return}
        let text = note.text
        let activityController = UIActivityViewController(activityItems: [text], applicationActivities: nil)
        self.present(activityController, animated: true, completion: nil)
    }
    
    /*
     1. create protocol
     2. add properties and methods to protocol
     3. In delegator, create (weak var delegate) property of type [Protocol]
     4 In IBAction call self.delegate.[insert method name here]
     
     
     // Delegate View
     1. adopt the protocol
     2. assign the delegate when initializing the delegator view
     3. "Add protocol stubs"
     4. add code in delegate method that you want the delegate to complete
    */
    
    
}
