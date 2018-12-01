//
//  Monopoly_ARTests.swift
//  Monopoly ARTests
//
//  Created by 李双全 on 11/1/18.
//  Copyright © 2018 Shuangquan Li. All rights reserved.
//

import XCTest
@testable import Monopoly_AR

class Monopoly_ARTests: XCTestCase {

    var gameTest = ViewController()

    let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
    
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        gameTest = ViewController()
        
        
    }
    
    
    func testLocation1(){
        XCTAssertEqual(gameTest.firstPosGenerator(num: numbers[0], who: 0), CGPoint(x: -160, y: -50))
    }

    func testLocation2(){
        XCTAssertEqual(gameTest.firstPosGenerator(num: numbers[1], who: 0), CGPoint(x: -160, y: 40))
    }
    
    func testLocation3(){
        XCTAssertEqual(gameTest.firstPosGenerator(num: numbers[2], who: 0), CGPoint(x: -160, y: 130))
    }
    
    func testLocation4(){
        XCTAssertEqual(gameTest.secondPosGenerator(num: numbers[3], who: 0), CGPoint(x: -70, y: 130))
    }
    
    func testLocation5(){
        XCTAssertEqual(gameTest.secondPosGenerator(num: numbers[4], who: 0), CGPoint(x: 20, y: 130))
    }
    
    func testLocation6(){
        XCTAssertEqual(gameTest.secondPosGenerator(num: numbers[5], who: 0), CGPoint(x: 110, y: 130))
    }
    
    func testLocation7(){
        XCTAssertEqual(gameTest.thirdPosGenerator(num: numbers[6], who: 0), CGPoint(x: 110, y: 40))
    }

    func testLocation8(){
        XCTAssertEqual(gameTest.thirdPosGenerator(num: numbers[7], who: 0), CGPoint(x: 110, y: -50))
    }
    
    func testLocation9(){
        XCTAssertEqual(gameTest.thirdPosGenerator(num: numbers[8], who: 0), CGPoint(x: 110, y: -140))
    }
    
    func testLocation10(){
        XCTAssertEqual(gameTest.fourthPosGenerator(num: numbers[9], who: 0), CGPoint(x: 20, y: -140))
    }
    
    func testLocation11(){
        XCTAssertEqual(gameTest.fourthPosGenerator(num: numbers[10], who: 0), CGPoint(x: -70, y: -140))
    }
    
    func testLocation12(){
        XCTAssertEqual(gameTest.fourthPosGenerator(num: numbers[11], who: 0), CGPoint(x: -160, y: -140))
    }
    
    
    func testLocation1P2(){
        XCTAssertEqual(gameTest.firstPosGenerator(num: numbers[0], who: 1), CGPoint(x: -130, y: -50))
    }
    
    func testLocation2P2(){
        XCTAssertEqual(gameTest.firstPosGenerator(num: numbers[1], who: 1), CGPoint(x: -130, y: 40))
    }
    
    func testLocation3P2(){
        XCTAssertEqual(gameTest.firstPosGenerator(num: numbers[2], who: 1), CGPoint(x: -130, y: 130))
    }
    
    func testLocation4P2(){
        XCTAssertEqual(gameTest.secondPosGenerator(num: numbers[3], who: 1), CGPoint(x: -40, y: 130))
    }
    
    func testLocation5P2(){
        XCTAssertEqual(gameTest.secondPosGenerator(num: numbers[4], who: 1), CGPoint(x: 50, y: 130))
    }
    
    func testLocation6P2(){
        XCTAssertEqual(gameTest.secondPosGenerator(num: numbers[5], who: 1), CGPoint(x: 140, y: 130))
    }
    
    func testLocation7P2(){
        XCTAssertEqual(gameTest.thirdPosGenerator(num: numbers[6], who: 1), CGPoint(x: 140, y: 40))
    }
    
    func testLocation8P2(){
        XCTAssertEqual(gameTest.thirdPosGenerator(num: numbers[7], who: 1), CGPoint(x: 140, y: -50))
    }
    
    func testLocation9P2(){
        XCTAssertEqual(gameTest.thirdPosGenerator(num: numbers[8], who: 1), CGPoint(x: 140, y: -140))
    }
    
    func testLocation10P2(){
        XCTAssertEqual(gameTest.fourthPosGenerator(num: numbers[9], who: 1),  CGPoint(x: 50, y: -140))
    }
    
    func testLocation11P2(){
        XCTAssertEqual(gameTest.fourthPosGenerator(num: numbers[10], who: 1), CGPoint(x: -40, y: -140))
    }
    
    func testLocation12P2(){
        XCTAssertEqual(gameTest.fourthPosGenerator(num: numbers[11], who: 1), CGPoint(x: -130, y: -140))
    }
    
  
    func testP1Score(){
        XCTAssertEqual(gameTest.p1Score, 0)
    }
    
    func testP2Score(){
        XCTAssertEqual(gameTest.p2Score, 0)
    }
    
    func testInitP1Name(){
        XCTAssertEqual(gameTest.player1Name, "")
        
    }
    
    func testInitP2Name(){
        XCTAssertEqual(gameTest.player2Name, "")
        
    }
    
    func testInitP1Token(){
        XCTAssertEqual(gameTest.player1Token, "")
        
    }
    
    func testInitP2Token(){
        XCTAssertEqual(gameTest.player2Token, "")
    }
    
    func testP1House(){
        XCTAssertEqual(gameTest.p1House0.text, "🏡")
    }
    
    func testP2House(){
        XCTAssertEqual(gameTest.p2House0.text, "🏠")
    }
    

}
