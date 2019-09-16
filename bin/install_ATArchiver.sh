# Install Redis and RabbitMQ
# Currently Redis and RabbitMQ install scripts are included here but we are
# gonna transfer control of these servers under Puppet.
./install_RabbitMQ.sh
./install_Redis.sh

# Install python libraries
/usr/bin/pip3 install -r ../docs/python_libs_versions.txt
