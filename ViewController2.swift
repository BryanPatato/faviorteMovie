//
//  ViewController2.swift
//  faviorteMovie
//
//  Created by BRYAN RUIZ on 10/19/21.
//

import UIKit

class ViewController2: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    var blah: MovieClass!
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "\(blah!.name): with \(blah!.rating) and a main actor of \(blah!.mainA)"
        // Do any additional setup after loading the view.
    }
    


}
