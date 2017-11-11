/*
** -------------------------------------------------------------------------------
** FDSet.swift
**
** A small module for creating file descriptor sets......
**
**
** Copyright ©️ Eric James Foster, MIT license
** -------------------------------------------------------------------------------
*/


import Foundation



//
public class FDSet {
  // Set a typealias for the tuple list types so that they may be referred to with
  // appropriate brevity..
  public typealias Set = (
    UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32,
    UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32,
    UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32,
    UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32, UInt32
  )
  // For 64 bit sets...
  public typealias Set64 = (
    UInt64, UInt64, UInt64, UInt64, UInt64, UInt64, UInt64, UInt64,
    UInt64, UInt64, UInt64, UInt64, UInt64, UInt64, UInt64, UInt64,
    UInt64, UInt64, UInt64, UInt64, UInt64, UInt64, UInt64, UInt64,
    UInt64, UInt64, UInt64, UInt64, UInt64, UInt64, UInt64, UInt64
  )

  // This member will hold the 32bit version of the fd set..
  var fdsBits: Set?

  // This member will hold the 64 bit version, if 64 is specified as bitSize
  var fdsBits64: Set64?

  // Initialize the set...
  public init(_ bitSize: Int = 32) throws {
    //
    // Set the zeroed bit variable with the appropriate type...
    let b: UInt32 = 0
    let c: UInt64 = 0

    // Set either fdBits or fdBits64, depending on user preference..
    if bitSize == Int(64) || bitSize == Int(32) {
        if bitSize == 32 {
          self.fdsBits = (
            b, b, b, b, b, b, b, b, b, b, b, b, b, b, b, b,
            b, b, b, b, b, b, b, b, b, b, b, b, b, b, b, b
          )
        } else {
          self.fdsBits64 = (
            c, c, c, c, c, c, c, c, c, c, c, c, c, c, c, c,
            c, c, c, c, c, c, c, c, c, c, c, c, c, c, c, c
          )
        }
    } else {
      throw FDSelectError.badArgument(reason: "Argument value may only be 32 or 64.")
    }
  }
}

// let fd = FDSetBits()
// //
// var fds = try fd.newSet()
//
// print(fds.fdsBits! as Any)
// print(String(fds.fdsBits!.2 + 32, radix: 2))
