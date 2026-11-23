import sqlite3

conn = sqlite3.connect('biblioteka.db') 

cursor = conn.cursor()

def stworz_tabele():
	cursor.execute('''
    	CREATE TABLE IF NOT EXISTS ksiazki (
        	id_ksiazki INTEGER PRIMARY KEY,
        	tytul TEXT,
        	autor TEXT,
        	rok_wydania INTEGER
	    )
	''')
stworz_tabele()

def dod():
    tytul = input("Podaj tytuł książki: ")
    autor = input("Podaj autora książki: ")
    wydanie = int(input("Podaj rok wydania książki: "))

    cursor.execute('''
    INSERT INTO ksiazki (tytul, autor, rok_wydania) VALUES (?, ?, ?)
	''', (tytul, autor, wydanie))
    
    conn.commit()
    
def dele():
    ksiazka = int(input("Podaj id książki: "))

    cursor.execute('''
    DELETE FROM ksiazki WHERE id_ksiazki = ?
	''', (ksiazka,))
    
    conn.commit()
    
def see():

    cursor.execute('SELECT * FROM ksiazki')
    rows = cursor.fetchall()

    for row in rows:
        print(row) 


def akt():
    tytul = input("Podaj tytuł książki: ")
    id = int(input("Podaj id do zmienienia: "))

    cursor.execute('''
    UPDATE ksiazki SET tytul = ? WHERE id_ksiazki = ?
''', (tytul, id))
    
    conn.commit()   


def menu():
    while True:
        print("\n=-=-=-=-=-=-=-=-=- BIBLIOTEKA -=-=-=-=-=-=-=-=-=")
        print("1. Dodaj nową książkę")
        print("2. Usuń książke")
        print("3. Wyświetl wszystkie książki")
        print("4. Zaktualizuj książkę")
        print("5. Zakończ program")

        wybor = input("\nWybierz opcję: ")

        if wybor == "1":
            dod()
        elif wybor == "2":
            dele()
        elif wybor == "3":
            see()
        elif wybor == "4":
            akt()
        elif wybor == "5":
            print("Dziękujemy za skorzystanie z naszej biblioteki!")
            break
        else:
            print("Nie ma takiej opcji!")


menu()
