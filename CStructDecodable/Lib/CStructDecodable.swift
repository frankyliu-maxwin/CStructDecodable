//
//  CStructDecodable.swift
//  CStructDecodable
//
//  Created by Yume on 2017/12/27.
//  Copyright © 2017年 Yume. All rights reserved.
//

import Foundation
import CoreFoundation.CFByteOrder

public protocol CStructDecodable {
    static func decode(data: Data, targetEndian: __CFByteOrder, offset: Int) throws -> Self
    func toHost(targetEndian: __CFByteOrder) -> Self
}

extension CStructDecodable {
    public func toHost(targetEndian: __CFByteOrder) -> Self {
        return self
    }
}
