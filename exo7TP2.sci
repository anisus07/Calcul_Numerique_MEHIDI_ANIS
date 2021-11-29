//Pour le cas N=3

//Matrice A de taille 3*3 en utilisant la fonction rand()

A=rand(3,3)

    /*Result:
    A  = 

   0.2113249   0.3303271   0.8497452
   0.7560439   0.6653811   0.685731 
   0.0002211   0.6283918   0.8782165*/


//Vecteur xex avec la fonction rand()
/*Entrée*/
xex=rand(1:3)

    /*Result:
     xex  = 

   0.068374   0.5608486   0.6623569*/

    //Vérification que x est un vecteur colonne
    xex=xex'
    /*Result:
    xex  = 

   0.068374 
   0.5608486
   0.6623569*/


//b=A*xex
/*Entrée:*/
b=A*xex
    /*Result:
     b  = 

   0.7625473
   0.8790705
   0.9341406
*/

//Résolution du système Ax=b avec la fonction "\"
// On a : Ax=b du coup x=A\b ou x=inv(A)*b
/*Entrée:*/
x=A\b

    /*Result:
    x  = 

   0.068374 
   0.5608486
   0.6623569*/


//Calcul de l'erreur avant
err=norm(xex-x)/norm(xex)
    /*Result:
    err  = 

   5.640D-16*/

//Calcul de l'erreur arrière

r = b - A * x
    /*Result:
    r  = 

  -1.110D-16
   0.       
  -2.220D-16*/

relres=norm(r)/(norm(A)*norm(x))

   /* Result:
    relres  = 

   1.604D-16*/


//L'erreur avant est inferieure a l'erreur arrière



//Pour le cas n=100
/*err  = 

   1.218D-12

 relres  = 

   3.573D-16
*/

//Pour le cas n=1000
/*err  = 

   9.564D-13

relres  = 

   1.739D-15
*/

//Pour le cas n=10000
//Mon pc ne supporte pas cet entier, saturation
//Il prend tellement du temps pour executer pour cet entier
