//
//  main.swift
//  Tokamak
//
//  Created by Matvii Hodovaniuk on 3/29/19.
//

import Foundation
import TokamakLint

public final class CommandLineTool {
  public let lint: TokamakLint
  public let path: String

  public init(arguments: [String] = CommandLine.arguments) {
    let lint = TokamakLint()

    if let path = arguments.first {
      self.path = path
    } else {
      let fileManager = FileManager.default
      path = fileManager.currentDirectoryPath
    }
    self.lint = lint
  }
}

let tool = CommandLineTool()
try tool.lint.lintFolder(tool.path)