import urllib.request
import json


def get_polemic_data(api_key):
    '''
       Function to get the data for a particular store

       api_key: takes the API key from the metadata file

       returns json
    '''
    #metadata key
    key = api_key
    url = "https://ldt.iri.centrepompidou.fr/ldtplatform/ldt/cljson/id/{0}?format=json".format(key)

    session_data = []

    try :
        response = urllib.request.urlopen(url)
        data = response.read()
        encoding = response.info().get_content_charset('utf-8')
        polemic_json = json.loads(data.decode(encoding))

        for annotation in polemic_json['annotations']:
            _id = ""
            meta = annotation['meta']
            for key in meta.keys():
                if key == "dc:source":
                    _data = json.loads(meta[key]['content'])
                    _id = str(_data["id"])

            polemic = ';'.join(annotation["content"]["polemics"])

            session_data.append({'id': _id, 'polemic':str(polemic), 'start':str(annotation["begin"]), 'end': str(annotation["end"]), 'text':''})              
        
    except Exception as e:
        print(e)
        
    return session_data