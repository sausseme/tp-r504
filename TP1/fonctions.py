def puissance(a, b):
    if a < 0 and b == 0:
        return -1
        
    if a == 0 and b < 0:
        return "ERREUR math ! Retentez un autre calcul !"
        
    elif b == 0:
        return 1
    
    else:
        resultat = 1
        for i in range(abs(b)):
            resultat *= a
        if b < 0:
            return 1 / resultat
        else:
            return resultat

