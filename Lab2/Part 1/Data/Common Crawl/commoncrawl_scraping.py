#Group Members: Omkar Thorat and Abhishek Bhave
#reference: https://github.com/automatingosint/osint_public/blob/master/commoncrawl/commoncrawler.py
import requests
import json
from io import BytesIO
import gzip
import csv
import codecs

from bs4 import BeautifulSoup



#We have used multiple domains like washingtonpost,foxnews,heraldonline,etc
domain = 'www.nbcnews.com'


index_list = ["2019-04","2019-09","2019-13"]


def search_domain(domain):

    record_list = []
    
    print ("[*] Trying target domain: %s" % domain)
    
    for index in index_list:
        
        print ("[*] Trying index %s" % index)
        
        cc_url  = "http://index.commoncrawl.org/CC-MAIN-%s-index?" % index
        cc_url += "url=%s&matchType=domain&output=json" % domain
        
        response = requests.get(cc_url)
        
        if response.status_code == 200:
            
            records = response.content.splitlines()
            
            for record in records:
                record_list.append(json.loads(record))
            
            print ("[*] Added %d results." % len(records))
            
    
    print ("[*] Found a total of %d hits." % len(record_list))
    
    return record_list        


entries = search_domain(domain)
link_list   = []

for i in range(len(entries)):
    
    if "trump" in entries[i]['url'] and "wall" in entries[i]['url'] and entries[i]['url'] not in link_list:
        link_list.append(entries[i]['url'])
    
         
print ("[*] Total external links discovered: %d" % len(link_list))

with codecs.open("%s-links.csv" % domain,"wb",encoding="utf-8") as output:

    fields = ["URL"]
    
    logger = csv.DictWriter(output,fieldnames=fields)
    logger.writeheader()
    
    for link in link_list:
        logger.writerow({"URL":link})