//
//  ViewController.swift
//  reproductor
//
//  Created by Seba Benavides on 22-12-15.
//  Copyright © 2015 Seba Benavides. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var pickerCanciones: UIPickerView!
    @IBOutlet weak var nombreCancion: UILabel!
    private var reproductor: AVAudioPlayer!
    
   
    var canciones = ["Kalavela Shot Me Down", "Drunken Masta","True Frontliner"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
       // Do any additional setup after loading the view, typically from a nib.
        
        }
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
        
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.canciones.count
        
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return canciones[row]
        
        
    
    }
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.pickerCanciones.dataSource = self
        self.pickerCanciones.delegate = self
        let kalavelaUrl = NSBundle.mainBundle().URLForResource("Dr. Rude - Kalavela Shot Me Down", withExtension: "mp3")
        let drunkenUrl = NSBundle.mainBundle().URLForResource("27 Drunken Masta", withExtension: "mp3")
        let frontlinerUrl = NSBundle.mainBundle().URLForResource("Electronic Vibes - True Frontliner (A Dedication to Frontliner)", withExtension: "mp3")
            if (row == 0){
                nombreCancion.text = canciones[0]
                do{
                try reproductor = AVAudioPlayer(contentsOfURL: kalavelaUrl!)
                }
                catch{
                    print("error")
                }
                reproductor.play()
                
                
                
            }else if (row == 1){
                nombreCancion.text = canciones[1]
                do{
                try reproductor = AVAudioPlayer(contentsOfURL: drunkenUrl!)
                }catch{
                    print("error")
                }
                reproductor.play()
                
                
            }else if (row == 2){
                nombreCancion.text = canciones[2]
                do{
                try reproductor = AVAudioPlayer(contentsOfURL: frontlinerUrl!)
                }catch{
                print("error")
                }
                reproductor.play()
        }}
    
    
        
    
    
    @IBAction func stop() {
        if reproductor.playing{
            reproductor.stop()
        }
        
    }
    
    @IBAction func play() {
        if !reproductor.playing{
            reproductor.play()
        }}

    @IBAction func pause() {
        if reproductor.playing{
            reproductor.pause()
        }
    }

}