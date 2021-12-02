
function [L,U] = mylu3b(A)
    n = size ( A, 1);
    for k = 1:n-1
       for i = k+1:n
           A(i,k) = A(i,k)/A(k,k);
       end
       for i = k+1:n
           for j = k+1:n
               A(i,j) = A(i,j) - A(i,k)*A(k,j);
           end
       end
    end
    L = usolve ( A, b);
    U = usolve ( A, b);
    disp(A);

endfunction
/*
-->exec('/home/anism/Calcul_Numerique_MEHIDI_ANIS/lsolve.sci', -1)

-->exec('/home/anism/Calcul_Numerique_MEHIDI_ANIS/usolve.sci', -1)

-->exec('/home/anism/Calcul_Numerique_MEHIDI_ANIS/exo4TP3.sci', -1)
-->A=rand(3,3)
 A  = 

   0.2113249   0.3303271   0.8497452
   0.7560439   0.6653811   0.685731 
   0.0002211   0.6283918   0.8782165

-->b=rand(1,3)
 b  = 

   0.068374   0.5608486   0.6623569
-->[L,U] = mylu3b(A)

   0.2113249   0.3303271   0.8497452
   3.5776379  -0.5164096  -2.3543498
   0.0010464  -1.2161782  -1.9859815
 L  = 

   0.9854979
   0.4344711
  -0.3335162
 U  = 

   0.9854979
   0.4344711
  -0.3335162
*/

err = zeros(10);
relres = zeros(10);
t=zeros(10);
d = [10:10:100];

for n = d
    i = n / 10;
    //Pour tester l'algorithme
	A = rand(n, n);
	xex = rand(1,n);
	xex=xex';
	b = A * xex;
	x = mylu3b(A);
	
	err(i)=norm(xex-x)/norm(xex);
   //Pour valider l'algorithme
   tic;
        [x] = mylu3b(A);
        t(i) = toc();
end
//Graphe pour le test de l'algorithme
xtitle("LU", "taille des matrices", "erreur");
plot(d, [log(err) ]);
legend(["Erreur avant"], 2);
xs2png(0, "./graphe/err_lu.png");
clf();

//Graphe pour la validation de l'algorithme
xtitle("LU", "taille des matrices", "time");
plot(d, [t]);
legend(["mylu3b"], 2);
xs2png(0, "./graphe/tictoc_mylu3b.png");
clf();    
       

function [L,U] = mylu1b(A)
    n = size ( A, 1);
    for k = 1:n-1    
       A(k+1:n,k) = A(k+1:n,k)/A(k,k);
       A(k+1:n,k+1:n) = A(k+1:n,k+1:n) - A(k+1:n,k)*A(k,k+1:n);
    end
    L = usolve ( A, b);
    U = usolve ( A, b);
    disp(A);

endfunction
/*
-->[L,U] = mylu1b(A)

   0.2113249   0.3303271   0.8497452
   3.5776379  -0.5164096  -2.3543498
   0.0010464  -1.2161782  -1.9859815
 L  = 

   0.9854979
   0.4344711
  -0.3335162
 U  = 

   0.9854979
   0.4344711
  -0.3335162
*/
