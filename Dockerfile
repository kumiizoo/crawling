FROM alephdata/memorious:latest

COPY setup.py /crawlers/
COPY src /crawlers/src
RUN pip3 install -q -e /crawlers
COPY config /crawlers/config

ENV MEMORIOUS_BASE_PATH=/data \
    MEMORIOUS_DEBUG=false \
    ARCHIVE_PATH=/data/archive \
    REDIS_URL=redis://redis:6379/0 \
    MEMORIOUS_DATASTORE_URI=postgresql://datastore:datastore@datastore/datastore \
    MEMORIOUS_INCREMENTAL=false
