REDIS_USER=redis
useradd $REDIS_USER

touch /var/log/redis_6379.log
mkdir -p /var/lib/redis

chown -R $REDIS_USER:$REDIS_USER /var/log/redis_6379.log
chown -R $REDIS_USER:$REDIS_USER /var/lib/redis
