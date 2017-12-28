//
//  UInt+Initable.swift
//  CStructDecodable
//
//  Created by Yume on 2017/12/27.
//  Copyright © 2017年 Yume. All rights reserved.
//

import Foundation

extension UInt8: Initable {
    public init() {
        self = 0
    }
}

extension UInt16: Initable {
    public init() {
        self = 0
    }
    
    public func toHost(targetEndian: __CFByteOrder) -> UInt16 {
        if targetEndian == CFByteOrderBigEndian {
            return CFSwapInt16BigToHost(self)
        } else {
            return CFSwapInt16LittleToHost(self)
        }
    }
}

extension UInt32: Initable {
    public init() {
        self = 0
    }
    
    public func toHost(targetEndian: __CFByteOrder) -> UInt32 {
        if targetEndian == CFByteOrderBigEndian {
            return CFSwapInt32BigToHost(self)
        } else {
            return CFSwapInt32LittleToHost(self)
        }
    }
}

extension UInt64: Initable {
    public init() {
        self = 0
    }
    
    public func toHost(targetEndian: __CFByteOrder) -> UInt64 {
        if targetEndian == CFByteOrderBigEndian {
            return CFSwapInt64BigToHost(self)
        } else {
            return CFSwapInt64LittleToHost(self)
        }
    }
}
