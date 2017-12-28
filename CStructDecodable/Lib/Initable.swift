//
//  Initable.swift
//  CStructDecodable
//
//  Created by Yume on 2017/12/27.
//  Copyright © 2017年 Yume. All rights reserved.
//

import Foundation

public protocol Initable: CStructDecodable {
    init()
}

extension Initable {
    public static func decode(data: Data, targetEndian: __CFByteOrder, offset: Int = 0) throws -> Self {
        var result:Self = Self()
        let size = MemoryLayout<Self>.size
        let range: Range<Data.Index> = offset..<(offset + size)
        let pointer = UnsafeMutableBufferPointer<Self>(start: &result, count: size)
        
        if range.lowerBound < data.indices.lowerBound || range.upperBound > data.indices.upperBound {
            throw CStructDecodeError.parseFail(data: data, type: self, offset: offset)
        }
        
        if size != data.copyBytes(to: pointer, from: range) {
            throw CStructDecodeError.parseFail(data: data, type: self, offset: offset)
        }
        
        return result.toHost(targetEndian: targetEndian)
    }
}
