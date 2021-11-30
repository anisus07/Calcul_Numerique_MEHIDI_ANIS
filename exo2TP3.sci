function [x] = usolve(U,b)
    n = size(U,1);
    x = zeros(n);
    x(n)=b(n)/U(n,n);
    for i = n-1:-1:1
        x(i) = (b(i) - U(i, (i + 1):n) * x((i + 1):n)) / U(i, i);
    end
endfunction


function [x] = lsolve(L,b)
    n = size(L,1);
    x = zeros(n);
    x(1) = b(1) / L(1, 1);
    for i = 2:n
        x(i) = (b(i) - (L(i, 1:(i - 1)) * x(1:(i - 1)))) / L(i, i);
    end
endfunction



U_err = zeros(10);
U_relres = zeros(10);

L_err = zeros(10);
L_relres = zeros(10);


d = [10:10:100];


for n = d

        i = n / 10;
	
	
	A = rand(n, n);
	U = triu(A);
	L = tril(A);
	xex = rand(1,n);
	xex=xex';
	b = U * xex;

	
	x = usolve(U, b);
	
	
	U_err(i)=norm(xex-x)/norm(xex);
    U_relres(i)=norm(b-U*x)/(norm(U)*norm(x))

	b1 = L * xex;
	x1 = lsolve(L, b1);
	
	
	L_err(i)=norm(xex-x1)/norm(xex);
    L_relres(i)=norm(b1-U*x1)/(norm(L)*norm(x1))

end

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
