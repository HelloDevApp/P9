//
//  Error.swift
//  P9
//
//  Created by Mac Book Pro on 08/04/2019.
//  Copyright © 2019 dylan. All rights reserved.
//

import Foundation


enum ErrorMessages: String {
    
    case oupps = "Oups" // title of message alert
    
    // CCONVERTER-TRASNLATER-WEATHER _ (Interface) (Messages Alert)
    case noSuccess = "La requête a echoué."
    case isEmpty = "Entrer une valeur."
    case problem = "Erreur, veuillez réessayer."
    
   
    // CONVERTER _ (Interface) (Message Alert)
    case noRates = "Les valeurs des taux ne sont pas disponibles pour le moment."
    case pointAlreadyExists = "Un seul point est autorisé."
    case startWithPoint = "Vous ne pouvez pas commencer avec un point."
    // CONVERTER _ (Request) (Error Code)
    case errorURLComplete_Converter = "Erreur 1000"
    case errorDataNilOrError_Converter = "Erreur 1001"
    case errorResponseIsNotHTTPURLResponse_Converter = "erreur 1002"
    case errorStatusCode500_Converter = "Erreur 1003"
    case errorStatusCode_Converter = "Erreur 1004"
    case errorJSONDecoder_Converter = "Erreur 1005"
    case errorJSONRatesIsNil_Converter = "Erreur 1006"
    case errorUpdateDateRates_Converter = "Erreur 1007"
    // CONVERTER _ (Request)
    case noTimestamp = "La date de mise a jour de taux n'est pas disponible"
    
    
    // Translater _ (Interface) (Message Alert)
    case ValueTooLong = "Vous avez atteint la limite des caractères."
    case noTranslations = "Les traductions ne sont pas disponibles pour le moment."
    // error code Translater _ (Request) (Error Code)
    case errorURLComplete_Translater = "Erreur 2000"
    case errorDataNilOrError_Translater = "Erreur 2001"
    case errorResponseIsNotHTTPURLResponse_Translater = "Erreur 2002"
    case errorStatusCode500_Translater = "Erreur 2003"
    case errorStatusCode_Translater = "Erreur 2004"
    case errorJSONDecoder_Translater = "Erreur 2005"
    case errorTranslationLastNIL_Translater = "Erreur code: 2006"
    
    
    // WEATHER _ (Interface) (Message Alert)
    case noResult = "Les résultats ne sont pas disponibles pour le moment."
    case noCity = "Le nom de la ville n'est pas disponible pour le moment."
    case noIcon = "L'icone n'est pas disponible pour le moment.'"
    case noTemp = "La température n'est pas disponible pour le moment."
    case noHumidity = "L'humidité n'est pas disponible pour le moment."
    case noDescription = "La description n'est pas disponible pour le moment."
    // error code WEATHER _ (Request) (Error Code)
    case errorURLComplete_Weather = "Erreur 3000"
    case errorDataNilOrError_Weather = "Erreur 3001"
    case errorResponseIsNotHTTPURLResponse_Weather = "Erreur 3002"
    case errorStatusCode500_Weather = "Erreur 3003"
    case errorStatusCode_Weather = "Erreur 3004"
    case errorJSONDecoder_Weather = "Erreur 3005"
    case errorIconsIsNil = "Erreur 3006"
    case errorIconCodeIsNil = "Erreur 3007"
}
