const Adoption=artifacts.require("Adoption");
contract("Adoption",(accounts)=>{
    let adoption;

    before(async() =>{
        adoption=await Adoption.deployed();
    });
    describe("adopting a pet and retrieving account addresses",async() =>{
        before("adopt a pet using accounts[0]",async()=>{
            await adoption.adopt(5,{from: accounts[0]});
            expectedAdopter=accounts[0];
        });

        it("can fetch the address of an owner by its pet id",async() =>{
            const adopter=await adoption.adopters(5);
            assert.equal(adopter,expectedAdopter,"the owner of the adopted pet should be the first account");
        });

        it("can fetch the collection of all pet owners' addresses",async()=>{
            const adopters=await adoption.getAdopters();
            assert.equal(adopters[5],expectedAdopter,"The owner of the pet should be in the collection array");
        });
    });
});