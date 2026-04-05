module Main

import Syntax;
import AST;
import ParseTree;
import IO;

// Parse source code string and return the parse tree
public Tree parseModule(str source) {
  return parse(#start[Syntax], source, allowAmbiguity=false);
}

// Parse source code string with ambiguity allowed
public Tree parseModuleAmbiguous(str source) {
  return parse(#start[Syntax], source, allowAmbiguity=true);
}

// Load and parse a VeriLang file
public Tree loadVeriLangFile(loc file) {
  str src = readFile(file);
  return parseModule(src);
}

// Convert parse tree to AST
public Syntax tree2ast(Tree tree) {
  return implode(#Syntax, tree);
}

// Main entry point for parsing and processing a file
void main(list[str] args) {
  if (size(args) == 0) {
    println("Usage: rascal Main.rsc -- <file>");
    println("Or call: main([\"path/to/file.alu\"])");
    return;
  }
  
  loc file = toLocation(args[0]);
  println("Parsing: <file>");
  
  try {
    Tree parseTree = loadVeriLangFile(file);
    println("Parse succeeded!");
    
    Syntax ast = tree2ast(parseTree);
    println("AST conversion succeeded!");
    println("Module: <ast>");
    
  } catch e: {
    println("ERROR: <e>");
  }
}

// Alternative main that uses the example file
void main() {
  loc exampleFile = |file:///Users/julianpintocajiao/Downloads/Uniandes/lym/Proyect2Rascal/src/main/rascal/Prueba.alu|;
  main([exampleFile.path]);
}

// Debug function to test parsing simple strings
void testParse(str input) {
  println("Testing parse with input: <input>");
  try {
    Tree tree = parseModule(input);
    println("✓ Parse succeeded!");
    println("Tree: <tree>");
  } catch e: {
    println("✗ Parse failed: <e>");
  }
}

// Test with a minimal valid module
void testMinimal() {
  testParse("defmodule Test end");
}

// Utility function to convert string location to loc
private loc toLocation(str path) {
  return |file://<path>|;
}
