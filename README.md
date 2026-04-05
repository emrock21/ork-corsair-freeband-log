# Corsair Freeband Contract Log

This contract records encounters with Aeldari Corsairs, the wandering  
pirates and raiders who operate outside the structures of Craftworlds  
and Commorragh. It uses fields that reflect their chaotic lifestyle:

- `freebandName` — The Corsair band involved  
- `dealType` — The nature of the deal, betrayal, or ambush  
- `voidDreamerOmen` — The omen or vision from the Void Dreamer  

These elements define Corsair identity and cannot be applied to any  
other Aeldari faction.

---

## Contract

Deployed on Base:  
`0xAbC3B57A03bE4fCc6D76E73134F6A13490B3D29D`  
https://basescan.org/address/0xabc3b57a03be4fcc6d76e73134f6a13490b3d29d#code

Main file: `contracts/CorsairFreebandLog.sol`

---

## Example encounter

```solidity
recordEncounter(
  "Void Reavers",
  "A 'trade' dat turned into a double-cross halfway through.",
  "Da Void Dreamer muttered about 'shattered suns' before da fight.",
  "Da pirate pointy-ears switched sides twice durin' da scrap.",
  "Da deal ended wiv da boyz losin' loot an' da Corsairs laughin' as dey vanished."
);

Voting
voteEncounter(1, true);
voteEncounter(1, false);

Conclusion on the Essential Aspects of the Corsairs
The Corsairs embody freedom, unpredictability, and opportunism. Their
encounters reflect:

The shifting loyalties of their freebands

The deals and betrayals that define their survival

The strange omens of their Void Dreamers

Together, these traits define the essence of the Corsair life:
a path of risk, fortune, and chaos among the stars.
