ARG CONFLUENT_PLATFORM_VERSION=7.4.0
FROM confluentinc/cp-kafka:${CONFLUENT_PLATFORM_VERSION}

ENV KAFKA_BROKER_LIST=kafka-1:19092 \
    KAFKA_TIMEOUT=60 \
    KAFKA_ZOOKEEPER_CONNECT=zookeeper-1:2181 \
    KAFKA_CREATE_TOPICS="" \
    KAFKA_TOPIC_CONFIG=""

COPY create_topics.py  /

CMD cub kafka-ready -b kafka-1:19092 1 120 && /create_topics.py
