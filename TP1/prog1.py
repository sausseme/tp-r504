print("Hello, World !") 

import fonctions as f

while True:
	a = int(input("Entrez un nombre pour a: "))
	b = int(input("Entrez un nombre pour b: "))
	res = f.puissance(a, b)
	print(f'{a}^{b} = {res}')
