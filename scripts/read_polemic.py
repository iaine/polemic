import urllib.request
import json
import sys

#metadata key
key = ""
url = "https://ldt.iri.centrepompidou.fr/ldtplatform/ldt/cljson/id/{0}?format=json".format(key)

#@todo: add the session files

try :
    response = urllib.request.urlopen(url)
    data = response.read()
    encoding = response.info().get_content_charset('utf-8')
    polemic_json = json.loads(data.decode(encoding))

    fh = open("enmi20/" + key + "_annotations.csv","a")
    for annotation in polemic_json['annotations']:
        _id = ""
        meta = annotation['meta']
        for key in meta.keys():
            if key == "dc:source":
                _data = json.loads(meta[key]['content'])
                _id = str(_data["id"])

        polemic = ';'.join(annotation["content"]["polemics"])

        fh.write(','.join([_id, str(polemic), str(annotation["begin"]), str(annotation["end"])]) + "\n")              
    fh.close
    
except Exception as e:
    print(e)
