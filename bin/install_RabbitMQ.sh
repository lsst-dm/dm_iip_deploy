cd $IIP_TMP_DIR
curl -s $IIP_PACKAGE_REPO/install_erlang.sh | bash
yum install -y erlang-22.0.7
# Just for legacy legacy key importing. Don't think it is needed anymore since
# we store packages locally.
rpm --import $IIP_PACKAGE_REPO/rabbitmq-server.gpg.key
rpm --import $IIP_PACKAGE_REPO/packagecloud.gpg.key
curl -s $IIP_PACKAGE_REPO/install_rabbitmq-server.sh | bash
curl -L $IIP_PACKAGE_REPO/rabbitmq-server-3.7.16-1.el7.noarch.rpm -O
yum install -y rabbitmq-server-3.7.16-1.el7.noarch.rpm
