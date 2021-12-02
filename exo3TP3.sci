function [x] = gausskij3b(A,b)
    n = size ( A, 1);
    for k = 1:n-1
        for i = k+1:n
            mik = A(i, k)/A(k,k);
            b(i) = b(i) - mik * b(k);
            for j = k+1:n
               A(i, j) = A(i, j) - mik * A(k, j); 
            end
        end
    end
    x = usolve ( A, b);
endfunction
/*
-->exec('/home/anism/Calcul_Numerique_MEHIDI_ANIS/exo3TP3.sci', -1)
-->A=rand(3,3)
 A  = 

   0.8848626   0.9719066   0.3254943
   0.1298833   0.7557464   0.0473828
   0.6069005   0.3962994   0.9315186

-->b=rand(1,3)
 b  = 

   0.448656   0.9650566   0.0132304

-->[x] = gausskij3b(A,b)
 x  = 

  -1.1569892
   1.4667721
   0.1439872
*/
err = zeros(10);
relres = zeros(10);
d = [10:10:100];

for n = d
    i = n / 10;
	A = rand(n, n);
	xex = rand(1,n);
	xex=xex';
	b = A * xex;
	x = gausskij3b(A,b);
	
	err(i)=norm(xex-x)/norm(xex);
    relres(i)=norm(b-A*x)/(norm(A)*norm(x))
end

xtitle("Gauss", "taille des matrices", "erreur");
plot(d, [log(err) log(relres)]);
legend(["Erreur avant" "Erreur arrière"], 2);
xs2png(0, "./graphe/err_gauss.png");
clf();
    
