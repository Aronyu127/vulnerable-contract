contract FibonacciBalance {
    address public fibonacciLibrary;
    // the current fibonacci number to withdraw
    uint256 public calculatedFibNumber;
    // the starting fibonacci sequence number
    uint256 public start = 1;    
    uint256 public withdrawalCounter;
    // the fibonancci function selector
    bytes4 constant fibSig = bytes4(keccak256("setFibonacci(uint256)"));
    
    // constructor - loads the contract with ether
    constructor(address _fibonacciLibrary) public payable {
        fibonacciLibrary = _fibonacciLibrary;
    }

    function withdraw() payable public {
        require(msg.value == 5 ether, "You must send 5 ether withdraw fee"); 

        withdrawalCounter += 1;
        // calculate the fibonacci number for the current withdrawal user
        // this sets calculatedFibNumber
        bytes memory callData = abi.encodeWithSelector(fibSig, withdrawalCounter);
        (bool result, bytes memory _returnedData) = fibonacciLibrary.delegatecall(callData);
        require(result);
        payable(msg.sender).transfer(calculatedFibNumber * 1 ether);
    }
    
    fallback() external {
      (bool result, bytes memory _returnedData) = fibonacciLibrary.delegatecall(msg.data);
      require(result);
    }
}