ARG CONFLUENT_PLATFORM_VERSION=7.4.0
FROM confluentinc/cp-kafka:${CONFLUENT_PLATFORM_VERSION}

ENV KAFKA_HOST=kafka-1:19092 \
    KAFKA_TIMEOUT=60 \
    ZOOKEEPER_CONNECTION_STRING=zookeeper:2181 \
    KAFKA_CREATE_TOPICS="" \
    KAFKA_TOPIC_CONFIG=""

COPY create_topics.py wait-for.sh /
RUN chmod +x /create_topics.py /wait-for.sh

CMD /wait-for.sh $KAFKA_HOST --strict --timeout=$KAFKA_TIMEOUT -- /create_topics.py
