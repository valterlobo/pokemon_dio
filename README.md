## Projeto: PokemonDIO


O **PokemonDIO** é um Smart Contract que representa uma coleção de Pokémons, onde cada Pokémon é um token não-fungível (NFT) conforme o padrão ERC721. Cada Pokémon possui atributos únicos, como nome, nível e imagem, tornando-os colecionáveis e únicos.


#### Documentação

Para mais detalhes sobre a implementação e funcionalidades do contrato, consulte a documentação completa no GitHub:
[Documentação do PokemonDIO](https://github.com/valterlobo/pokemon_dio/blob/main/README.md)

#### Informações do Contrato

- **Número do Contrato**: [0x41639F6cC552546a840f7C39FDad798158426314](https://testnet.bscscan.com/token/0x41639F6cC552546a840f7C39FDad798158426314)
- **BscScan**: Verifique o contrato no BscScan para visualizar transações e detalhes técnicos.
  [BscScan do PokemonDIO](https://testnet.bscscan.com/token/0x41639F6cC552546a840f7C39FDad798158426314)
- **OpenSea (BNB Testnet)**: Explore a coleção de Pokémons no marketplace OpenSea para tokens na rede de teste BNB.
  [OpenSea - PokemonDIO](https://testnets.opensea.io/collection/pokemondio)

#### Funcionalidades Principais

1. **Criação de Novos Pokémons**: O contrato permite a criação de novos Pokémons, cada um com atributos únicos, que são mintados e atribuídos a um endereço especificado.
2. **Batalhas de Pokémons**: Proprietários de Pokémons podem iniciar batalhas entre seus Pokémons e os de outros jogadores, com a possibilidade de aumentar os níveis dos Pokémons vencedores.
3. **Transferência e Queima**: Tokens podem ser transferidos entre endereços e também queimados, removendo-os permanentemente da coleção.

#### Interações

- **Mintar Novo Pokémon**: Crie novos Pokémons e adicione-os à coleção.
- **Iniciar Batalha**: Proporcione batalhas entre Pokémons para aumentar seus níveis e habilidades.
- **Transferir e Queimar**: Gerencie seus Pokémons, transferindo-os para outros colecionadores ou queimando tokens indesejados.


#### Regras da Função `battle`

1. **Validação do Proprietário**: Apenas o proprietário do Pokémon atacante (`_attackingPokemon`) pode iniciar uma batalha. Isso é garantido pelo modificador `onlyOwnerOf`.

2. **Comparação de Níveis**:
    - Se o nível do Pokémon atacante (`attacker.level`) for maior ou igual ao nível do Pokémon defensor (`defender.level`), o atacante ganha 2 níveis e o defensor ganha 1 nível.
    - Caso contrário, o atacante ganha 1 nível e o defensor ganha 2 níveis.

As regras incentiva batalhas frequentes e proporciona um mecanismo de progressão para os Pokémons com base nas batalhas que participam.


## Implantação 

Para implantar, você precisará de um ambiente de desenvolvimento Ethereum, como o Foundry

### 1. Configurar o .env (template .env.example)

### 2. Compile o contrato

```shell
forge build
```

### 3. Executar os testes do contrato

  ```shell
  forge test
 ```


### 4. Executar o script de "Deploy" do contrato

```shell
forge script script/PokemonDIO.s.sol:Deploy   --fork-url $RPC_URL  --broadcast 
```


### 5. Executar o script de "Mint" do Pokemon

```shell
forge script script/PokemonDIO.s.sol:Mint   --fork-url $RPC_URL  --broadcast 
```


## Endereço do contrato na tesnet BSC


Número do contrato:     0x41639F6cC552546a840f7C39FDad798158426314

BscScan:                https://testnet.bscscan.com/token/0x41639F6cC552546a840f7C39FDad798158426314

OPenSea   BNB Testnet:  https://testnets.opensea.io/collection/pokemondio


 
## O que é ERC-721 ?
O ERC-721 é um padrão para tokens não-fungíveis (NFTs) na blockchain Ethereum. Diferente dos tokens fungíveis (como os tokens ERC-20), que são intercambiáveis entre si, cada token ERC-721 é único e pode representar ativos específicos, como obras de arte digitais, colecionáveis, imóveis virtuais, entre outros.

### Características Principais do ERC-721

1. **Não-Fungibilidade**: Cada token ERC-721 é único, com um identificador distinto. Isso significa que dois tokens ERC-721 não podem ser trocados diretamente um pelo outro de forma equivalente, pois cada um tem atributos e valores únicos.

2. **Propriedade e Transferência**: Como outros tokens, os tokens ERC-721 podem ser possuídos e transferidos entre contas. Eles têm funções para consultar o proprietário e transferir tokens entre endereços.

3. **Metadados**: Tokens ERC-721 podem ter metadados associados a eles, como nome, descrição e link para uma imagem ou outro tipo de mídia. Isso é útil para representar itens digitais com características únicas.

4. **Aprovação e Transferência Segura**: O ERC-721 inclui funções para aprovação de terceiros para transferir tokens em nome do proprietário, bem como funções de transferência segura para garantir que os tokens não sejam enviados para endereços que não podem gerenciá-los.

### Funções Principais do ERC-721

- `balanceOf(address owner)`: Retorna o número de tokens possuídos por um endereço.
- `ownerOf(uint256 tokenId)`: Retorna o endereço do proprietário de um token específico.
- `safeTransferFrom(address from, address to, uint256 tokenId)`: Transfere a propriedade de um token de forma segura.
- `transferFrom(address from, address to, uint256 tokenId)`: Transfere a propriedade de um token.
- `approve(address to, uint256 tokenId)`: Aprova um endereço para transferir um token específico em nome do proprietário.
- `getApproved(uint256 tokenId)`: Retorna o endereço aprovado para um token específico.
- `setApprovalForAll(address operator, bool approved)`: Aprova ou remove a aprovação para um operador gerenciar todos os tokens do proprietário.
- `isApprovedForAll(address owner, address operator)`: Verifica se um operador está aprovado para gerenciar todos os tokens de um proprietário.

### Exemplo de Uso do ERC-721

Os tokens ERC-721 são amplamente utilizados para representar itens colecionáveis digitais, como no jogo **CryptoKitties**, onde cada "gato" é um token ERC-721 com características únicas. Eles também são usados em marketplaces de arte digital, como o **OpenSea**, onde artistas podem vender obras de arte digitais únicas como NFTs.

### Benefícios do ERC-721

- **Autenticidade e Escassez**: Como cada token é único, os NFTs podem provar a autenticidade e a propriedade de itens digitais, bem como a sua escassez.
- **Interoperabilidade**: Por seguir um padrão comum, os tokens ERC-721 podem ser suportados por diferentes plataformas e aplicativos na Ethereum, permitindo um ecossistema rico e interoperável.