pragma solidity ^0.4.4;

// Proof of Existence contract, version 1
contract ProofOfExistence1 {
  //state
  bytes32 public proof;

  //caluclate and store the proof for a document
  // transactional function
  function notarize(string document) {
    proof = proofFor(document);
  }

  // helper function to get docs sha256
  // #read-only
  function proofFor(string document) constant returns (bytes32) {
    return sha256(document);
  }
}
