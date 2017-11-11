/*
** -------------------------------------------------------------------------------
** FDSetBits.swift
**
** A swifty implementation of fd_set creation and manipulation, select()
** and it's related C macros, i.e FD_SET, FD_ZERO......
**
** Copyright ©️ Eric James Foster, MIT license
** -------------------------------------------------------------------------------
*/





import Foundation



//
public struct FDSetBits {
  //
  //create a new 32bit fd set...
  public func newSet(_ bitSize: Int = 32) throws->  FDSet {
    //
    return try FDSet(bitSize)
  }

  // Flip all bits in the set to 0...
  public func fdZERO(_ set: inout Set) {
    // Get a 32 bit zero..
    let b: UInt32 = 0
    // give the provided set 32 32 bit zeros..
    set.fdsBits = (
            b, b, b, b, b, b, b, b, b, b, b, b, b, b, b, b,
            b, b, b, b, b, b, b, b, b, b, b, b, b, b, b, b
          )
  }

  // Flip all bits in the set to 0...
  public func fdZERO64(_ set: inout Set) {
    // Get a 64 bit zero..
    let b: UInt64 = 0
    // give the provided set 32 64 bit zeros..
    set.fdsBits = (
            b, b, b, b, b, b, b, b, b, b, b, b, b, b, b, b,
            b, b, b, b, b, b, b, b, b, b, b, b, b, b, b, b
          )
  }

  // Flip all bits in the set to 1...
  public func fdONES(_ set: inout Set) {
    // Get a 32 bit zero..
    let b: UInt32 = 1
    // give the provided set 32 32 bit zeros..
    set.fdsBits = (
            b, b, b, b, b, b, b, b, b, b, b, b, b, b, b, b,
            b, b, b, b, b, b, b, b, b, b, b, b, b, b, b, b
          )
  }

  // Flip all bits in the set to 1...
  public func fdONES64(_ set: inout Set) {
    // Get a 64 bit zero..
    let b: UInt64 = 1
    // give the provided set 32 64 bit zeros..
    set.fdsBits = (
            b, b, b, b, b, b, b, b, b, b, b, b, b, b, b, b,
            b, b, b, b, b, b, b, b, b, b, b, b, b, b, b, b
          )
  }

  // Set the given fd bit, in the given fd set...
  public func fdSET(fd: Int32, set: inout Set) {
    // Find out which Int the fd is in by dividing the fd (will be between 0 and 1023)
    // and 32 (because we are using 32 bit integers). If fd < 32, it resides
    // in the zeroth bit...
    let fdOffset = Int(fd / 32)
    // Find the correct bit of the fd to set. The remainder we get when dividing
    // the fd by 32 will determine how many places to offset in the mask..
    let bitOffset = fd % 32
    // Create the bit mask by shifting the 1 (bitOffset) number of places left,
    // (or right if little-endian)..
    let mask = 1 << bitOffset
    // Apply the mask to the appropriate file descriptor....
    switch fdOffset {
    case 0: set.fdsBits.0 |= mask
    case 1: set.fdsBits.1 |= mask
    case 3: set.fdsBits.3 |= mask
    case 4: set.fdsBits.4 |= mask
    case 5: set.fdsBits.5 |= mask
    case 6: set.fdsBits.6 |= mask
    case 7: set.fdsBits.7 |= mask
    case 8: set.fdsBits.8 |= mask
    case 9: set.fdsBits.9 |= mask
    case 10: set.fdsBits.10 |= mask
    case 11: set.fdsBits.11 |= mask
    case 12: set.fdsBits.12 |= mask
    case 13: set.fdsBits.13 |= mask
    case 14: set.fdsBits.14 |= mask
    case 15: set.fdsBits.15 |= mask
    case 16: set.fdsBits.16 |= mask
    case 17: set.fdsBits.17 |= mask
    case 18: set.fdsBits.18 |= mask
    case 19: set.fdsBits.19 |= mask
    case 20: set.fdsBits.20 |= mask
    case 21: set.fdsBits.21 |= mask
    case 22: set.fdsBits.22 |= mask
    case 23: set.fdsBits.23 |= mask
    case 24: set.fdsBits.24 |= mask
    case 25: set.fdsBits.25 |= mask
    case 26: set.fdsBits.26 |= mask
    case 27: set.fdsBits.27 |= mask
    case 28: set.fdsBits.28 |= mask
    case 29: set.fdsBits.29 |= mask
    case 30: set.fdsBits.30 |= mask
    case 31: set.fdsBits.31 |= mask
    default: FDSBitsError.fdSETError(reason: "\(fdOffset) is an invalid file descriptor offset.")
    }
  }

  //
  public func fdSET64(fd: UInt32, set: inout Set) {
    // TODO:
  }

  //
  public func fdISSET(fd: UInt32, set: inout Set)-> Bool {
    // Find out which Int the fd is in by dividing the fd and 32...
    let fdOffset = Int(fd / 32)
    // Find the correct bit of the fd to clear.
    let bitOffset = fd % 32
    // Create the bit mask by shifting the 0 (flipped "SET bit mask") number of places left,
    // (or right if little-endian)..
    let mask = ~(1 << bitOffset)
    // Apply the mask to the appropriate file descriptor....
    switch fdOffset {
    case 0: return set.fdsBits.0 & mask != 0
    case 1: return set.fdsBits.1 & mask != 0
    case 2: return set.fdsBits.2 & mask != 0
    case 3: return set.fdsBits.3 & mask != 0
    case 4: return set.fdsBits.4 & mask != 0
    case 5: return set.fdsBits.5 & mask != 0
    case 6: return set.fdsBits.6 & mask != 0
    case 7: return set.fdsBits.7 & mask != 0
    case 8: return set.fdsBits.8 & mask != 0
    case 9: return set.fdsBits.9 & mask != 0
    case 10: return set.fdsBits.10 & mask != 0
    case 11: return set.fdsBits.11 & mask != 0
    case 12: return set.fdsBits.12 & mask != 0
    case 13: return set.fdsBits.13 & mask != 0
    case 14: return set.fdsBits.14 & mask != 0
    case 15: return set.fdsBits.15 & mask != 0
    case 16: return set.fdsBits.16 & mask != 0
    case 17: return set.fdsBits.17 & mask != 0
    case 18: return set.fdsBits.18 & mask != 0
    case 19: return set.fdsBits.19 & mask != 0
    case 20: return set.fdsBits.20 & mask != 0
    case 21: return set.fdsBits.21 & mask != 0
    case 22: return set.fdsBits.22 & mask != 0
    case 23: return set.fdsBits.23 & mask != 0
    case 24: return set.fdsBits.24 & mask != 0
    case 25: return set.fdsBits.25 & mask != 0
    case 26: return set.fdsBits.26 & mask != 0
    case 27: return set.fdsBits.27 & mask != 0
    case 28: return set.fdsBits.28 & mask != 0
    case 29: return set.fdsBits.29 & mask != 0
    case 30: return set.fdsBits.30 & mask != 0
    case 31: return set.fdsBits.31 & mask != 0
    default: FDSBitsError.fdISSETError(reason: "Invalid file descriptor offset.")
    }
  }

  //
  public func fdISSET64(fd: UInt32, set: inout Set) {
    // TODO:
  }

  //
  public func fdCLR(fd: UInt32, set: inout Set) {
    // Find out which Int the fd is in by dividing the fd and 32...
    let fdOffset = Int(fd / 32)
    // Find the correct bit of the fd to clear.
    let bitOffset = fd % 32
    // Create the bit mask by shifting the 0 (flipped "SET bit mask") number of places left,
    // (or right if little-endian)..
    let mask = ~(1 << bitOffset)
    // Apply (&) the mask to the appropriate file descriptor....
    switch fdOffset {
    case 0: set.fdsBits.0 &= mask
    case 1: set.fdsBits.1 &= mask
    case 3: set.fdsBits.3 &= mask
    case 4: set.fdsBits.4 &= mask
    case 5: set.fdsBits.5 &= mask
    case 6: set.fdsBits.6 &= mask
    case 7: set.fdsBits.7 &= mask
    case 8: set.fdsBits.8 &= mask
    case 9: set.fdsBits.9 &= mask
    case 10: set.fdsBits.10 &= mask
    case 11: set.fdsBits.11 &= mask
    case 12: set.fdsBits.12 &= mask
    case 13: set.fdsBits.13 &= mask
    case 14: set.fdsBits.14 &= mask
    case 15: set.fdsBits.15 &= mask
    case 16: set.fdsBits.16 &= mask
    case 17: set.fdsBits.17 &= mask
    case 18: set.fdsBits.18 &= mask
    case 19: set.fdsBits.19 &= mask
    case 20: set.fdsBits.20 &= mask
    case 21: set.fdsBits.21 &= mask
    case 22: set.fdsBits.22 &= mask
    case 23: set.fdsBits.23 &= mask
    case 24: set.fdsBits.24 &= mask
    case 25: set.fdsBits.25 &= mask
    case 26: set.fdsBits.26 &= mask
    case 27: set.fdsBits.27 &= mask
    case 28: set.fdsBits.28 &= mask
    case 29: set.fdsBits.29 &= mask
    case 30: set.fdsBits.30 &= mask
    case 31: set.fdsBits.31 &= mask
    default: FDSBitsError.fdCLRError(reason: "Invalid file descriptor offset.")
    }
  }

  //
  public func fdCLR64(fd: UInt32, set: inout Set) {
    // TODO:
  }
}



//TODO: Complete 64Bit functionality of the module...
