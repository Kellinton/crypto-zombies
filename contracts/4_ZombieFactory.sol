// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ZombieFactory {

    // Número de dígitos na sequência de DNA
    uint dnaDigits = 16;
    // Módulo para garantir que o DNA esteja dentro da faixa desejada
    uint dnaModulus = 10 ** dnaDigits;

}
