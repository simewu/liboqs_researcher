import oqs

##public = bytearray()

##def gen_dili2_private_key(dil2):
##    alg = oqs.Signature(dil2)
##    public = alg.generate_keypair()
##    pKey = alg.export_secret_key()
    
##    return pKey

##gen_dili2_private_key("DILITHIUM_2")
##print (public)

##def gen_dili2_public_key(public)

##    return public


# A Python program to return multiple  
# values from a method using class 
class Test: 
    def __init__(self): 
        self.str = "geeksforgeeks"
        self.x = 20  
  
# This function returns an object of Test 
def fun(): 
    return Test() 
      
# Driver code to test above method 
t = fun()  
print(t.str) 
print(t.x) 