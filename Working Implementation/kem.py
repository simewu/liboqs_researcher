import oqs

algs = oqs.get_supported_KEM_mechanisms()

print (algs)

def generate(algorithm):
    kem = oqs.KeyEncapsulation(algorithm)
    public_key = kem.generate_keypair()
    print ("Generated pub key")
    ciphertext, shared_secret_server = kem.encap_secret(public_key)
    print ("Set cipher text ")
    shared_secret_client = kem.decap_secret(ciphertext)
    if shared_secret_client == shared_secret_server:
        print ("In true")
        return True
    else:
        print ("In false")
        return False


userAlg = input("Choose PQ algorithm: ")
generate(userAlg)

