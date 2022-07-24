

rm -rf Message_lengths.o

# -g for debugging
g++ -g -o Message_lengths.o Message_lengths.cpp -L../build/lib -loqs

LD_LIBRARY_PATH=/usr/local/lib
export LD_LIBRARY_PATH
