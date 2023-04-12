#pip install bitcoinlib
# my key -dont rerun 1KqU77xhQSB1ycThmsNvpHT3EWjpQ47ed5
from bitcoinlib.wallets import Wallet 
w=Wallet.create('Wallet1') 
key1=w.get_key()
key1.address

w.scan() 
w.info()

#   1PBmsaavmtsKxyunLHfqNVCRaB2ojF5MZS
from bitcoinlib.wallets import Wallet 
w2=Wallet.create('Wallet2') 
key2=w2.get_key()
key2.address

w2.scan() 
w2.info()

t=w2.send_to('1KqU77xhQSB1ycThmsNvpHT3EWjpQ47ed5','0 BTC') 
t.info