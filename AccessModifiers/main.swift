import Foundation

// Funktion zur Berechnung des Fahrpreises basierend auf dem Ziel
func berechneFahrpreis(ziel: String) -> Int {
    var preis = 0
    // Logik zur Preisberechnung basierend auf dem Ziel
    switch ziel.lowercased() {
    case "muenchen":
        preis = 200
    case "frankfurt":
        preis = 180
    case "hamburg" :
        preis = 250
    case "berlin" :
        preis = 300
    case "stutgart":
        preis = 280
    default:
        preis = -1
    }
    return preis
}

// Funktion zur Eingabe mit Datentyp als Parameter
func eingabe(_ message: String, datatyp: String) -> Any {
    print(message, terminator: ": ")
    guard let input = readLine() else {
        return "Invalid input"
    }
    
    
    switch datatyp {
    case "String":
        return input
    case "Int":
        return Int(input) ?? 0
    case "Float":
        return Float(input) ?? 0.0
    default:
        return "Invalid data type"
    }
}

// Funktion zur Berechnung des Preises mit Bahncard-Rabatt
func berechneBC(preis: Int, bc: Int) -> Double {
    if bc == 50 {
        return Double(preis) * 0.5
    } else {
        return Double(preis) * 0.75
    }
}

func hinUndRueck(preis:Double) -> Double{
    return preis * 2
 
}

func klasse(preis: Double)-> Double{
    
    let inputKlasse = eingabe("Wollen Sie Erste oder Zweite Klasse?(E/Z) ", datatyp: "String") as! String
    if inputKlasse.lowercased() == "e"{
        return (preis * 1.25)
    }else{
        return preis
    }
}


func personen (jederPersonPreis: Double)-> Double{
    let personenZeichen = eingabe("Wie viele Personen sind Sie?", datatyp: "Int") as! Int
    
    return (jederPersonPreis * Double(personenZeichen))
}

func bezahlen(preis : Double) {
    
    print("Ihr Fahrt kostet : \(preis)")
    let bezahlt = eingabe("Bitte bezahlen Sie hier : ", datatyp: "Float" ) as! Float
    if Double( bezahlt) == preis {
       
        print("Hier ist Ihre Fahrkarte")

  }
    else if Double( bezahlt) > preis {
        print("Hier Ihre Fahrkarte und Ihr rest Geld",Double( bezahlt) - preis)
        
    }
    else {
        let div = preis - Double( bezahlt)
        bezahlen(preis: div)
   
        
    }
    
        
}


func main() {
//    fahrkartAutomat()
    
    print("Fahrkarten Automat")
    
    let userziel = eingabe("Wohin wollen Sie fahren?", datatyp: "String") as! String
    var preis = 0.0
    if userziel != "-1"{
        
        // Preisberechnung basierend auf dem Ziel
        preis = Double(berechneFahrpreis(ziel: userziel))
        
        let hinUndRück = eingabe("Wollen Sie Hin und Rückfhren ?(Yes/No)", datatyp: "String") as! String
        if hinUndRück == "yes"{
            preis = Double( hinUndRueck(preis: preis))
        }
        
        // Eingabe der Bahncard mit korrektem Datentyp Int
        let bc = eingabe("Bahncard 50, 25, 0?", datatyp: "Int") as! Int
        
        // Anpassung der Berechnung des Preises mit Bahncard-Rabatt
        if bc == 50 || bc == 25 {
            preis = berechneBC(preis: Int(preis), bc: bc)
        }
        
        // Weitere Implementierung für Hin und Rück, Preisberechnung und Bezahlung
        
        preis = (hinUndRueck(preis : preis))
        
        // Hier kannst du Methoden wie `hinUndRueck(preis:)` und `bezahlen(preis:)` hinzufügen
        preis = (klasse(preis: preis))
        
        
        preis = personen(jederPersonPreis: preis)
        print("Das Gesamtpreis,das Sie bezahlen müssen, ist: \(preis)")
        
        bezahlen(preis: preis)
    }else {
        print("Dieses Ziel kennen wir nicht")
    }
}


main()
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
