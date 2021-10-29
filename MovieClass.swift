//
//  MovieClass.swift
//  faviorteMovie
//
//  Created by BRYAN RUIZ on 10/19/21.
//

import Foundation
import UIKit

public class MovieClass{
    
    var name:String
    var rating:String
    var mainA:String
    
    init(n:String,r:String,a:String){
    name = n
    rating = r
    mainA = a
    }
    
    init(n:String,r:String){
    name = n
    rating = r
    mainA = "no main actor"
    }
    
}
