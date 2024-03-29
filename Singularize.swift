//
//  Singularize.swift
//  Singularize
//
//  Created by Andrew Goodwin on 6/18/19.
//  Copyright © 2019 DevDrew. All rights reserved.
//

import Foundation
import UIKit

class Singularize{
    let unchangeables = ["sheep","series","species","deer","moose","swine","bison","corps","means","scissors","trout","aircraft","watercraft","hovercraft","spacecraft","faux pas","grouse","offspring","ox","salmon","shrimp","tuna"]
    
    var irregularNouns = [IrregularNoun]()
    
    init(){
        setIrregularNouns()
    }
    
    private func setIrregularNouns(){
        irregularNouns.append(IrregularNoun(singular: "child", plural: "children"))
        irregularNouns.append(IrregularNoun(singular: "goose", plural: "geese"))
        irregularNouns.append(IrregularNoun(singular: "man", plural: "men"))
        irregularNouns.append(IrregularNoun(singular: "woman", plural: "women"))
        irregularNouns.append(IrregularNoun(singular: "tooth", plural: "teeth"))
        irregularNouns.append(IrregularNoun(singular: "foot", plural: "feet"))
        irregularNouns.append(IrregularNoun(singular: "mouse", plural: "mice"))
        irregularNouns.append(IrregularNoun(singular: "person", plural: "people"))
        irregularNouns.append(IrregularNoun(singular: "datum", plural: "data"))
        irregularNouns.append(IrregularNoun(singular: "appendix", plural: "appendices"))
        irregularNouns.append(IrregularNoun(singular: "ox", plural: "oxen"))
        irregularNouns.append(IrregularNoun(singular: "louse", plural: "lice"))
        irregularNouns.append(IrregularNoun(singular: "die", plural: "dice"))
        irregularNouns.append(IrregularNoun(singular: "addendum", plural: "addenda"))
        irregularNouns.append(IrregularNoun(singular: "bacterium", plural: "bacteria"))
        irregularNouns.append(IrregularNoun(singular: "beau", plural: "beaux"))
        irregularNouns.append(IrregularNoun(singular: "bureau", plural: "bureaux"))
        irregularNouns.append(IrregularNoun(singular: "chateau", plural: "chateaux"))
        irregularNouns.append(IrregularNoun(singular: "codex", plural: "codices"))
        irregularNouns.append(IrregularNoun(singular: "concerto", plural: "concerti"))
        irregularNouns.append(IrregularNoun(singular: "corpus", plural: "corpora"))
        irregularNouns.append(IrregularNoun(singular: "erratum", plural: "errata"))
        irregularNouns.append(IrregularNoun(singular: "formula", plural: "formulae"))
        irregularNouns.append(IrregularNoun(singular: "genus", plural: "genera"))
        irregularNouns.append(IrregularNoun(singular: "graffito", plural: "graffiti"))
        irregularNouns.append(IrregularNoun(singular: "larva", plural: "larvae"))
        irregularNouns.append(IrregularNoun(singular: "libretto", plural: "libretti"))
        irregularNouns.append(IrregularNoun(singular: "die", plural: "dice"))
        irregularNouns.append(IrregularNoun(singular: "matrix", plural: "matrices"))
        irregularNouns.append(IrregularNoun(singular: "medium", plural: "media"))
        irregularNouns.append(IrregularNoun(singular: "memorandum", plural: "memoranda"))
        irregularNouns.append(IrregularNoun(singular: "minutia", plural: "minutiae"))
        irregularNouns.append(IrregularNoun(singular: "nebula", plural: "nebulae"))
        irregularNouns.append(IrregularNoun(singular: "opus", plural: "opera"))
        irregularNouns.append(IrregularNoun(singular: "ovum", plural: "ova"))
        irregularNouns.append(IrregularNoun(singular: "phylum", plural: "phyla"))
        irregularNouns.append(IrregularNoun(singular: "referendum", plural: "referenda"))
        irregularNouns.append(IrregularNoun(singular: "stratum", plural: "strata"))
        irregularNouns.append(IrregularNoun(singular: "symposium", plural: "symposia"))
        irregularNouns.append(IrregularNoun(singular: "tableau", plural: "tableaux"))
        irregularNouns.append(IrregularNoun(singular: "vertebra", plural: "vertebrae"))
        irregularNouns.append(IrregularNoun(singular: "vertex", plural: "vertices"))
        irregularNouns.append(IrregularNoun(singular: "vita", plural: "vitae"))
        irregularNouns.append(IrregularNoun(singular: "vortex", plural: "vortices"))
    }
    
    func isValidWord(word:String)->Bool{
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        return misspelledRange.location == NSNotFound
    }
    
    func isIrregular(word:String)->Bool{
        return irregularNouns.filter({$0.singular == word || $0.plural == word}).count > 0
    }
    
    func getIrregularSingularForm(word:String)->String{
        if let irregularNoun = irregularNouns.filter({$0.plural == word}).first{
            return irregularNoun.singular
        }
        return word
    }
    
    func isPluralDifferent(word:String)->Bool{        
        return unchangeables.filter({$0 == word}).count == 0
    }
    
    func removePluralization(word:String) -> String{
        
        guard isPossiblePlural(word: word) else { return word }
        
        let word = word.lowercased()
        
        if isPluralDifferent(word: word){
            
            if isIrregular(word: word){
                return getIrregularSingularForm(word: word)
            }
            else{
                if word.hasSuffix("ies"){ //cities => city
                    let no_ies = "\(word.dropLast(3))"
                    let y = no_ies + "y"
                    if isValidWord(word: y){
                        return y
                    }
                }
                else if word.hasSuffix("ves"){
                    let no_ves = "\(word.dropLast(3))"
                    
                    var ends_f_fe = no_ves + "f"
                    var isGood = false
                    if isValidWord(word: ends_f_fe){ //wolves => wolf
                        isGood = true
                    }
                    else{
                        ends_f_fe = ends_f_fe + "e"
                        if isValidWord(word: ends_f_fe){ //wives => wife
                            isGood = true
                        }
                    }
                    
                    if isGood{
                        return ends_f_fe
                    }
                }
                else if word.hasSuffix("es"){
                    let no_es = "\(word.dropLast(2))"
                    
                    //check for word ending in "o"
                    if no_es.hasSuffix("o"){
                        //potatoes => potato
                        if isValidWord(word: no_es){
                            return no_es
                        }
                    }
                    else if no_es.hasSuffix("s") || no_es.hasSuffix("ss") || no_es.hasSuffix("sh") || no_es.hasSuffix("ch") || no_es.hasSuffix("x") || no_es.hasSuffix("z"){ //check for -s, -ss, -sh, -ch, -x, -z
                        if isValidWord(word: no_es){
                            return no_es
                        }
                        else if no_es.hasSuffix("ss") || no_es.hasSuffix("zz"){ //check for double ss or zz
                            let noDouble = "\(no_es.dropLast())"
                            if isValidWord(word: noDouble){
                                return noDouble
                            }
                        }
                    }
                    
                    //check for word ending in "is"
                    let end_is = no_es + "is"
                    if isValidWord(word: end_is){
                        return end_is
                    }
                }
                else if word.hasSuffix("a"){
                    //phenomena
                    let no_a = "\(word.dropLast())"
                    let on = no_a + "on"
                    if isValidWord(word: on){
                        return on
                    }
                }
                else if word.hasSuffix("i"){
                    //cacti
                    let no_i = "\(word.dropLast())"
                    let us = no_i + "us"
                    if isValidWord(word: us){
                        return us
                    }
                }
                if word.hasSuffix("s"){
                    let no_s = "\(word.dropLast())"
                    if isValidWord(word: no_s){
                        return no_s
                    }
                }
            }
        }
        
        return word
    }
    
    func isPossiblePlural(word:String)->Bool{
        
        guard word.count > 1 else { return false } //must not be a single letter
        
        if word.count == 2 && !word.hasSuffix("s"){
            return false
        }
        
        if isIrregular(word: word){
            return true
        }
        
        if unchangeables.contains(word){
            return true
        }
        
        if word.hasSuffix("s") || word.hasSuffix("a") || word.hasSuffix("i"){
            return true
        }
        
        return false
    }
    
    func isMatch(left:String, right:String)->Bool{
        
        guard isValidWord(word: left) && isValidWord(word: right) else { return false }
        
        if left.lowercased() == right.lowercased(){
            return true
        }
        
        let leftRemoved = removePluralization(word: left)
        let rightRemoved = removePluralization(word: right)
        
        if leftRemoved == rightRemoved{
            return true
        }
        
        if isValidWord(word: left) && isValidWord(word: rightRemoved){
            if left == rightRemoved{
                return true
            }
        }
        
        if isValidWord(word: right) && isValidWord(word: leftRemoved){
            if leftRemoved == right{
                return true
            }
        }
        
        return false
    }
}

class IrregularNoun{
    var singular = ""
    var plural = ""
    
    init(singular:String, plural:String){
        self.singular = singular
        self.plural = plural
    }
}



