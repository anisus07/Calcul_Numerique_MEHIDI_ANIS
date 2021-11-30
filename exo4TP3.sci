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



err = zeros(10);
relres = zeros(10);
d = [10:10:100];

for n = d
    i = n / 10;
	A = rand(n, n);
	xex = rand(1,n);
	xex=xex';
	b = A * xex;
	x = mylu3b(A);
	
	err(i)=norm(xex-x)/norm(xex);
   
end

xtitle("LU", "taille des matrices", "erreur");
plot(d, [log(err) ]);
legend(["Erreur avant"], 2);
xs2png(0, "./graphe/err_lu.png");
clf();
    
