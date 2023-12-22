import "forge-std/Test.sol";
contract FibonacciLib {
    // initializing the standard fibonacci sequence;
    address public creator;
    uint256 public calculatedFibNumber;
    uint256 public start;

    // modify the zeroth number in the sequence
    function setCreator(address _creator) public {
        creator = _creator;
    }

    function setFibonacci(uint256 n) payable public {
        calculatedFibNumber = fibonacci(n);
    }

    function fibonacci(uint256 n) internal returns (uint) {
        if (n == 0) return start;
        else if (n == 1) return start + 1;
        else return fibonacci(n - 1) + fibonacci(n - 2);
    }
}