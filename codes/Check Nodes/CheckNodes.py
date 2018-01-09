#This code is written by Abhishek Singh(15BCE1009)

import os
import threading

'''define network subnet '''

def network_subnet(ip):
    net=ip.split('.')
    dot='.'
    net=net[0]+dot+net[1]+dot+net[2]+dot
    return net
''' network scan to check machines
    responding to ping request '''

def network_scan(ip):
        cmd="ping -c 1"+" "+ip
        result=os.popen(cmd)
        for p in result.readlines():
            if p.count('ttl'):
               print "[+] Node Alive--------->[%s]"%ip

def start_scan(ip,st,en):
        net=network_subnet(ip)
        for index in xrange(st,en):
            IP=net+str(index)
            t=threading.Thread(target=network_scan,args=(IP,))
            t.start()

if __name__=='__main__':
  IP="192.168.43.1"
  try:
     start_scan(IP,1,254)
  except:
     print "Give Network Id As: \n10.0.0.1"
