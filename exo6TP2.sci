//Vecteur X à 1 ligne et 4 colonnes
x=[1,2,3,4]
 /*   Result:
    x  = 

   1.   2.   3.   4.*/

//Vecteur Y à 4 lignes et 1 colonnes
y=[1;2;3;4]
  /*  Result:
    y  = 

   1.
   2.
   3.
   4. */
//La somme et le produit

    /*Données:*/
    x=[1,2,3,4]
    y=[4,5,6,7]
z=x+y    
    /*Result:
    z  = 

   5.   7.   9.   11.*/


   /* Données:*/
    x=[1,2,3,4]
    y=[1;2;3;4]

s=x*y
    /*Result:
    s  = 

   30.*/


//La taille des vecteurs
size(x)
   /* Données:
    x=[1,2,3,4]*/
    
   /* Result:
    ans  =

   1.   4.*/

size(y)
    /*Données:
    y=[1;2;3;4]*/
   /* Result:
    ans  =

   4.   1.*/

//Norme 2 de x
norm(x)
    /*Données:
     x=[1,2,3,4]*/
    /*Result:
    ans  =

   5.4772256*/


//Matrice A
/*Entrée*/
A=[1,2,3;4,5,6;7,8,9;10,11,12]

   /* Result:
    A  = 

   1.    2.    3. 
   4.    5.    6. 
   7.    8.    9. 
   10.   11.   12.
*/

//Transposée de A
A'
    /*Entrée
    A=[1,2,3;4,5,6;7,8,9;10,11,12]
    */
    /*Result:
    ans  =

   1.   4.   7.   10.
   2.   5.   8.   11.
   3.   6.   9.   12.*/

//Les opérations de bases avec deux matrices carrées A et B

A=[1,2,3;4,5,6;7,8,9]
B=[10,11,12;13,14,15;16,17,18]

A+B
   /* Result:
    ans  =

   11.   13.   15.
   17.   19.   21.
   23.   25.   27.*/

A-B
    /*Result:
    -9.  -9.  -9.
    -9.  -9.  -9.
    -9.  -9.  -9.*/

A*B
    /*Result:
    ans  =

   84.    90.    96. 
   201.   216.   231.
   318.   342.   366.*/


//Conditionnement de la Mat A
cond(A)   
 /*Entrée:
    A=[1,2,3;4,5,6;7,8,9]*/
    /*Result:
    ans  =

   3.813D+16*/
