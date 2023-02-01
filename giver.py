import json

def givedata():
    with open('host/matches.csv','r') as data:
        res = json.load(data)
        return res