import oqs
import timeit

algs = oqs.get_supported_KEM_mechanisms()
algLen = len(algs)

def test (algorithm):
    kem = oqs.KeyEncapsulation(algorithm)
    startTime = timeit.timeit()
    for i in range (100):
        public_key = kem.generate_keypair()
    endTime = timeit.timeit()

    print ("Time taken to generate 100 public keys:")
    print (endTime-startTime)
    print ("Time taken for 1:")
    print ((endTime-startTime)/100)

    ciphertext, shared_secret_server = kem.encap_secret(public_key)

    startTime = timeit.timeit()
    for j in range (100):
        shared_secret_client = kem.decap_secret(ciphertext)
    endTime = timeit.timeit()

    print ("Time taken to decap 100 messages")
    print (endTime-startTime)
    print ("Time taken to decap 1:")
    print ((endTime-startTime)/100)

for i in range(1,algLen):
    print (algs[i])
    test(algs[i])