// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ZombieFactory {

    // Evento que será emitido quando um novo zumbi for criado
    event NewZombie(uint zombieId, string name, uint dna);

    // Número de dígitos na sequência de DNA
    uint dnaDigits = 16;
    // Módulo para garantir que o DNA esteja dentro da faixa desejada
    uint dnaModulus = 10 ** dnaDigits;

    // Estrutura para representar um Zumbi com um nome e DNA
    struct Zombie {
        string name;
        uint dna;
    }

    // Array para armazenar todos os zumbis criados
    Zombie[] public zombies;

    // Função privada para criar um novo zumbi e armazená-lo no array de zumbis
    function _createZombie(string memory _name, uint _dna) private {
        // O ID do novo zumbi é o comprimento do array de zumbis
        uint id = zombies.length;
        // Adiciona o novo zumbi ao array
        zombies.push(Zombie(_name, _dna));
        // Emite o evento NewZombie
        emit NewZombie(id, _name, _dna);
    } 

    // Função privada para gerar um DNA aleatório baseado na string de entrada
    function _generateRandomDna(string memory _str) private view returns (uint) {
        // Gera um número aleatório usando a função hash keccak256
        uint rand = uint(keccak256(abi.encodePacked(_str)));
        // Retorna o número aleatório módulo dnaModulus para garantir que esteja dentro da faixa válida
        return rand % dnaModulus;
    }

    // Função pública para criar um zumbi aleatório com um nome especificado
    function createRandomZombie(string memory _name) public {
        // Gera o DNA aleatório usando o nome fornecido
        uint randDna = _generateRandomDna(_name);
        // Cria um novo zumbi com o DNA gerado
        _createZombie(_name, randDna);
    }

}
