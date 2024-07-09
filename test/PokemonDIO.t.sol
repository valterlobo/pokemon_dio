// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import {Test, console} from "forge-std/Test.sol";
import {PokemonDIO} from "../src/PokemonDIO.sol";

//import {BuyPass} from "../src/BuyPass.sol";

contract PokemonDIOTest is Test {
    PokemonDIO public nftPKD;

    address gameowner = vm.addr(0x1);
    address jog1 = vm.addr(0x2);
    address jog2 = vm.addr(0x4);
    address jog3 = vm.addr(0x8);
    address jog4 = vm.addr(0x16);

    function setUp() public {
        nftPKD = new PokemonDIO(gameowner);
    }

    function test_createNewPokemon() public {
        vm.prank(gameowner);
        nftPKD.createNewPokemon("POC1", jog1, "http://pkd/01.jpg", "http://pkd/01.html");
        assertEq(1, nftPKD.balanceOf(jog1));
        vm.stopPrank();
    }

    function test_battle() public {
        vm.prank(gameowner);
        nftPKD.createNewPokemon("POC2", jog2, "http://pkd/02.jpg", "http://pkd/02.html");
        assertEq(1, nftPKD.balanceOf(jog2));
        vm.prank(gameowner);
        nftPKD.createNewPokemon("POC3", jog3, "http://pkd/03.jpg", "http://pkd/03.html");
        assertEq(1, nftPKD.balanceOf(jog3));
        vm.stopPrank();

        PokemonDIO.Pokemon memory p0 = nftPKD.getPokemonInfo(0);
        PokemonDIO.Pokemon memory p1 = nftPKD.getPokemonInfo(1);

        console.log(p0.name);
        console.log(p0.level);
        /*
        console.log(p0.level);
        console.log(p1.level);
        console.log(nftPKD.ownerOf(0));
        */
        vm.prank(jog2);
        nftPKD.battle(0, 1);

        PokemonDIO.Pokemon memory p0n = nftPKD.getPokemonInfo(0);
        PokemonDIO.Pokemon memory p1n = nftPKD.getPokemonInfo(1);
        uint256 l0;
        uint256 l1;
        (l0, l1) = nftPKD.playLevel(p0.level, p1.level);
        assertEq(l0, p0n.level);
        assertEq(l1, p1n.level);
    }

    function test_battle_owner() public {
        vm.prank(gameowner);
        nftPKD.createNewPokemon("POC2", jog2, "http://pkd/02.jpg", "http://pkd/02.html");
        assertEq(1, nftPKD.balanceOf(jog2));
        vm.prank(gameowner);
        nftPKD.createNewPokemon("POC3", jog3, "http://pkd/03.jpg", "http://pkd/02.html");
        assertEq(1, nftPKD.balanceOf(jog3));
        vm.stopPrank();

        vm.prank(jog4);
        vm.expectRevert("Apenas o dono pode batalhar com este Pokemon");
        nftPKD.battle(0, 1);
    }

    function test_getPokemonInfo() public {
        vm.prank(gameowner);
        nftPKD.createNewPokemon("POC2", jog2, "http://pkd/02.jpg", "http://pkd/02.html");
        assertEq(1, nftPKD.balanceOf(jog2));
        PokemonDIO.Pokemon memory pkd = nftPKD.getPokemonInfo(0);
        assertEq("POC2", pkd.name);
    }

    function test_getPokemonInfo_nao_existe() public {
        vm.expectRevert("Pokemon NAO EXISTE");
        nftPKD.getPokemonInfo(10);
    }

    function test_tokenURI() public {
        vm.prank(gameowner);
        nftPKD.createNewPokemon("POC2", jog2, "http://pkd/02.jpg", "http://pkd/02.html");
        assertEq(1, nftPKD.balanceOf(jog2));
        PokemonDIO.Pokemon memory pkd = nftPKD.getPokemonInfo(0);
        assertEq("POC2", pkd.name);

        string memory uri = nftPKD.tokenURI(0);

        console.log(uri);
    }
}
