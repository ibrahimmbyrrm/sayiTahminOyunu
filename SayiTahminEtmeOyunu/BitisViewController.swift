//
//  BitisViewController.swift
//  SayiTahminEtmeOyunu
//
//  Created by İbrahim Bayram on 14.12.2022.
//

import UIKit

class BitisViewController: UIViewController {
    var sonuc : Bool?
    @IBOutlet weak var sonucLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if sonuc! {
            sonucLabel.text = "Kazandınız tebrikler :D"
        }else {
            sonucLabel.text = "Kaybettiniz"
        }


    }

    @IBAction func tyrAgain(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
}
