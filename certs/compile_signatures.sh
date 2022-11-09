rm -rf Signatures_ci.o

# -g for debugging
g++ -g -o Signatures_ci.o Signatures_ci.cpp -L../build/lib -loqs

LD_LIBRARY_PATH=/usr/local/lib
export LD_LIBRARY_PATH

./Signatures_ci.o