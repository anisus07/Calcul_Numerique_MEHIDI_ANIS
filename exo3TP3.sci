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
    
