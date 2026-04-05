// SPDX-License-Identifier: MIT
pragma solidity 0.8.31;

/// @title Corsair Freeband Contract Log
/// @notice Records encounters with Aeldari Corsair freebands, deals, betrayals, and Void Dreamer omens.
/// @dev This contract is exclusive to Corsair culture due to its faction-specific fields.

contract CorsairFreebandLog {

    address constant EXAMPLE_ADDRESS = 0x0000000000000000000000000000000000000001;

    struct Encounter {
        string freebandName;     // Name of the Corsair band (Sunblades, Void Reavers, etc.)
        string dealType;         // Trade, betrayal, ambush, temporary alliance
        string voidDreamerOmen;  // Omen or vision from the Void Dreamer
        string behavior;         // How the Corsairs acted
        string outcome;          // Result of the encounter
        address creator;
        uint256 approved;
        uint256 rejected;
        uint256 createdAt;
    }

    Encounter[] public logs;

    mapping(uint256 => mapping(address => bool)) public hasVoted;

    event EncounterRecorded(uint256 indexed id, string freebandName, address indexed creator);
    event EncounterVoted(uint256 indexed id, bool approved, uint256 approvedVotes, uint256 rejectedVotes);

    constructor() {
        logs.push(
            Encounter({
                freebandName: "Example Freeband (Fill your own below)",
                dealType: "Describe the deal, betrayal, or ambush.",
                voidDreamerOmen: "Describe the omen or vision.",
                behavior: "Describe how da pirate pointy-ears acted.",
                outcome: "Describe how da scrap or deal ended.",
                creator: EXAMPLE_ADDRESS,
                approved: 0,
                rejected: 0,
                createdAt: block.timestamp
            })
        );
    }

    function recordEncounter(
        string calldata freebandName,
        string calldata dealType,
        string calldata voidDreamerOmen,
        string calldata behavior,
        string calldata outcome
    ) external {
        require(bytes(freebandName).length > 0, "Freeband required");

        logs.push(
            Encounter({
                freebandName: freebandName,
                dealType: dealType,
                voidDreamerOmen: voidDreamerOmen,
                behavior: behavior,
                outcome: outcome,
                creator: msg.sender,
                approved: 0,
                rejected: 0,
                createdAt: block.timestamp
            })
        );

        emit EncounterRecorded(logs.length - 1, freebandName, msg.sender);
    }

    function voteEncounter(uint256 id, bool approved) external {
        require(id < logs.length, "Invalid ID");
        require(!hasVoted[id][msg.sender], "Already voted");

        hasVoted[id][msg.sender] = true;

        Encounter storage e = logs[id];

        if (approved) {
            e.approved += 1;
        } else {
            e.rejected += 1;
        }

        emit EncounterVoted(id, approved, e.approved, e.rejected);
    }

    function totalEncounters() external view returns (uint256) {
        return logs.length;
    }
}
