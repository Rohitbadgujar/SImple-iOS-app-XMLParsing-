import Foundation
class XMLHeritageParser: NSObject, XMLParserDelegate{
    var name: String;
    init(name: String) {
        self.name = name;
    }
    
    //vars to hold tag data
    var pName, pAddress, pInformation, pImage, pUrl : String!;
    
    //vars to spy during parsing
    var elementId = -1;
    var passData = false;
    
    //vars to manage whole data
    var heritage = HeritageDetails();
    var place = [HeritageDetails](); //makes an empty array of nature person. Array with 0 elements
    
    var parser = XMLParser();
    var tags = ["name","address","information","image","url"];
    
    //parser delegate methods
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        //if elementName is in tags then spy
        if(tags.contains(elementName)){
            passData = true;
            switch elementName{
            case "name"   : elementId = 0;
            case "address": elementId = 1;
            case "information":   elementId = 2;
            case "image":   elementId = 3;
            case "url":     elementId = 4;
            default: break;
            }
        }
        
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        //based on the spies grab some data into pVars
        if passData{
            switch elementId{
            case 0: pName = string
            case 1: pAddress = string
            case 2: pInformation = string
            case 3: pImage = string
            case 4: pUrl = string
            default: break;
            }
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        //reset the spies
        if (tags.contains(elementName)){
            passData = false;
            elementId = -1;
        }
        //if elementName is person then make a person and append to people
        if (elementName == "heritage"){
            heritage = HeritageDetails(name: pName, address: pAddress, information: pInformation, image: pImage, url: pUrl);
            place.append(heritage);
        }
    }
    
    func parsing(){
        //get the path of the xml file
        let bundleUrl = Bundle.main.bundleURL;
        let fileUrl = URL(fileURLWithPath: self.name, relativeTo: bundleUrl)
        //make a parser for this file
        parser = XMLParser(contentsOf: fileUrl)!
        
        //give the delegate and parse
        parser.delegate = self;
        parser.parse();
    }
    
}
