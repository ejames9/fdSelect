/*
** -------------------------------------------------------------------------------
** main.swift
**
** FDSetBits ---
** A small module for creating and manipulating file descriptor sets......
** This is the main file used simply as an entry point for the module which
** auto-instantiates the class and globalizes the functions for conveniece, and
** familiarity with the original C functions..
**
** Copyright ©️ Eric James Foster, MIT license
** -------------------------------------------------------------------------------
*/


import Foundation


// Instantiate ...
let fdsb = FDSetBits()
//
// Get globals ...
let newSET = fdsb.newSet
//
let fdZERO = fdsb.fdZERO
//
let fdONES = fdsb.fdONES
//
let fdSET = fdsb.fdSET
//
let fdCLR = fdsb.fdCLR
//
let fdISSET = fdsb.fdISSET
