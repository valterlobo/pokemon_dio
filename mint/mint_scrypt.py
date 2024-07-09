
import os
from dotenv import load_dotenv
from web3 import Web3
from pokedex import pokedex



# Variáveis de ambiente
load_dotenv(".env")


# Configurar a conexão
provider_url = os.getenv('PROVIDER_URL')
web3 = Web3(Web3.HTTPProvider(provider_url))

# Obtém o ABI do contrato
abi_contrato = open("PokemonDIO.json", "r").read()

'''
# Cria uma instância do contrato
contract = web3.eth.contract(
    abi=abi_contrato, address=os.getenv('CONTRACT_ADDRESS'))

# var para criação do  PokemonDIO 
to_address = os.getenv('TO_ADDRESS')
private_key = os.getenv('PRIVATE_KEY')

'''


#string memory _name, address _to, string memory _img, string memory _link
def createPokemonDIO(nm , img , link ):
  print("Mint PokemonDIO:")
  print(nm)
  print(link)
  print(img)
  
  

print("START.................")
pok = pokedex.Pokedex(version='v1', user_agent='NFT POKEMON DIO (https://exampleX.com, v2.0.1)')


for i in range(20,30):
    print (i+1)
    print("---------------------")
    idx = i + 1 
    #pokemon = pok.get_pokemon(idx)
    #print(pokemon[0]['number'])
    #print(pokemon[0]['sprite'])
    #print(pokemon[0]['name'])
    nm = str(idx) # pokemon[0]['name'].lower() 
    link = "https://pokemondb.net/pokedex/" + nm   
    img = "https://img.pokemondb.net/artwork/large/" + nm  + ".jpg"   
    createPokemonDIO(nm, img, link )
    print("---------------------")





