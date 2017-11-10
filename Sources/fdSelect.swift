/*
** -------------------------------------------------------------------------------
** fdSelect.swift
**
** A swifty implementation of fd_set creation and manipulation, select()
** and it's related C macros, i.e FD_SET, FD_ZERO......
**
** Copyright ©️ Eric James Foster, MIT license
** -------------------------------------------------------------------------------
*/

import Foundation

// Error handling
private enum FDSelectError: Error {
  //
  case badArgument
}

//
public struct FDSelect {
  //
  //create a new 32bit fd set...
  public func newSet(_ bitSize: Int = 32) throws->  FDSet {
    //
    return try FDSet(bitSize)
  }

  // Flip all bits in the set to 0...
  public func fdZero() {}
}
//
//
public class FDSet {
  //
  var fdBits: (
  Any, Any, Any, Any, Any, Any, Any, Any,
  Any, Any, Any, Any, Any, Any, Any, Any,
  Any, Any, Any, Any, Any, Any, Any, Any,
  Any, Any, Any, Any, Any, Any, Any, Any
)
  // Initialize the set...
  public init(_ bitSize: Int = 32) throws {
    //
    let b: UInt32 = 0
    let c: UInt64 = 0
    //
    if bitSize == Int(64) || bitSize == Int(32) {
        if bitSize == 32 {
          self.fdBits = (
            b, b, b, b, b, b, b, b, b, b, b, b, b, b, b, b,
            b, b, b, b, b, b, b, b, b, b, b, b, b, b, b, b
          )
        } else {
          self.fdBits = (
            c, c, c, c, c, c, c, c, c, c, c, c, c, c, c, c,
            c, c, c, c, c, c, c, c, c, c, c, c, c, c, c, c
          )
        }
    } else {
      throw FDSelectError.badArgument
    }
  }
}

let fd = FDSelect()
//
var fdset = try fd.newSet()

print(fdset.fdBits)
