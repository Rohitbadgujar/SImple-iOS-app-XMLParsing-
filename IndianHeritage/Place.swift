//
//  Place.swift
//  IndianHeritage
//
//  Created by Rohit on 12/16/1397 AP.
//  Copyright © 1397 Rohit. All rights reserved.
//

//

import Foundation

class Place{
    var place : [HeritageDetails];
    //properties
    init(){
        place = [
            HeritageDetails(name: "Akhilesh Bhatia", address: "123456", information: "Castlewhite", image: "abc.jpg", url: "www.example.com")
           
        ]
        
    }
    //inits
    init(fromContentOfXML : String){
        //make a XMLPeopleParser
        let parser = XMLHeritageParser(name: fromContentOfXML);
        
        //parsing
        parser.parsing();
        
        //set peopleData with whatever comes from parsing
        place = parser.place;
    }
    //methods
    
    func count() -> Int { return place.count}
    
    func heritageData(index: Int) -> HeritageDetails{ return place[index]}
}
