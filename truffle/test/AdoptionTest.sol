pragma solidity ^0.8.6;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Adoption.sol";


contract TestAdoption{
    //the address of the adoption contract to be tested

    Adoption adoption=Adoption(DeployedAddresses.Adoption());

    //id of the pet that we will use for testing
    uint expectedPetId=5;

    //expected owner of adopted pet is this contract
    address expectedAdopter=address(this);

    //testing the adopt function
    function testUserCanAdoptAPet() public {
        uint returnedId= adoption.adopt(expectedPetId);
        Assert.equal(returnedId,expectedPetId,"Adoption of expected pet should match what is returned");
    }

    //testing retieval of single pet owner
    function testGetAdoptedAddressByPetId() public {
        address adopter=adoption.adopters(expectedPetId);

        Assert.equal(adopter,expectedAdopter,"owner of the expected pet should match this contract");

    }
    //testing retrieval of all the pet owners
    function testGetAdopterAddressByPetIdInArray() public {

        //store adopters in memory instead of storage
        address[10] memory adopters =adoption.getAdopters();

        Assert.equal(adopters[expectedPetId],expectedAdopter,"owner of the expected pet shpuld be this contract");
    }
}