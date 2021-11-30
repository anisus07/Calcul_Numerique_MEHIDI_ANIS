// Exercice 8: Produit Matrice-Matrice

//Question 1:
function [C]=matmat1b(A,B)
    m=size(A,1)
    n=size(B,2)
    C=zeros(m,n)
    for i = 1 : m
        C(i, :) = A(i, :)*B + C(i, :);
    end
endfunction
function [C]=matmat2b(A,B)
    m=size(A,1)
    n=size(B,2)
    C=zeros(m,n)
    for i = 1 : m
        for j = 1 : n
            C(i, j) = A(i, :)*B(:, j) + C(i, j);
        end
    end
endfunction
function [C]=matmat3b(A,B)
    m=size(A,1)
    n=size(B,2)
    p=size(B,1)
    C=zeros(m,n)
    for i = 1 : m
        for j = 1 : n
            for k = 1 : p
                C(i, j) = A(i, k )*B(k , j) + C(i, j);
            end
        end
    end
endfunction



t3 = zeros(10);
t2 = zeros(10);
t1 = zeros(10);
d = [10:10:100];
    for n = d
    
        i = n / 10;
    
        // Init matrix
        A = rand(n, n);
        B = rand(n, n);
        disp(A);
        disp(B);
    // 
        tic;
        [C3] = matmat3b(A, B);
        t3(i) = toc();
        tic;
        [C2] = matmat2b(A, B);
        t2(i) = toc();
        tic;
        [C1] = matmat1b(A, B);
        t1(i) = toc();
    end

   xtitle("matmat3b", "n", "time");
plot(d, [t3]);
legend(["matmat3b"], 2);
xs2png(0, "./graphe/matmatb3.png");
clf();


 xtitle("matmat2b", "n", "time");
plot(d, [t2]);
legend(["matmat2b"], 2);
xs2png(0, "./graphe/matmatb2.png");
clf();

xtitle("matmat1b", "n", "time");
plot(d, [t1]);
legend(["matmat1b"], 2);
xs2png(0, "./graphe/matmatb1.png");
clf();
