// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ZombieFactory {

    // Número de dígitos na sequência de DNA
    uint dnaDigits = 16;
    // Módulo para garantir que o DNA esteja dentro da faixa desejada
    uint dnaModulus = 10 ** dnaDigits;

    // Estrutura que define um Zumbi com nome e DNA
    struct Zombie {
        string name;
        uint dna;
    }

    // Array público para armazenar todos os zumbis criados
    Zombie[] public zombies;

}
