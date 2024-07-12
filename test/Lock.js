const NigerianContract = artifacts.require('NigerianContract');

contract('NigerianContract', () => {
  let contract;
  let owner;
  let nftTokenId;

  beforeEach(async () => {
    contract = await NigerianContract.new();
    owner = accounts[0];
    nftTokenId = await contract.mintAndBecomeEligible(owner);
  });

  it('should mint an NFT and mark the owner as eligible', async () => {
    assert.equal(await contract.eligibleCitizens(owner), true);
  });

  it('should allow eligible citizens to withdraw funds', async () => {
    await contract.withdrawFunds(owner);
    assert.equal(await contract.balanceOf(owner), 1000);
  });

  it('should not allow non-eligible citizens to withdraw funds', async () => {
    const nonEligibleOwner = accounts[1];
    await expectRevert(contract.withdrawFunds(nonEligibleOwner), 'You are not eligible for funds');
  });

  it('should not allow eligible citizens to withdraw funds twice', async () => {
    await contract.withdrawFunds(owner);
    await expectRevert(contract.withdrawFunds(owner), 'You have already withdrawn funds');
  });
});
