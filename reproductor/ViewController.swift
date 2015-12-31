//
//  ViewController.swift
//  reproductor
//
//  Created by Seba Benavides on 22-12-15.
//  Copyright © 2015 Seba Benavides. All rights reserved.
//

import UIKit//cargue los Frameworks para audio
import AVFoundation

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    //defini las variables
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var pickerCanciones: UIPickerView!
    @IBOutlet weak var nombreCancion: UILabel!
    @IBAction func aleatorio(sender: AnyObject) {
    }
    
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var myVolume: UISlider!
    
    
    private var reproductor: AVAudioPlayer! //esta variable contiene el reproductor
    
    @IBOutlet weak var imageView: UIImageView!
    
   
    var canciones = ["Kalavela Shot Me Down", "Drunken Masta","True Frontliner","Wild Wild West","Tell Me"]
    //un arreglo con las canciones
    

    override func viewDidLoad() {
        super.viewDidLoad()
       // Do any additional setup after loading the view, typically from a nib.
        
        
        self.playButton.enabled = false
        self.stopButton.enabled = false
        self.pauseButton.enabled = false
        
        
        }
    @IBAction func volume(sender: AnyObject) {
        reproductor.volume = myVolume.value
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1 //Este numero determina cuantas columnas habra en el PickerView
        
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.canciones.count
        //Este valor determina la cantidad de elementos en cada columna del PickerView, en este caso 3 ya que cuenta los elementos del arreglo
        
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return canciones[row] // este valor determina el nombre que tendra cada elemento del picker view. En este caso se puede colocar tambien 0 1 o 2 y veras como dependiendo de cada numero ele elemento toma el nombre del elemento seleccionado
        
        
    
    }
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.pickerCanciones.dataSource = self
        self.pickerCanciones.delegate = self
        //necesarios para que funcione el pickerView
        let kalavelaUrl = NSBundle.mainBundle().URLForResource("Kalavela Shot Me Down", withExtension: "mp3")
        let drunkenUrl = NSBundle.mainBundle().URLForResource("Drunken Masta", withExtension: "mp3")
        let frontlinerUrl = NSBundle.mainBundle().URLForResource("True Frontliner", withExtension: "mp3")
        let wild = NSBundle.mainBundle().URLForResource("Wild Wild West", withExtension: "mp3")
        let tell = NSBundle.mainBundle().URLForResource("Tell Me", withExtension: "mp3")
        
        if (row == 0){
                nombreCancion.text = canciones[0]
                do{
                try reproductor = AVAudioPlayer(contentsOfURL: kalavelaUrl!)
                }
                catch{
                    print("error")
                    }
                reproductor.play()
                self.playButton.enabled = true
                self.stopButton.enabled = true
                self.pauseButton.enabled = true
                self.imageView.image = UIImage(named: "drrude.jpeg")
                
                //aqui se determina que si row es igual a 0 que seria la primera cancion, el texto sera igual a el componente 0 del arreglo. Y utilizara do para reproducir
                
                
            }else if (row == 1){
                nombreCancion.text = canciones[1]
                do{
                try reproductor = AVAudioPlayer(contentsOfURL: drunkenUrl!)
                }catch{
                    print("error")
                }
                reproductor.play()
                self.playButton.enabled = true
                self.stopButton.enabled = true
                self.pauseButton.enabled = true
                self.imageView.image = UIImage(named: "drunken.jpeg")
                
                
            }else if (row == 2){
                nombreCancion.text = canciones[2]
                do{
                try reproductor = AVAudioPlayer(contentsOfURL: frontlinerUrl!)
                }catch{
                print("error")
                }
                reproductor.play()
                self.playButton.enabled = true
                self.stopButton.enabled = true
                self.pauseButton.enabled = true
                self.imageView.image = UIImage(named: "frontliner.jpeg")
                
                
            }else if (row == 3){
                nombreCancion.text = canciones[3]
                do{
                    try reproductor = AVAudioPlayer(contentsOfURL: wild!)
                }catch{
                    print("error")
                }
                reproductor.play()
                self.playButton.enabled = true
                self.stopButton.enabled = true
                self.pauseButton.enabled = true
                self.imageView.image = UIImage(named: "wmf.jpg")
                
                
            }else if (row == 4){
                nombreCancion.text = canciones[4]
                do{
                    try reproductor = AVAudioPlayer(contentsOfURL: tell!)
                }catch{
                    print("error")
                }
                reproductor.play()
                self.playButton.enabled = true
                self.stopButton.enabled = true
                self.pauseButton.enabled = true
                self.imageView.image = UIImage(named: "summer.jpg")
                }
   
        }
    
    
        
    
    
    @IBAction func stop() {
        if reproductor.playing{
            reproductor.stop()
            reproductor.currentTime = 0.0
            self.playButton.enabled = true
            self.stopButton.enabled = false
            self.pauseButton.enabled = false
        }
        
    }
    
    @IBAction func play() {
        if !reproductor.playing{
            reproductor.play()
            self.playButton.enabled = false
            self.stopButton.enabled = true
            self.pauseButton.enabled = true
        }}

    @IBAction func pause() {
        if reproductor.playing{
            reproductor.pause()
            self.playButton.enabled = true
            self.stopButton.enabled = true
            self.pauseButton.enabled = false
        }
    }

    @IBAction func shufleButton(sender: AnyObject) {
        let numero = random()
        let index : Int = numero % 5
        self.pickerCanciones.selectRow(index, inComponent: 0, animated: true)
        self.pickerView(self.pickerCanciones, didSelectRow: 0, inComponent: 0)
        }}
        
        

