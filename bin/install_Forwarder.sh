yum update -y &&
yum install -y \
    which-2.20 \
    librabbitmq-0.8.0 \
    librabbitmq-devel-0.8.0 \
    libcurl-7.29.0 \
    libcurl-devel-7.29.0

#==============================================================================
#           Install C++ libraries
#==============================================================================
mkdir -p $IIP_TMP_DIR

# url, folder
cmake_install() { 
    cd $IIP_TMP_DIR
    curl -L $1 -o $2.tar.gz
    tar zxvf $2.tar.gz
    cd $2
    mkdir build && cd build
    cmake ..
    cmake --build . --target install
}

# url, folder
make_install() { 
    cd $IIP_TMP_DIR
    curl -L $1 -o $2.tar.gz
    tar zxvf $2.tar.gz
    cd $2
    make
    make install
}

# boost
cd $IIP_TMP_DIR
curl -L $IIP_PACKAGE_REPO/boost/boost_1_66_0.tar.gz -O
tar zxvf boost_1_66_0.tar.gz
cd boost_1_66_0
./bootstrap.sh
./b2 --with-test --with-log install

# C++ libraries
cmake_install "$IIP_PACKAGE_REPO/yaml-cpp/yaml-cpp-0.5.3.tar.gz" "yaml-cpp-yaml-cpp-0.5.3"
cmake_install "$IIP_PACKAGE_REPO/SimpleAmqpClient/SimpleAmqpClient-2.4.0.tar.gz" "SimpleAmqpClient-2.4.0"
cmake_install "$IIP_PACKAGE_REPO/cfitsio/cfitsio-3.450.tar.gz" "cfitsio"
make_install "$IIP_PACKAGE_REPO/hiredis/hiredis-0.14.0.tar.gz" "hiredis-0.14.0"
