pragma solidity ^0.4.4;

// Proof of Existence contract, version 1
contract ProofOfExistence2 {
  //state
  bytes32[] private proofs;

  // store a proof of existence in contract state
  function storeProof(bytes32 proof) {
    proofs.push(proof);
  }

  //caluclate and store the proof for a document
  // transactional function
  function notarize(string document) {
    bytes32 proof = proofFor(document);
    storeProof(proof);
  }

  // helper function to get docs sha256
  // #read-only
  function proofFor(string document) constant returns (bytes32) {
    return sha256(document);
  }

  //check if doc has been notarized
  // *ready only
  function checkDocument(string document) constant returns (bool) {
    bytes32 proof = proofFor(document);
    return hasProof(proof);
  }

  // returns true if proof stored
  // *read only
  function hasProof(bytes32 proof) constant returns (bool) {
    for (uint256 i = 0; i < proofs.length; i++) {
      if (proofs[i] == proof) {
        return true;
      }
    }
    return false;
  }
}
