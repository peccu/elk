# for [CasaOS](http://casaos.io)

You need to change `vm.max_map_count` to 262144 or more before start elasticsearch. [Ref](https://www.elastic.co/guide/en/elasticsearch/reference/8.15/_maximum_map_count_check.html)

```bash
$ echo | sudo tee -a /etc/sysctl.conf
$ echo 'vm.max_map_count=262144' | sudo tee -a /etc/sysctl.conf
$ reboot
```

Moved to [another repo](https://github.com/peccu/ZimaBoard-apps/blob/main/kibana.yml)

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
      - discovery.type=single-node
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
