cd $IIP_TMP_DIR
curl -s https://packagecloud.io/install/repositories/rabbitmq/erlang/script.rpm.sh | bash
yum install -y erlang
rpm --import https://packagecloud.io/rabbitmq/rabbitmq-server/gpgkey
rpm --import https://packagecloud.io/gpg.key
curl -s https://packagecloud.io/install/repositories/rabbitmq/rabbitmq-server/script.rpm.sh | bash
curl -L https://github.com/rabbitmq/rabbitmq-server/releases/download/v3.7.16/rabbitmq-server-3.7.16-1.el7.noarch.rpm -o rabbitmq-server-3.7.16-1.el7.noarch.rpm
yum install -y rabbitmq-server-3.7.16-1.el7.noarch.rpm
