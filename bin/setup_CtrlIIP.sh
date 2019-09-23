# Assumes python3, pip3 is installed

yum update -y &&
yum install -y \
    epel-release-7 \
    curl-7.29.0 \
    git-1.8.3.1 \
    make-3.82 \
    cmake-2.8.12.2 \
    gcc-c++-4.8.5 \

mkdir -p $IIP_LSST_DIR $IIP_LOG_DIR $IIP_TMP_DIR
useradd $IIP_USER
chown -R $IIP_USER:$IIP_USER $IIP_LSST_DIR
chown -R $IIP_USER:$IIP_USER $IIP_LOG_DIR

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

# TODO: move python files to $IIP_LSST_DIR and systemd files
