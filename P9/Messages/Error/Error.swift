//
//  Error.swift
//  P9
//
//  Created by Mac Book Pro on 08/04/2019.
//  Copyright © 2019 dylan. All rights reserved.
//

import Foundation

enum Error_: String {
    
    case oupps = "Oupps"
    case noSuccess = "La requete a echoué."
    case noResult = "Les résultats ne sont pas disponible pour le moment."
    case isEmpty = "Entrer une valeur."
    case problem = "Erreur, veuillez réessayer."
    case ValueTooLong = "Vous avez atteint la limite des caractères."
    
    //converter
    case noRates = "Les valeurs des taux ne sont pas disponible pour le moment."
    case pointAlreadyExists = "Un seul point est autorisé."
    case startWithPoint = "Vous ne pouvez pas commencé avec un point."
    
    // Weather
    case noCity = "Le nom de la ville n'est pas disponible pour le moment."
    case noIcon = "L'icone n'est pas disponible pour le moment.'"
    case noTemp = "La température n'est pas disponible pour le moment."
    case noHumidity = "L'humidité n'est pas disponible pour le moment."
    case noDescription = "La description n'est pas disponible pour le moment."
}
