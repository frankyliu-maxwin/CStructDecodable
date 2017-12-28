//
//  CStructDecodeableTests.swift
//  CStructDecodeableTests
//
//  Created by Yume on 2017/12/28.
//  Copyright © 2017年 Yume. All rights reserved.
//

import XCTest
@testable import CStructDecodable

class ParseTests: XCTestCase {
    
    func testParseFail() {
        let datas:[UInt8] = [1,2,3]
        let originData = Data(bytes: datas)
        
        do {
            let _ = try UInt32.decode(data: originData, targetEndian: CFByteOrderLittleEndian, offset: 1)
            fatalError()
        } catch CStructDecodeError<UInt32>.parseFail(let data, let type, let offset) {
            XCTAssertEqual(data, originData)
            XCTAssertTrue(type == UInt32.self)
            XCTAssertEqual(offset, 1)
        } catch {
            fatalError()
        }
    }
    
    func testParseUInt8() {
        typealias TestTarget = UInt8
        let data = Data(bytes: [0xFF] as [UInt8])
        
        do {
            let little = try TestTarget.decode(data: data, targetEndian: CFByteOrderLittleEndian, offset: 0)
            XCTAssertEqual(little, 0xFF)
            
            let big = try TestTarget.decode(data: data, targetEndian: CFByteOrderBigEndian, offset: 0)
            XCTAssertEqual(big, 0xFF)
        } catch {
            fatalError()
        }
    }
    
    func testParseUInt16() {
        typealias TestTarget = UInt16
        let data = Data(bytes: [0xFF, 0xFE] as [UInt8])
        
        do {
            let little = try TestTarget.decode(data: data, targetEndian: CFByteOrderLittleEndian, offset: 0)
            XCTAssertEqual(little, 0xFEFF)
            
            let big = try TestTarget.decode(data: data, targetEndian: CFByteOrderBigEndian, offset: 0)
            XCTAssertEqual(big, 0xFFFE)
        } catch {
            fatalError()
        }
    }
    
    func testParseUInt32() {
        typealias TestTarget = UInt32
        let data = Data(bytes: [0xFF, 0xFE, 0xFD, 0xFC] as [UInt8])
        
        do {
            let little = try TestTarget.decode(data: data, targetEndian: CFByteOrderLittleEndian, offset: 0)
            XCTAssertEqual(little, 0xFCFDFEFF)
            
            let big = try TestTarget.decode(data: data, targetEndian: CFByteOrderBigEndian, offset: 0)
            XCTAssertEqual(big, 0xFFFEFDFC)
        } catch {
            fatalError()
        }
    }
    
    func testParseUInt64() {
        typealias TestTarget = UInt64
        let data = Data(bytes: [0xFF, 0xFE, 0xFD, 0xFC, 0xFB, 0xFA, 0xF9, 0xF8] as [UInt8])
        
        do {
            let little = try TestTarget.decode(data: data, targetEndian: CFByteOrderLittleEndian, offset: 0)
            XCTAssertEqual(little, 0xF8F9FAFBFCFDFEFF)
            
            let big = try TestTarget.decode(data: data, targetEndian: CFByteOrderBigEndian, offset: 0)
            XCTAssertEqual(big, 0xFFFEFDFCFBFAF9F8)
        } catch {
            fatalError()
        }
    }
}
