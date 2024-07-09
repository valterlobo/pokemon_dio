// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity 0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Base64.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract PokemonDIO is ERC721, ERC721Burnable, Ownable {
    struct Pokemon {
        string name;
        uint256 level;
        string img;
        string link;
    }

    Pokemon[] private pokemons;

    constructor(address initialOwner) ERC721("PokemonDIO", "PKD") Ownable(initialOwner) {}

    modifier onlyOwnerOf(uint256 _monsterId) {
        require(ownerOf(_monsterId) == msg.sender, "Apenas o dono pode batalhar com este Pokemon");
        _;
    }

    function battle(uint256 _attackingPokemon, uint256 _defendingPokemon) public onlyOwnerOf(_attackingPokemon) {
        Pokemon storage attacker = pokemons[_attackingPokemon];
        Pokemon storage defender = pokemons[_defendingPokemon];
        (attacker.level, defender.level) = playLevel(attacker.level, defender.level);
    }

    function createNewPokemon(string memory _name, address _to, string memory _img, string memory _link)
        public
        onlyOwner
    {
        uint256 id = pokemons.length;
        pokemons.push(Pokemon(_name, random(), _img, _link));
        _safeMint(_to, id);
    }

    function getPokemonInfo(uint256 _monsterId) public view returns (Pokemon memory) {
        require(_monsterId < pokemons.length, "Pokemon NAO EXISTE");

        return pokemons[_monsterId];
    }

    function playLevel(uint256 _attackingLevel, uint256 _defendingLevel) public pure returns (uint256, uint256) {
        if (_attackingLevel >= _defendingLevel) {
            _attackingLevel += 2;
            _defendingLevel += 1;
        } else {
            _attackingLevel += 1;
            _defendingLevel += 2;
        }

        return (_attackingLevel, _defendingLevel);
    }

    function random() internal view returns (uint256) {
        // sha3 and now have been deprecated
        return uint256(keccak256(abi.encodePacked(block.prevrandao, block.timestamp, pokemons.length))) % 10;
    }

    // Following functions are overrides required by Solidity.

    function tokenURI(uint256 tokenId) public view override(ERC721) returns (string memory) {
        bytes memory metadata = "{";

        bytes memory metadataParcial;

        Pokemon memory p = pokemons[tokenId];

        metadataParcial = abi.encodePacked('"', "name", '": "', p.name, '",');
        metadata = abi.encodePacked(metadata, metadataParcial);

        metadataParcial = abi.encodePacked(
            '"', "description", '": "', "Especies ficticias de monstros, cada um com designs e habilidades unicos", '",'
        );
        metadata = abi.encodePacked(metadata, metadataParcial);

        metadataParcial = abi.encodePacked('"', "image", '": "', p.img, '"');
        metadata = abi.encodePacked(metadata, metadataParcial);

        metadata = abi.encodePacked(metadata, ",");
        //attributes
        metadata = abi.encodePacked(metadata, '"attributes": [');

        //LEVEL
        metadata = abi.encodePacked(metadata, "{");
        metadataParcial = abi.encodePacked('"', "trait_type", '": "', "LEVEL", '",');
        metadata = abi.encodePacked(metadata, metadataParcial);
        metadataParcial = abi.encodePacked('"', "value", '": "', Strings.toString(p.level), '"');
        metadata = abi.encodePacked(metadata, metadataParcial);
        metadata = abi.encodePacked(metadata, "}");

        metadata = abi.encodePacked(metadata, ",");

        //LINK
        metadata = abi.encodePacked(metadata, "{");
        metadataParcial = abi.encodePacked('"', "trait_type", '": "', "LINK", '",');
        metadata = abi.encodePacked(metadata, metadataParcial);

        metadataParcial = abi.encodePacked('"', "value", '": "', p.link, '"');
        metadata = abi.encodePacked(metadata, metadataParcial);
        metadata = abi.encodePacked(metadata, "}");

        metadata = abi.encodePacked(metadata, " ] }");

        //metadata = abi.encodePacked(metadata, " }");
        string memory attributes64 = Base64.encode(metadata);
        return string(abi.encodePacked("data:application/json;base64,", attributes64));
    }

    function supportsInterface(bytes4 interfaceId) public view override(ERC721) returns (bool) {
        return super.supportsInterface(interfaceId);
    }
}
