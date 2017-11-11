/*
** -------------------------------------------------------------------------------
** FDSBitsError.swift
**
** Error handling enum for the module......
**
**
** Copyright ©️ Eric James Foster, MIT license
** -------------------------------------------------------------------------------
*/


import Foundation


// Error handling
private enum FDSBitsError: Error {
  //
  case badArgument(reason: String)
  case fdSETError(reason: String)
  case fdCLRError(reason: String)
  case fdISSETError(reason: String)
}
