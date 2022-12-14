//
//  OyunViewController.swift
//  SayiTahminEtmeOyunu
//
//  Created by İbrahim Bayram on 14.12.2022.
//

import UIKit

class OyunViewController: UIViewController {

    @IBOutlet weak var hakLabel: UILabel!
    @IBOutlet weak var yönlendirmeLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    var sonuc1 : Bool?
    var randomNumber : Int?
    var kalanHak = 5
    override func viewDidLoad() {
        super.viewDidLoad()
        randomNumber = Int(arc4random_uniform(100))
        print("Rastgele Sayi : \(randomNumber!)")
        hakLabel.text = "Kalan Hak : \(kalanHak)"
        kalanHak = 5


    }

    @IBAction func guessButton(_ sender: Any) {
        if kalanHak != 0 {
            yönlendirmeLabel.isHidden = false
            if let tahmin = Int(textField.text!) {
                if tahmin != randomNumber {
                    if tahmin > randomNumber! {
                        kalanHak = kalanHak - 1
                        yönlendirmeLabel.text = "Azalt"
                        hakLabel.text = "Kalan Hak : \(kalanHak)"
                    }
                    if tahmin < randomNumber! {
                        kalanHak = kalanHak - 1
                        yönlendirmeLabel.text = "Arttır"
                        hakLabel.text = "Kalan Hak : \(kalanHak)"
                    }
                    
                    if kalanHak == 0 {
                        sonuc1 = false
                        performSegue(withIdentifier: "toOK", sender: nil)
                    }

                }
                if tahmin == randomNumber {
                    sonuc1 = true
                    performSegue(withIdentifier: "toOK", sender: nil)
                }
            }
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
            let gidilecekVC = segue.destination as! BitisViewController
            gidilecekVC.sonuc = sonuc1
        
    }
}
