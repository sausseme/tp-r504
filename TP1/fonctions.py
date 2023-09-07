def puissance(a, b):
    resultat = a ** b
    return resultat
a = int(input("Entrez un nombre pour a: "))
b = int(input("Entrez un nombre pour b: "))

	if not type(a, b) is int:
		raise TypeError("Only integers are allowed")
	return a**b
resultat = puissance(a, b)
print(f"{a}^{b} = {resultat}")

	
