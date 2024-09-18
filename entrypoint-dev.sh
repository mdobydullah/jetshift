#!/bin/sh

# Start luigid
luigid --port 8082 &

# Start Flask development server with hot-reload
flask run --host=0.0.0.0 --port=8080 --reload &

# Start Redis server & RQ worker
#redis-server &
rq worker --url redis://$REDIS_HOST:$REDIS_PORT &

# Start cron
crond -f &

# Wait for all background processes to finish
wait
