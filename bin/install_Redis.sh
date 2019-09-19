cd $IIP_TMP_DIR
curl -L $IIP_PACKAGE_REPO/redis/redis-5.0.5.tar.gz -O
tar zxvf redis-5.0.5.tar.gz
cd redis-5.0.5
make
make install
