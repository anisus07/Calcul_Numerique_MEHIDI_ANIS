
function [C]=matmat1b(A,B)
    m=size(A,1)
    n=size(B,2)
    C=zeros(m,n)
    for i = 1 : m
        C(i, :) = A(i, :)*B + C(i, :);
    end
endfunction

/*
-->exec('/home/anism/Calcul_Numerique_MEHIDI_ANIS/exo8TP2.sci', -1)
-->A=rand(3,3)
 A  = 

   0.2856014   0.7313265   0.2104982
   0.7944397   0.8246056   0.2595595
   0.0096533   0.4057227   0.6369598

-->B=rand(3,3)
 B  = 

   0.4603135   0.7953297   0.0928451
   0.0717348   0.3802067   0.6888406
   0.0498066   0.6670473   0.1981987

-->[C]=matmat1b(A,B)
 C  = 

   0.1944119   0.6456148   0.5720045
   0.437772    1.1185006   0.693226 
   0.0652728   0.5868185   0.4066192

*/
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

/*
-->[C]=matmat2b(A,B)
 C  = 

   0.1944119   0.6456148   0.5720045
   0.437772    1.1185006   0.693226 
   0.0652728   0.5868185   0.4066192


*/
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

/*
-->[C]=matmat3b(A,B)
 C  = 

   0.1944119   0.6456148   0.5720045
   0.437772    1.1185006   0.693226 
   0.0652728   0.5868185   0.4066192

*/

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
