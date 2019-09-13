# create credential file
mkdir -p $IIP_SECURE_DIR
cat > $IIP_SECURE_DIR/iip_cred.yaml << EOF
rabbitmq_users:
    service_user: $IIP_RMQ_USER
    service_passwd: $IIP_RMQ_PWD
EOF

chown -R $IIP_USER:$IIP_USER $IIP_SECURE_DIR
chmod 700 $IIP_SECURE_DIR
chmod 600 $IIP_SECURE_DIR/iip_cred.yaml

# enable rabbitmqadmin
/usr/sbin/rabbitmq-plugins enable rabbitmq_management
curl -L http://$HOSTNAME:15672/cli/rabbitmqadmin -o $IIP_TMP_DIR/rabbitmqadmin
chmod +x $IIP_TMP_DIR/rabbitmqadmin
cp $IIP_TMP_DIR/rabbitmqadmin /usr/sbin

# setup users and vhost
declare -a queues=( 
    "at_foreman_consume"
    "at_foreman_ack_publish"
    "archive_ctrl_publish"
    "archive_ctrl_consume"
    "dmcs_consume"
    "dmcs_ack_consume"
    "ocs_dmcs_consume"
    "dmcs_ocs_publish"
    "dmcs_fault_consume"
    "gen_dmcs_consume"
    "at_forwarder_publish"
    "f99_consume"
    "f91_consume"
    "f92_consume"
    "f93_consume"
    "ar_foreman_ack_publish"
    "telemetry_queue"
)  

/usr/sbin/rabbitmqctl add_user $IIP_RMQ_USER $IIP_RMQ_PWD
/usr/sbin/rabbitmqctl add_vhost $IIP_VHOST
/usr/sbin/rabbitmqctl set_permissions -p $IIP_VHOST $IIP_RMQ_USER ".*" ".*" ".*"
/usr/sbin/rabbitmqctl set_user_tags $IIP_RMQ_USER administrator

# declare exchange and queues
/usr/sbin/rabbitmqadmin declare exchange --vhost=$IIP_VHOST name=message type=direct -u $IIP_RMQ_USER -p $IIP_RMQ_PWD
for i in ${queues[@]}
do
    /usr/sbin/rabbitmqadmin declare queue name=$i durable=true --vhost=$IIP_VHOST -u $IIP_RMQ_USER -p $IIP_RMQ_PWD
    /usr/sbin/rabbitmqadmin declare binding source=message destination_type=queue destination=$i routing_key=$i --vhost=$IIP_VHOST -u $IIP_RMQ_USER -p $IIP_RMQ_PWD
done
