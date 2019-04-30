//
//  DetailViewController.swift
//  Notes (iOSPT1)
//
//  Created by Dongwoo Pae on 4/29/19.
//  Copyright © 2019 Dongwoo Pae. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var note: Note? {
        didSet {
            self.updateView()
        }
    }
    
    @IBOutlet weak var noteDetailTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateView()
        // Do any additional setup after loading the view.
    }
    
    private func updateView() {
        guard let note = self.note, isViewLoadedß else {return}
        noteDetailTextView.text = note.text
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
