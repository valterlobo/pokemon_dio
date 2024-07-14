// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import {Script, console} from "forge-std/Script.sol";
import "../src/PokemonDIO.sol";

contract Deploy is Script {
    function setUp() public {}

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("DEPLOY_PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        address owner = vm.envAddress("OWNER_CONTRACT");
        PokemonDIO nft = new PokemonDIO(owner);
        console.log(address(nft));
        vm.stopBroadcast();
    }
}

contract Mint is Script {
    function setUp() public {}

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("DEPLOY_PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);
        address tkContract = vm.envAddress("TK_CONTRACT");
        PokemonDIO nft = PokemonDIO(payable(tkContract));
        address to = payable(vm.envAddress("TO_MINT"));
        //nft.mint(to, 1200e18);
        //uint256 b = token.balanceOf(to);
        /*
        # bulbasaur
        # https://pokemondb.net/pokedex/bulbasaur
        # https://img.pokemondb.net/artwork/large/bulbasaur.jpg
        */
        //nft.createNewPokemon("bulbasaur", to , "https://img.pokemondb.net/artwork/large/bulbasaur.jpg", "https://pokemondb.net/pokedex/bulbasaur");

        /*
                    1
                    ---------------------
                    Mint PokemonDIO:
                    bulbasaur
                    https://pokemondb.net/pokedex/bulbasaur
                    https://img.pokemondb.net/artwork/large/bulbasaur.jpg
                    ---------------------
                    2
                    ---------------------
                    Mint PokemonDIO:
                    ivysaur
                    https://pokemondb.net/pokedex/ivysaur
                    https://img.pokemondb.net/artwork/large/ivysaur.jpg
                    ---------------------
                    3
                    ---------------------
                    Mint PokemonDIO:
                    venusaur
                    https://pokemondb.net/pokedex/venusaur
                    https://img.pokemondb.net/artwork/large/venusaur.jpg
                    ---------------------
                    4
                    ---------------------
                    Mint PokemonDIO:
                    charmander
                    https://pokemondb.net/pokedex/charmander
                    https://img.pokemondb.net/artwork/large/charmander.jpg
        */
        //console.log(b);


        /*
                        5
                ---------------------
                Mint PokemonDIO:
                charmeleon
                https://pokemondb.net/pokedex/charmeleon
                https://img.pokemondb.net/artwork/large/charmeleon.jpg
                ---------------------
                6
                ---------------------
                Mint PokemonDIO:
                charizard
                https://pokemondb.net/pokedex/charizard
                https://img.pokemondb.net/artwork/large/charizard.jpg
                ---------------------
                7
                ---------------------
                Mint PokemonDIO:
                squirtle
                https://pokemondb.net/pokedex/squirtle
                https://img.pokemondb.net/artwork/large/squirtle.jpg
                ---------------------
                8
                ---------------------
                Mint PokemonDIO:
                wartortle
                https://pokemondb.net/pokedex/wartortle
                https://img.pokemondb.net/artwork/large/wartortle.jpg
                ---------------------
                9
                ---------------------
                Mint PokemonDIO:
                blastoise
                https://pokemondb.net/pokedex/blastoise
                https://img.pokemondb.net/artwork/large/blastoise.jpg
                ---------------------
                10
                ---------------------
                Mint PokemonDIO:
                caterpie
                https://pokemondb.net/pokedex/caterpie
                https://img.pokemondb.net/artwork/large/caterpie.jpg
     
        nft.createNewPokemon(
            "charmeleon",
            to,
            " https://img.pokemondb.net/artwork/large/charmeleon.jpg",
            " https://pokemondb.net/pokedex/charmeleon"
        );
        nft.createNewPokemon(
            "charizard",
            to,
            "https://img.pokemondb.net/artwork/large/charizard.jpg",
            "https://pokemondb.net/pokedex/charizard"
        );
        nft.createNewPokemon(
            "squirtle",
            to,
            "https://img.pokemondb.net/artwork/large/squirtle.jpg",
            "https://pokemondb.net/pokedex/squirtle"
        );
        nft.createNewPokemon(
            "wartortle",
            to,
            "https://img.pokemondb.net/artwork/large/wartortle.jpg",
            "https://pokemondb.net/pokedex/wartortle"
        );
        nft.createNewPokemon(
            "blastoise",
            to,
            "https://img.pokemondb.net/artwork/large/blastoise.jpg",
            "https://pokemondb.net/pokedex/blastoise"
        );
        nft.createNewPokemon(
            "caterpie",
            to,
            "https://img.pokemondb.net/artwork/large/caterpie.jpg",
            "https://pokemondb.net/pokedex/caterpie"
        );   */


                /*
                11
        ---------------------
        Mint PokemonDIO:
        metapod
        https://pokemondb.net/pokedex/metapod
        https://img.pokemondb.net/artwork/large/metapod.jpg
        ---------------------
        12
        ---------------------
        Mint PokemonDIO:
        butterfree
        https://pokemondb.net/pokedex/butterfree
        https://img.pokemondb.net/artwork/large/butterfree.jpg
        ---------------------
        13
        ---------------------
        Mint PokemonDIO:
        weedle
        https://pokemondb.net/pokedex/weedle
        https://img.pokemondb.net/artwork/large/weedle.jpg
        ---------------------
        14
        ---------------------
        Mint PokemonDIO:
        kakuna
        https://pokemondb.net/pokedex/kakuna
        https://img.pokemondb.net/artwork/large/kakuna.jpg
        ---------------------
        15
        ---------------------
        Mint PokemonDIO:
        beedrill
        https://pokemondb.net/pokedex/beedrill
        https://img.pokemondb.net/artwork/large/beedrill.jpg
        ---------------------
        */

        nft.createNewPokemon(
            "metapod",
            to,
            "https://img.pokemondb.net/artwork/large/metapod.jpg",
            "https://pokemondb.net/pokedex/metapod"
        ); 

        nft.createNewPokemon(
            "butterfree",
            to,
            "https://img.pokemondb.net/artwork/large/butterfree.jpg",
            "https://pokemondb.net/pokedex/butterfree"
        ); 

        nft.createNewPokemon(
            "weedle",
            to,
            "https://img.pokemondb.net/artwork/large/weedle.jpg",
            "https://pokemondb.net/pokedex/weedle"
        ); 
        nft.createNewPokemon(
            "kakuna",
            to,
            "https://img.pokemondb.net/artwork/large/kakuna.jpg",
            "https://pokemondb.net/pokedex/kakuna"
        ); 
        nft.createNewPokemon(
            "beedrill",
            to,
            "https://img.pokemondb.net/artwork/large/beedrill.jpg",
            "https://pokemondb.net/pokedex/beedrill"
        ); 
        vm.stopBroadcast();
    }
}
