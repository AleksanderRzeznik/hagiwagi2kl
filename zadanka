#---------------------------------------------------------------------
# def zamiana(f):
#    wynik = f * (9/5) + 32
#    return(wynik)
#---------------------------------------------------------------------
# def check(A):
# 	if A % 2 == 0:
# 		return("Liczba jest parzysta.")
# 	else:
# 		return("Liczba jest nieparzysta.")
# print(check(69))
#---------------------------------------------------------------------
# def witaj(imie = "użydkowniku", zwrot = "cześć"):
# 	imie = input("podaj swoje pełne imię: ").strip()

# 	zwroty = {
#         "kobieta": "Szanowna Pani",
#         "mezczyzn": "Szanowny Panie",
#         "domyslny": "Dzień dobry"}
# 	if imie.lower().endswith('a'):
# 		zwrot = zwroty["kobieta"]
# 	else:
# 		zwrot = zwroty["mezczyzn"]
# 	print(f"{zwrot}, {imie}!")
# witaj()
#---------------------------------------------------------------------
# def listy(liczby):

# 		minimum = min(liczby)
# 		maximum = max(liczby)
# 		return(minimum, maximum)
# list = [5, 2, 0, 1, 3, 4]
# wynik = listy(liczbyz)
# print(wynik)
#---------------------------------------------------------------------
# def samogłoki(zdanie):
# 	samogliski = set("aeiouy")
# 	return sum(1 for znak in zdanie.lower() if znak in samogliski)
# print("siabadaba")
#---------------------------------------------------------------------
# def pali(s):
# 	czyste_słowo = s.strip().lower()
# 	odwrot = czyste_słowo[::-1]
# 	if odwrot == czyste_słowo:
# 		return("True")
# 	else:
# 		return("False")
# s = input("wprowadź słowo do sprawdzenia: ")
# print(pali(s))
#---------------------------------------------------------------------
def maska(słowo):
	if len(słowo) <= 4:
		return "*" * len(słowo)
	return[0] + ("*" * (len(słowo) - 4)) + słowo[-4]

słowo = input("podaj ciąg znaków do maskowania: ")
print(maska(słowo))
