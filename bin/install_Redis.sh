cd $IIP_TMP_DIR
curl -L $IIP_PACKAGE_REPO/redis-5.0.5.tar.gz -o redis-5.0.5.tar.gz
tar zxvf redis-5.0.5.tar.gz
cd redis-5.0.5
make
make install
