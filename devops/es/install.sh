docker run -d \
  --name elasticsearch \
  --restart always \
  -e "discovery.type=single-node" \
  -v $PWD/elasticsearch.yml:/usr/share/elasticsearch/config/elasticsearch.yml \
  -v $PWD/data:/usr/share/elasticsearch/data \
  -p 9200:9200 \
  -p 9300:9300 \
  docker.elastic.co/elasticsearch/elasticsearch:6.3.2