contract Attacker {
  address public _creator;
    // the current fibonacci number to withdraw
  uint256 public calculatedFibNumber;

  function setFibonacci(uint256 n) payable public {
    calculatedFibNumber = address(this).balance / 1 ether;
  }
}