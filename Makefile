# THESE SHOULD BE THE ONLY OPTIONS TO BE CONFIGURED BY THE PERSON COMPILING

KEMS_TO_ENABLE=dummy1 dummy2 \
	frodokem_640_aes frodokem_976_aes frodokem_640_cshake frodokem_976_cshake \
	newhope_512_cca_kem newhope_1024_cca_kem # EDIT-WHEN-ADDING-KEM
KEM_DEFAULT=dummy1

ARCH=x64
# x64 OR x86 OR ARM

CC=gcc
OPENSSL_INCLUDE_DIR=/usr/local/opt/openssl/include
OPENSSL_LIB_DIR=/usr/local/opt/openssl/lib
CFLAGS=
LDFLAGS=

# NOTHING AFTER THIS SHOULD NEED TO BE CHANGED BY THE PERSON COMPILING

ENABLE_KEMS= # THIS WILL BE FILLED IN BY INDIVIDUAL KEMS' MAKEFILES IN COMBINATION WITH THE ARCHITECTURE

CFLAGS+=-O3 -std=c11 -Iinclude -I$(OPENSSL_INCLUDE_DIR) -Wno-unused-function -Werror -Wpedantic -Wall -Wextra
LDFLAGS+=-L$(OPENSSL_LIB_DIR) -lcrypto

all: mkdirs headers liboqs tests examples

OBJECT_DIRS=

include src/common/Makefile
include src/kem/Makefile

HEADERS=src/oqs.h $(HEADERS_COMMON) $(HEADERS_KEM)
OBJECTS=$(OBJECTS_COMMON) $(OBJECTS_KEM)
ARCHIVES=$(ARCHIVES_KEM)

mkdirs:
	mkdir -p $(OBJECT_DIRS)

DATE=`date`
UNAME=`uname -a`
CC_VERSION=`$(CC) --version | tr '\n' ' '`
config_h:
	$(RM) -r src/config.h
	touch src/config.h
	$(foreach ENABLE_KEM, $(ENABLE_KEMS), echo "#define OQS_ENABLE_KEM_$(ENABLE_KEM)" >> src/config.h;)
	echo "#define OQS_KEM_DEFAULT OQS_KEM_alg_$(KEM_DEFAULT)" >> src/config.h
	echo "#define OQS_COMPILE_DATE \"$(DATE)\"" >> src/config.h
	echo "#define OQS_COMPILE_CC \"$(CC)\"" >> src/config.h
	echo "#define OQS_COMPILE_CC_VERSION \"$(CC_VERSION)\"" >> src/config.h
	echo "#define OQS_COMPILE_CFLAGS \"$(CFLAGS)\"" >> src/config.h
	echo "#define OQS_COMPILE_LDFLAGS \"$(LDFLAGS)\"" >> src/config.h
	echo "#define OQS_COMPILE_ENABLE_KEMS \"$(ENABLE_KEMS)\"" >> src/config.h
	echo "#define OQS_COMPILE_KEM_DEFAULT \"$(KEM_DEFAULT)\"" >> src/config.h
	echo "#define OQS_COMPILE_UNAME \"$(UNAME)\"" >> src/config.h


headers: config_h $(HEADERS)
	$(RM) -r include
	mkdir -p include/oqs
	cp $(HEADERS) src/config.h include/oqs

liboqs: $(OBJECTS) $(ARCHIVES)
	$(RM) liboqs_tmp.a liboqs.a
	ar -r -c liboqs_tmp.a $(OBJECTS)
	libtool -static -o liboqs.a liboqs_tmp.a $(ARCHIVES)
	$(RM) liboqs_tmp.a

TEST_PROGRAMS=test_kem
tests: $(TEST_PROGRAMS)

test: tests
	./test_kem

EXAMPLE_PROGRAMS=example_kem
examples: $(EXAMPLE_PROGRAMS)

clean:
	$(RM) -r includes
	$(RM) -r .objs
	$(RM) liboqs.a
	$(RM) $(TEST_PROGRAMS)
	$(RM) $(EXAMPLE_PROGRAMS)

check_namespacing: liboqs
	nm -g liboqs.a | grep ' T ' | grep -v ' _OQS'; test $$? -eq 1
	nm -g liboqs.a | grep ' D ' | grep -v ' _OQS'; test $$? -eq 1