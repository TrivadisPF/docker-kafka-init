ARG CONFLUENT_PLATFORM_VERSION=7.4.0
FROM confluentinc/cp-kafka:${CONFLUENT_PLATFORM_VERSION}

ENV BOOTSTRAP_SERVERS=kafka-1:19092 \
    KAFKA_TIMEOUT=60 \
    KAFKA_EXPECTED_BROKERS=1 \
    KAFKA_CREATE_TOPICS="" \
    KAFKA_TOPIC_CONFIG=""

COPY create_topics.py  /
COPY create_users.sh  /
COPY config.properties /

CMD cub kafka-ready -b kafka-1:19092 ${KAFKA_EXPECTED_BROKERS} ${KAFKA_TIMEOUT} && /create_users.sh && /create_topics.py
