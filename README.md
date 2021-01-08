# Ethereum-Coin-Flip
Homemade Ethereum Coin Flip dapp for Uni project

## Main idea

Create a working dapp

## Main features

+ Contract is wrritten with *solidity*
+ [web3](https://web3js.readthedocs.io/en/v1.3.0/)

## Main functionality

+ Bet() functionality to bet some money against computer
+ Donate() to send some money to the contract


From the contract side, the most important function is **bet**
First it checks the amount the user sent and then handles the bet.
```c++
function bet() external payable {
        uint contractBalance = address(this).balance;
        uint prevContractBalance = contractBalance - msg.value;
        require(msg.value > 0 ether);
        uint winningMoney = msg.value * 2;
        if (winningMoney > contractBalance) {
            msg.sender.transfer(msg.value - prevContractBalance);
            winningMoney = address(this).balance;
        }
        if (flip(winningChance)) {
            msg.sender.transfer(winningMoney);
            lastUserWinning[msg.sender] = winningMoney;
            totalUserProfit[msg.sender] += int(winningMoney / 2);
        } else {
            lastUserWinning[msg.sender] = 0;
            totalUserProfit[msg.sender] -= int(winningMoney);
        }
    }
```

Function that handles random number generation:
```c++
 function randMod(uint _modulus) internal returns (uint) {
        randNonce++;
        return uint(keccak256(abi.encodePacked(block.timestamp, msg.sender, randNonce))) % _modulus + 1;
    }
```

How to call out the function with *web3*
```js
betInstance.bet({
            from: account,
            value: web3.toWei(betAmount, "ether"),
          });
```

## Want to run this program by yourself?  
1. Clone the project
2. Inside the project directory run:
<br>*npm install*
<br>*npm run dev*
<br>*truffle migrate*
<br> !!! Important, make sure that you're connected to some test network and e-wallet
3. Enjoy

# My final words
+ It was a fun project to do
+ [Metamask](https://metamask.io/) is quite buggy

 ## <i>Releases</i>
 
[**[v0.1]**](https://github.com/Definitelynotaspruce/Ethereum-Coin-Flip/releases/tag/0.1) 
