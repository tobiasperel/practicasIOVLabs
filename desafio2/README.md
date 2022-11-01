# Sample Hardhat Project

This project demonstrates a basic Hardhat use case. It comes with a sample contract, a test for that contract, and a script that deploys that contract.

Try running some of the following tasks:

```shell
npx hardhat help
npx hardhat test
REPORT_GAS=true npx hardhat test
npx hardhat node
npx hardhat run scripts/deploy.js
```

Desafío #2
● Crear la función de mintear para que solo
se puedan emitir tokens cada una cierta
cantidad de tiempo
● Permitir que el owner modifique esa cantidad de tiempo
● Hacer un script en el que 2 cuentas minteen tokens
● Agregar al script un manejo de error para cuando una cuenta
quiere mintear dos veces antes de tiempo