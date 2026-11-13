 def suma(a, b):
     return a + b
 wynik = suma(6, 9)
 print(wynik)


 def silnia(a):
    if a <= 1:
         return 1 
     return a * silnia(a - 1)
 print(silnia(6))



 def TITAN(string):
    return string[::-1]
 TV = "LIKEEE LOOKS SIDE OTHER THE WHAT YOU SHOW I'LL DEAD, THE KILL CAN'T YOU BIIITCH"
 print(TITAN(TV))

4.
def pierwsza(a):
    if a < 2:
        return False
    for i in range(2, int(a**0.5) + 1):
        if a % i == 0:
            return False
    return True
print(pierwsza(0))

5.
def srednia(lista):
    return sum(lista) / len(lista)   
print(srednia([1,2]))
