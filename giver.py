import json

def givedata():
    with open('matches.csv','r') as data:
        res = json.load(data)
        return res