pragma solidity ^0.5.0;

contract CoinFlip {
    uint randNonce = 0;
    uint winningChance = 40; // in %

    function bet() external payable returns (uint) {
        uint contractBalance = address(this).balance;
        require(msg.value >= 10 ether && contractBalance >= 2 ether);
        uint winningMoney = msg.value * 2;
        if (winningMoney > contractBalance) {
            msg.sender.transfer(msg.value - contractBalance / 2);
            winningMoney = contractBalance;
        }
        if (flip(winningChance)) {
            msg.sender.transfer(winningMoney);
            return winningMoney;
        }
        return 0;
    }

    function flip(uint _winningChance) private returns (bool) {
        uint random100 = randMod(100);
        if (random100 >= 100 - _winningChance) {
            return true; // Sender won
        }
        return false; // Sender lost
    }

    function randMod(uint _modulus) internal returns (uint) {
        randNonce++;
        return uint(keccak256(abi.encodePacked(now, msg.sender, randNonce))) % _modulus;
    }

    // Retrieving the adopters
    function getContractBalance() external view returns (uint) {
        return address(this).balance;
    }
}