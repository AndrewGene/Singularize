//
//  SingularizeTests.swift
//  SingularizeTests
//
//  Created by Andrew Goodwin on 6/18/19.
//  Copyright © 2019 DevDrew. All rights reserved.
//

import XCTest
@testable import Singularize

class SingularizeTests: XCTestCase {

    var singularize = Singularize()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testTwoSingular() {
        let singular = "wolf"
        let plural = "wolf"
        XCTAssertTrue(singularize.isMatch(left: singular, right: plural))
    }
    
    func testTwoPlural() {
        let singular = "wolves"
        let plural = "wolves"
        XCTAssertTrue(singularize.isMatch(left: singular, right: plural))
    }
    
    func testNonChanging() {
        let singular = "deer"
        let plural = "deer"
        XCTAssertTrue(singularize.isMatch(left: singular, right: plural))
    }
    
    func testIrregular() {
        let singular = "child"
        let plural = "children"
        XCTAssertTrue(singularize.isMatch(left: singular, right: plural))
    }
    
    func testIncorrect() {
        let singular = "child"
        let plural = "childrens"
        XCTAssertFalse(singularize.isMatch(left: singular, right: plural))
    }
    
    func testSuffixAToON() {
        let singular = "phenomenon"
        let plural = "phenomena"
        XCTAssertTrue(singularize.isMatch(left: singular, right: plural))
    }
    
    func testSuffixIToUS() {
        let singular = "cactus"
        let plural = "cacti"
        XCTAssertTrue(singularize.isMatch(left: singular, right: plural))
    }
    
    func testSuffixIESToY() {
        let singular = "city"
        let plural = "cities"
        XCTAssertTrue(singularize.isMatch(left: singular, right: plural))
    }
    
    func testSuffixVESToF() {
        let singular = "wolf"
        let plural = "wolves"
        XCTAssertTrue(singularize.isMatch(left: singular, right: plural))
    }
    
    func testSuffixVESToFE() {
        let singular = "wife"
        let plural = "wives"
        XCTAssertTrue(singularize.isMatch(left: singular, right: plural))
    }
    
    func testSuffixESToO() {
        let singular = "potato"
        let plural = "potatoes"
        XCTAssertTrue(singularize.isMatch(left: singular, right: plural))
    }
    
    func testSuffixESToIS() {
        let singular = "analysis"
        let plural = "analyses"
        XCTAssertTrue(singularize.isMatch(left: singular, right: plural))
    }
    
    func testSuffixES() {
        let singular = "bus"
        let plural = "buses"
        XCTAssertTrue(singularize.isMatch(left: singular, right: plural))
    }
    
    func testSuffixESDoubleSorZ() {
        let singular = "truss"
        let plural = "trusses"
        XCTAssertTrue(singularize.isMatch(left: singular, right: plural))
    }
    
    func testSuffixS() {
        let singular = "cat"
        let plural = "cats"
        XCTAssertTrue(singularize.isMatch(left: singular, right: plural))
    }
    
    func testIsValidWord() {
        let word = "cat"
        XCTAssertTrue(singularize.isValidWord(word: word))
    }
    
    func testIsInvalidWord() {
        let word = "catz"
        XCTAssertFalse(singularize.isValidWord(word: word))
    }
    
    func testRemovePluralization() {
        let word = "cities"
        XCTAssertEqual("city", singularize.removePluralization(word: word))
    }
    
    func testRemovePluralizationIrregular() {
        let word = "children"
        XCTAssertEqual("child", singularize.removePluralization(word: word))
    }
    
    func testRemovePluralizationForDoubleS() {
        let word = "gasses"
        XCTAssertEqual("gas", singularize.removePluralization(word: word))
    }
    
    func testRemovePluralizationAToOn() {
        let word = "phenomena"
        XCTAssertEqual("phenomenon", singularize.removePluralization(word: word))
    }
    
    func testRemovePluralizationESWithSH() {
        let word = "marshes"
        XCTAssertEqual("marsh", singularize.removePluralization(word: word))
    }
    
    func testRemovePluralizationESWithCH() {
        let word = "lunches"
        XCTAssertEqual("lunch", singularize.removePluralization(word: word))
    }
    
    func testRemovePluralizationESWithX() {
        let word = "taxes"
        XCTAssertEqual("tax", singularize.removePluralization(word: word))
    }
    
    func testRemovePluralizationESWithZ() {
        let word = "blitzes"
        XCTAssertEqual("blitz", singularize.removePluralization(word: word))
    }
    
    func testIsMatchForFalseSRemoval() {
        let singular = "gas"
        let plural = "gasses"
        XCTAssertTrue(singularize.isMatch(left: plural, right: singular))
    }
    
    func testIsMatchDifferentWords() {
        let singular = "gas"
        let plural = "bus"
        XCTAssertFalse(singularize.isMatch(left: plural, right: singular))
    }
    
    func testRemovePluralizationSuffixVESToFE() {
        let word = "wives"
        XCTAssertEqual("wife", singularize.removePluralization(word: word))
    }
    
    func testRemovePluralizationSuffixVESToF() {
        let word = "wolves"
        XCTAssertEqual("wolf", singularize.removePluralization(word: word))
    }
    
    func testHasSuffix(){
        let word = "soccer"
        XCTAssertTrue(word.hasSuffix("er"))
    }
    
    func testDropLast(){
        let word = "soccer"
        XCTAssertEqual("socc", word.dropLast(2))
    }
    
    func testIsPossiblePluralIrregular(){
        let word = "children"
        XCTAssertTrue(singularize.isPossiblePlural(word: word))
    }
    
    func testIsPossiblePluralUncountable(){
        let word = "species"
        XCTAssertTrue(singularize.isPossiblePlural(word: word))
    }
    
    func testIsPossiblePluralSuffixS(){
        let word = "plants"
        XCTAssertTrue(singularize.isPossiblePlural(word: word))
    }
    
    func testIsPossiblePluralSuffixA(){
        let word = "phenomena"
        XCTAssertTrue(singularize.isPossiblePlural(word: word))
    }
    
    func testIsPossiblePluralSuffixI(){
        let word = "cacti"
        XCTAssertTrue(singularize.isPossiblePlural(word: word))
    }
    
    func testIsPossiblePluralNot(){
        let word = "trix"
        XCTAssertFalse(singularize.isPossiblePlural(word: word))
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
            let word = "wolves"
            let _ = singularize.removePluralization(word: word)
        }
    }

}
