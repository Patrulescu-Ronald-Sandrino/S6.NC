clc


n = 10;
A = 5 * eye(n) - diag(ones(n - 1, 1), 1)...
                        - diag(ones(n - 1, 1), -1)...
                        - diag(ones(n - 3, 1), 3)...
                        - diag(ones(n - 3, 1), -3);
b = [ 3 2 2 ones(1, n - 6) 2 2 3 ]';
x0 = zeros(size(b));
eps = 0.001; 
maxn = 50;

fprintf('\n')
fprintf('Jacobi\n')
[x, nit] = Jacobi(A, b, x0, eps, maxn) # nit = 20

fprintf('\n')
fprintf('GaussSeidel\n')
[x, nit] = GaussSeidel(A, b, x0, eps, maxn) # nit = 11

fprintf('\n')
fprintf('SOR\n')
[x, nit] = SOR(A, b, x0, eps, maxn) # nit = 9
