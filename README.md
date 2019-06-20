# Singularize
Checks whether two words are equal regardless of plurality.  Supports English for now.

## isMatch(left:String, right:String)->Bool
### This is the main function you will need.
```swift
let singularize = Singularize()
        
let singular = "city"
        
let plural = "cities"
        
let matching = singularize.isMatch(left:singular,right:plural) //returns true
```

It will simply bring both words down to the singular form, lower case them, then check to see if they are equal.  Left and Right parameters are used because the order of singular and plural doesn't matter.

## Installing
Drag-and-drop **Singularize.swift** into your project.

## isValidWord(word:String)->Bool
```swift
let singularize = Singularize()
        
var word = "cat"
        
var matching = singularize.isValidWord(word:word) //returns true

word = "catz"
        
matching = singularize.isValidWord(word:word) //returns false
```
## removePluralization(word:String)->String
```swift
let singularize = Singularize()
        
var word = "children"
        
var removed = singularize.removePluralization(word:word) //returns "child"
```

## isIrregular(word:String)->Bool
```swift
let singularize = Singularize()
        
var word = "children"
        
var irregular = singularize.isIrregular(word:word) //returns true

word = "child"
        
irregular = singularize.isIrregular(word:word) //returns true because the plural version is irregular
```

# How you can help
Please consider making a pull request if you would like to help with localization.  Unfortunately, I only speak English.  Where possible, please add unit tests along with your PR.  Thanks.

# TODOs
- [x] ~~100% Code Coverage~~
- [x] ~~Update to Swift 5~~
- [x] ~~Add more irregular nouns~~
- [ ] Add Cocoapods support
- [ ] Add Swift Package Manager support
- [ ] Get help to add localizations
