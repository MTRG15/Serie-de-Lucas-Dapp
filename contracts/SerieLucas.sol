// to compile and interact with this contract, I used the web browser based IDE Remix, 
// connected to an Injected Web3 provider from the Chrome plug in Metamask
// In turn, Metamask was connected to my localhost network created by 
// Ganache GUI, which created and administered the descentralized distributed system based on the
// Ethereum blockchain 


// Created by 
// Marco Ramírez
// CI: 24148570

// Explanation of this code available in 
// https://youtu.be/RvgqIOVtLIA

/* Aditional comments
Respecto a los criterios de comunicación entre procesos
- Todas las comunicaciones son P2P entre nodos, las transacciones operan con las
llaves públicas de ambos intermediarios para recibir transacciones, pero el acceso 
a las cuentas para administrar los fondos está cifrado por un hash: la llave privada de cada usuario

- Gerencia y sincronización: la blockchain de este proyecto funciona exactamente igual que la de Ethereum
pero a muy pequeña escala, no existen entes reguladores en esta red, cada nodo tiene responsabilidad de 
verificar las transacciones que se anexan a la cadena ANTES de poder añadir un bloque nuevo, es decir
si todos los nodos no están de acuerdo con las transacciones en la cadena, las que difieran serán eliminadas,
esto evita que usuarios malintencionados intenten modificar la cadena para su conveniencia (como por ejemplo,
añadirse fondos de Ethereum de forma ilícita, o modificar el código o estado de este contrato).

La manera de controlar el número de peticiones es a través del "gas", que representa el gasto computacional
de alterar la blockchain, y se debe pagar con Ethereum, esto hace que los usuarios minimizen su consumo
de recursos dentro del sistema de forma natural, sin necesidad de códigos o normas explícitas. Por otra parte
los nodos pueden ejecutar el cómputo de operaciones en otros sectores de la red, siempre y cuando estén 
conectados y disponibles, esto hace que se dependa en las masas para sostener el sistema, mientras más nodos
hay, más opciones de distribución de cargas pueden haber, de lo contrario, el cómputo queda a cargo del nodo 
que solicita la transacción. Nota: en el video las transacciones (increase) son inmediatas, pero en la red
de Ethereum real, esto puede tardar inclusive horas en ser verificada y añadida al último bloque de la cadena
*/
pragma solidity ^0.8.0;
// SPDX-License-Identifier: UNLICENSED
contract SerieLucas {
    // Declaring variables
    uint public current = 1;
    uint public previous = 2;
    uint buffer;
    bytes32 strbuffer;
    
    // calculates the next number in the series
    function increase() public{
        buffer = current;
        current = current + previous;
        previous = buffer;
    }
    
    // display the values of  the variables
    function retrieve_current() public view returns(string memory){
        return uintToString(current);
    }
    
    function retrieve_previous() public view returns(string memory){
        return uintToString(previous);
    }
    
    // return the values for the current and previous values
    function uintToString(uint v) public pure returns (string memory) {
    uint maxlength = 100;
    bytes memory reversed = new bytes(maxlength);
    uint i = 0;
    while (v != 0) {
        uint remainder = v % 10;
        v = v / 10;
        reversed[i++] = bytes1(uint8(48 + remainder));
    }
    bytes memory s = new bytes(i); // i + 1 is inefficient
    for (uint j = 0; j < i; j++) {
        s[j] = reversed[i - j - 1]; // to avoid the off-by-one error
    }
    string memory str = string(s);  // memory isn't implicitly convertible to storage
    return str;
    }
    
    
}