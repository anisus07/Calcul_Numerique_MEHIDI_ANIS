function [x] = usolve(U,b)
    n = size(U,1);
    x = zeros(n);
    x(n)=b(n)/U(n,n);
    for i = n-1:-1:1
        x(i) = (b(i) - U(i, (i + 1):n) * x((i + 1):n)) / U(i, i);
    end
endfunction
/*
-->exec('/home/anism/Calcul_Numerique_MEHIDI_ANIS/exo2TP3.sci', -1)
-->U=rand(3,3)
 U  = 

   0.484429    0.6884607   0.2177375
   0.8729401   0.2768005   0.8299133
   0.9237457   0.1984019   0.5626359

-->b=rand(1,3)
 b  = 

   0.5866055   0.9894153   0.6332789

-->[x] = usolve(U,b)
 x  = 

   0.4210852
   0.1997842
   1.1255574

*/


function [x] = lsolve(L,b)
    n = size(L,1);
    x = zeros(n);
    x(1) = b(1) / L(1, 1);
    for i = 2:n
        x(i) = (b(i) - (L(i, 1:(i - 1)) * x(1:(i - 1)))) / L(i, i);
    end
endfunction
/*
-->L=rand(3,3)
 L  = 

   0.2915253   0.2534683   0.5361702
   0.7407287   0.5669515   0.3215196
   0.6280628   0.0225112   0.9757575

-->[x] = lsolve(L,b)
 x  = 

   2.0121941
  -0.8838051
  -0.6257804

*/

U_err = zeros(10);
U_relres = zeros(10);

L_err = zeros(10);
L_relres = zeros(10);
t1 = zeros(10);
t2 = zeros(10);


d = [10:10:100];


for n = d

        i = n / 10;
	
	//Pour tester l'algorithme Usolve
	A = rand(n, n);
	U = triu(A);
	L = tril(A);
	xex = rand(1,n);
	xex=xex';
	b = U * xex;

	
	x = usolve(U, b);
	
	
	U_err(i)=norm(xex-x)/norm(xex);
    U_relres(i)=norm(b-U*x)/(norm(U)*norm(x))
     //Pour tester l'algorithme Lsolve
	b1 = L * xex;
	x1 = lsolve(L, b1);
	
	
	L_err(i)=norm(xex-x1)/norm(xex);
    L_relres(i)=norm(b1-U*x1)/(norm(L)*norm(x1))
    //Pour valider l'algorithme de Usolve
    tic;
        [x1] = usolve(U,b)
        t1(i) = toc();
        
    //Pour valider l'algorithme de Lsolve
    tic;
        [x2] = lsolve(L,b)
        t2(i) = toc();
end
//Les graphes pour le test des algorithmes
xtitle("Usolve", "taille des matrices", "erreur");
plot(d, [log(U_err) log(U_relres)]);
legend(["Erreur avant" "Erreur arrière"], 2);
xs2png(0, "./graphe/err_usolve.png");
clf();

xtitle("Lsolve", "taille des matrices", "erreur");
plot(d, [log(L_err) log(L_relres)]);
legend(["Erreur avant" "Erreur arrière"], 2);
xs2png(0, "./graphe/err_lsolve.png");
clf();

//Les graphes pour la validation des algorithmes
xtitle("Usolve", "taille des matrices", "time");
plot(d, [t1]);
legend(["usolve"], 2);
xs2png(0, "./graphe/tictocs_usolve.png");
clf();  

xtitle("Lsolve", "taille des matrices", "time");
plot(d, [t2]);
legend(["lsolve"], 2);
xs2png(0, "./graphe/tictoc_lsolve.png");
clf(); 
