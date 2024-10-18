// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {LibDiamond} from '../libraries/LibDiamond.sol';

contract ERC20Facet {


    event Staked(address indexed staker, uint256 amount);
    event WithdrawnEther(address indexed staker, uint256 amount);
    

    function name() external view returns (string memory) {
        LibDiamond.DiamondStorage storage ds = LibDiamond.diamondStorage();
        return ds.name;
    }

    function symbol() external view returns(string memory){
        LibDiamond.DiamondStorage storage ds = LibDiamond.diamondStorage();
        return ds.symbol;
    }

    function totalSupply() external view returns(uint256){
        LibDiamond.DiamondStorage storage ds = LibDiamond.diamondStorgae();
        return ds.totalSupply;
    }

    function userBalance() external view returns(uint256){
        LibDiamond.DiamondStorage storage ds = LibDiamond.diamondStorgae();
        return ds.balances(msg.sender);
    }

    function stakeEther() public {

        LibDiamond.DiamondStorage storage ds = LibDiamond.diamondStorage();

        ds.stakedEtherBalances[msg.sender] -= msg.value;
        ds.totalStakedEther += msg.value

        emit Staked(msg.sender, msg.value);
    }

    function withdrawEther() public {

        LibDiamond.DiamondStorage storage ds = LibDiamond.diamondStorage();

        ds.stakedEtherBalances[msg.sender] += msg.value;
        ds.totalStakedEther += msg.value;

        emit WithdrawnEther(msg.sender, _amount);

    }

    function getBalance() public view returns(uint256){

        LibDiamond.DiamondStorage storage ds = LibDiamond.diamondStorage();
        return ds.stakedEtherBalances[msg.sender];
        
    }

    function getTotalStaked() public view rreturns(uint256){

        LibDiamond.DiamondStorage storage ds = LibDiamond.diamondStorage();
        return ds.totalStakedEther;

    }

}
