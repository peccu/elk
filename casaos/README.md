# for [CasaOS](http://casaos.io)

```yaml
services:
  es:
    image: docker.elastic.co/elasticsearch/elasticsearch:8.14.3
    volumes:
      - /esdata:/usr/share/elasticsearch/data
    ports:
      - 9200:9200
    environment:
      - node.name=es
      - ELASTIC_PASSWORD=elastic
      - xpack.security.enabled=false
```

```yaml
services:
  kibana:
    image: docker.elastic.co/kibana/kibana:8.14.3
    volumes:
      - /kibanadata:/usr/share/kibana/data
    ports:
      - 5601:5601
    environment:
      - SERVERNAME=kibana
      - ELASTICSEARCH_HOSTS=http://es:9200
      - ELASTICSEARCH_USERNAME=kibana_system
      - ELASTICSEARCH_PASSWORD=elastic
```
