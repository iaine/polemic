'''
  File to get the headers from 
'''
import csv
import urllib.request

fh = open('web_urls.csv', 'r')
urllist = fh.readlines()
fh.close

#uniquify the list
urls = list(set(urllist))

fh1 = open('url_headers.csv','w')
for url in urls:
    if "pbs.twimg" in url:
        print(url)
        # get the urls
        try:
            response = urllib.request.urlopen(url)
            headers_to_string = ''
            for header in list(response.headers.items()):
                headers_to_string += ':'.join(header) + ';'
            fh1.write(','.join([url, headers_to_string]) + "\n")
        except Exception as e:
            fh1.write(','.join([url, str(e)]) + "\n")
fh.close