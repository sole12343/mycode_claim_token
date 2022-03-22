// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "./ERC20.sol";
import "./IERC20.sol";
import "./IERC20Metadata.sol";
import "./Context.sol";

contract token is ERC20{
    uint32 public release_time = uint32(block.timestamp);
    uint112 public constant max_token_number = uint112(37800000000000 ether);

    mapping(address => bool) public is_claim;
    address[] public yet_claim_people;
    uint112 public all_claim = max_token_number/2;

    constructor() ERC20("newbi", "NB"){
        _mint(0xe594955783f72afD89588Eddf271A4F1BCb23b9d,uint112(max_token_number/100*50));

    }


    function claim() external{
        if( (uint32(block.timestamp)-release_time) <= 360 days && is_claim[msg.sender] == false ){
            is_claim[msg.sender] = true;
            yet_claim_people.push(msg.sender);
            _mint(msg.sender,return_claim_number());
        }   
        }

    function return_claim_number() public view returns(uint104){
        uint104 claim_number;

        if(yet_claim_people.length <= 1010){
            claim_number = uint104(all_claim/100*20/1010*1);
        }

        else if(yet_claim_people.length > 1010 && yet_claim_people.length <= 101010){
            claim_number = uint104((all_claim/100*80)/100000*1);
        }

        return claim_number;
    }

    function return_is_claim(address _address) public view returns(bool){
        return is_claim[_address];
    }
}
