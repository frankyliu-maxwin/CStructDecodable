//
//  CStructDecodeError.swift
//  CStructDecodable
//
//  Created by Yume on 2017/12/27.
//  Copyright © 2017年 Yume. All rights reserved.
//

import Foundation

public enum CStructDecodeError<T>: Error {
    case parseFail(data: Data,type: T.Type, offset: Int)
}

//extension CStructDecodeError:CustomStringConvertible {
//    public var description: String {
//        switch self {
//        case .parseFail(let data, let type, let offset):
//            return ""
////            return errorMessage(messageType: "Key Not Found::", baseInfo: baseInfo, extraInfo: nil)
//        }
//    }
//}
