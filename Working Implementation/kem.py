import oqs

algs = oqs.get_supported_KEM_mechanisms()

print (algs)

def generate(algorithm):
    kem = oqs.KeyEncapsulation(algorithm)
    public_key = kem.generate_keypair()
    ciphertext, shared_secret_server = kem.encap_secret(public_key)
    shared_secret_client = kem.decap_secret(ciphertext)
    assert shared_secret_client == shared_secret_server


userAlg = input("Choose PQ algorithm: ")
generate(userAlg)

