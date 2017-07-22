#!/usr/bin/env python3

import json
import sys

def main(args):
   output_fname = '../assets/res/valid_jp_us_cities.txt'
   of = open(output_fname,'w')
   with open(args[0],'r') as data_file:       
      data = json.load(data_file)
   
   for city in data:
      if city["country"] == 'US' or city["country"] == 'JP':
         of.write(city["name"]+","+city["country"]+"\n")
      

if __name__ == "__main__":
   main(sys.argv[1:])
