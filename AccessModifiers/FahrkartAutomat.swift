//
//  FahrkartAutomat.swift
//  AccessModifiers
//
//  Created by Mahshad Jafari on 12.06.24.
//

import Foundation


//
// Fahrkarten Automat
// Auf Grundlage deines WOHNORTES soll ein FAHRKARTEN Automat programmiert werden
// Ziele sind Hamburg, Berlin, München, Frankfurt, Stuttgart
// aktuelle Preis gibt es auf https://www.bahn.de/
// 1) Eingabe: Ziel (String)
// 2) Eingabe: Hin und Rückfahrt (ja/nein)
// 3) Eingabe: Erste oder Zweite Klasse
// 4) Wie viele Personen
// 5) Berechnen des Gesamtpreises           => func berechneFahrpreis(ziel: String) -> Int
// 6) Bezahlen
// 7) Erhalte Fahrkarte
//
//
//
//
//func fahrkartAutomat(){
//    print("Willkommen zu unserer Seite")
//    
//    let abstantInput = eingabe("Wohin wollen Sie fahren ?", datatyp: "String") as! String
//    let hinRuckInput = eingabe("Wollen Sie Hin und Ruck fahren ?(ja/nein)", datatyp: "String" ) as! String
//    let klasseTicket = eingabe("Wollen Sie Erste oder Zweite Klassen ? (E/Z)", datatyp: "String") as! String
//    let leute = eingabe("Wie viele Personen sind Sie ?", datatyp: "Int") as! Int
//
//    
//    
//    
//    let gesamtPreis = berechneFahrPreise(ziel: abstantInput , hinruck: hinRuckInput, klasseFahrkart: klasseTicket, person: leute)
//    print("Das gesamtpreis ist : \(gesamtPreis)")
//     
//}
//
//func berechneFahrPreise(ziel: String, hinruck: String, klasseFahrkart: String, person : Int) -> Double {
//    
//    var resultPrice = 0.0
////    # 1
//    if ziel.lowercased() == "berlin" {
//        resultPrice = 200
//    }else if ziel.lowercased() == "muenchen"{
//        resultPrice = 300
//    }else if ziel.lowercased() == "hamburg"{
//        resultPrice = 250
//    }
//    
//// #2
//    if hinruck.lowercased() == "ja"{
//        resultPrice *= 2
//    }
//    
//// #3
//    if klasseFahrkart.lowercased() == "e"{
//        resultPrice *= 1.25
//    }
//// #4
//    resultPrice *= Double(person)
//    
//    return resultPrice
//    
//}
