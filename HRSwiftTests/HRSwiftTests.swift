//
//  HRSwiftTests.swift
//  HRSwiftTests
//
//  Created by yansong li on 2015-11-20.
//  Copyright © 2015 yansong li. All rights reserved.
//

import XCTest
@testable import HRSwift

class HRSwiftTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testContainsAllEnglishCharacters() {
        let test1 = "abc"
        let test2 = "AbcdefghijklmnopqRstUVWxyZ"
        let test3 = "Abcdefghijkl  mnopqRstUVWxyZ"
        let test4 = "The quick brown fox jumps over the lazy dog"
        XCTAssert(!test1.containsAllEnglishCharacters(), "Pass")
        XCTAssert(test2.containsAllEnglishCharacters(), "Pass")
        XCTAssert(test3.containsAllEnglishCharacters(), "Pass")
        XCTAssert(test4.containsAllEnglishCharacters(), "Pass")
    }
    
    func testContainsAllEnglishCharactersWithArray() {
        let test1 = "abc"
        let test2 = "AbcdefghijklmnopqRstUVWxyZ"
        let test3 = "Abcdefghijkl  mnopqRstUVWxyZ"
        let test4 = "The quick brown fox jumps over the lazy dog"
        let mySolution = Pangrams()
        XCTAssert(!mySolution.checkPangramsWithArray(test1), "Pass")
        XCTAssert(mySolution.checkPangramsWithArray(test2), "Pass")
        XCTAssert(mySolution.checkPangramsWithArray(test3), "Pass")
        XCTAssert(mySolution.checkPangramsWithArray(test4), "Pass")
    }
    
    func testStringPalindrome() {
        let test1 = "aaa"
        let test2 = "abcd"
        let test3 = "afggfa"
        XCTAssert(test1.isPalindrome(), "Pass")
        XCTAssert(!test2.isPalindrome(), "Pass")
        XCTAssert(test3.isPalindrome(), "Pass")
    }
    
    func testQueueImplementation() {
        var queue = Queue<String>()
        queue.enqueue("Yansong")
        queue.enqueue("Li")
        queue.enqueue("Great")
        XCTAssert(queue.dequeue() == .Some("Yansong"), "Pass")
        XCTAssert(queue.dequeue() == "Li", "Pass")
        XCTAssert(queue.dequeue() == "Great", "Pass")
    }
    
    func testHexagonalGrid() {
        let test = HexagonalGrid()
        var testGrid1 = [[0,0], [0,0]]
        var testGrid2 = [[0,0], [1,0]]
        var testGrid3 = [[0,0], [0,1]]
        var testGrid4 = [[0,0], [1,1]]
        var testGrid5 = [[1,0], [0,0]]
        var testGrid6 = [[1,0], [1,0]]
        var testGrid7 = [[1,0], [0,1]]
        XCTAssert(test.rec(&testGrid1),"Pass")
        XCTAssert(!test.rec(&testGrid2),"Pass")
        XCTAssert(!test.rec(&testGrid3),"Pass")
        XCTAssert(test.rec(&testGrid4),"Pass")
        XCTAssert(!test.rec(&testGrid5),"Pass")
        XCTAssert(test.rec(&testGrid6),"Pass")
        XCTAssert(test.rec(&testGrid7),"Pass")
    }
    
    func testSamAndSubStrings() {
        let test = SamAndSubString()
        XCTAssert(test.solve("16") == 23, "Pass")
    }
    
    func testTravelAroundTheWorld() {
        let test = TravelAroundTheWorld()
        XCTAssert(test.solve(3, a: [3,1,2], b: [2,2,2]) == 2, "Pass")
    }
    
    func testRedJohnisBack() {
        let test = RedJohnisBack()
        XCTAssert(test.solve(7) == 3, "Pass")
        XCTAssert(test.solve(38) == 10794, "Pass")
    }
    
    func testDorsyThief() {
        let test = DorseyThief()
        let passenger1 = Passenger(offer: 460, weight: 4)
        let passenger2 = Passenger(offer: 590, weight: 6)
        let passenger3 = Passenger(offer: 590, weight: 5)
        let passenger4 = Passenger(offer: 550, weight: 5)
        XCTAssertTrue(test.solve([passenger1, passenger2, passenger3, passenger4], c: 10) == 1140)
    }
    
    func testAlternatingCharacters() {
        let test = AlternatingCharcters()
        XCTAssertTrue(test.solve("ABAA") == 1)
    }
    
    func testMakeItAnagram() {
        let test = MakeItAnagram()
        XCTAssertTrue(test.solve("cde", line2: "abc")==4)
    }
    
    func testAnagram() {
        let test = Anagram()
        XCTAssert(test.solve("aaabbb") == 3, "Pass")
        XCTAssert(test.solve("ab") == 1, "Pass")
        XCTAssert(test.solve("abc") == -1, "Pass")
    }
    
    func testSherlockAndAnagrams() {
        let test = SherlockAndAnagrams()
        XCTAssert(test.solve("abba") == 4, "Pass")
    }
    
    func testCommonChile() {
        let test = CommonChild()
        XCTAssert(test.solve("ABCD", second: "ABDC") == 3, "Pass")
    }
    
    func testFibonacci() {
        let fib: (Int)->Int = memoize { (fib, x) in
            if x < 2 {
                return x
            }
            return fib(x-1) + fib(x-2)
        }
        XCTAssert(fib(8) == 21, "Pass")
    }
    
    func testHeap() {
        var testHeap = MaxHeap(array: [1, 2, 3, 5, 7, 10])
        XCTAssert(testHeap.peak()! == 10, "Pass")
        testHeap.insert(61)
        XCTAssert(testHeap.peak()! == 61, "Pass")
        
        let emptyHeap = MaxHeap<Int>()
        XCTAssert(emptyHeap.peak() == nil, "Pass")
    }
    
    func testHeapInsertRemove() {
        /**   9
         *  7    5
         * 1 2  3
         * Should be represented in memory as [9, 5, 7, 1, 3, 2] though we are just testing the effects.
         */
        var heap = MaxHeap<Int>(array: [1, 3, 2, 7, 5, 9])
        
        //Should be removed in order
        XCTAssertEqual(9, heap.remove())
        XCTAssertEqual(7, heap.remove())
        XCTAssertEqual(5, heap.remove())
        XCTAssertEqual(3, heap.remove())
        XCTAssertEqual(2, heap.remove())
        XCTAssertEqual(1, heap.remove())
        XCTAssertNil(heap.remove())
    }
    
    func testHeapCount() {
        var heap = MaxHeap<Int>()
        XCTAssertEqual(0, heap.count)
        heap.insert(1)
        XCTAssertEqual(1, heap.count)
    }
    
    func testHeapRemoveEmpty() {
        var heap = MaxHeap<Int>()
        let removed = heap.remove()
        XCTAssertNil(removed)
    }
}
