sudo apt install cmake gcc ninja-build libssl-dev python3-pytest python3-pytest-xdist unzip xsltproc doxygen graphviz

rm -rf build
mkdir build
cd build
cmake -DBUILD_SHARED_LIBS=ON -GNinja ..
ninja