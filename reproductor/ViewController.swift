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
    private var reproductor: AVAudioPlayer! //esta variable contiene el reproductor
    
    @IBOutlet weak var imageView: UIImageView!
    
   
    var canciones = ["Kalavela Shot Me Down", "Drunken Masta","True Frontliner"]
    //un arreglo con las canciones
    

    override func viewDidLoad() {
        super.viewDidLoad()
       // Do any additional setup after loading the view, typically from a nib.
        
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
        
        //let frontCoverUrl = NSBundle.mainBundle().URLForResource("Unknown", withExtension: "jpeg")
        //let drunkenCoverUrl = NSBundle.mainBundle().URLForResource("Unknown-1", withExtension: "jpeg")
        //let kalavelaCoverUrl = NSBundle.mainBundle().URLForResource("Unknown-2", withExtension: "jpeg")
        
        //se crea una URL para cada cancion, tambien trate de agregar la imagen mas no pude
        
        
            if (row == 0){
                nombreCancion.text = canciones[0]
                do{
                try reproductor = AVAudioPlayer(contentsOfURL: kalavelaUrl!)
                }
                catch{
                    print("error")
                }
                reproductor.play()
                //aqui se determina que si row es igual a 0 que seria la primera cancion, el texto sera igual a el componente 0 del arreglo. Y utilizara do para reproducir
                
                
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