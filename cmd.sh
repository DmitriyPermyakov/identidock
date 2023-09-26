#!bin/bash
set -e
if [ "$ENV" = 'DEV' ]; then
   echo "Running development server"
   exec python "/app/Identidock.py"
else
   echo "Running production server"
   exec uwsgi --http 0.0.0.0:9090 --wsgi-file /app/Identidock.py --callable app --stats 0.0.0.0:9191
fi