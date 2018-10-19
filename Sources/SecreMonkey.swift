//
//  SecretHelper.swift
//  MMLiveRoomPro
//
//  Created by 杨志伟 on 2018/9/12.
//  Copyright © 2018 杨志伟. All rights reserved.
//

import Foundation

func deCodeSecr(array:[Int8])->String {
    
    let dst: UnsafeMutablePointer<Int8> = UnsafeMutablePointer<Int8>.allocate(capacity: array.count + 1)
    dst[array.count] = 0
    
    for i in 0...array.count-1
    {
        var value = Int32(array[ i ])
        value ^= 0xff
        value &= 0xff
        if value > 127 {
            value -= 256
        }
        dst[ i ] = Int8(value)
    }
    // 再做一次进行校验，是否为原字符串
    for i in 0...array.count-1
    {
        var value = Int32(dst[ i ])
        value ^= 0xff
        value &= 0xff
        if value > 127 {
            value -= 256
        }
        dst[ i ] = Int8(value)
    }
    let orgStr = String(cString: dst)
    free(dst)
    return orgStr
}
