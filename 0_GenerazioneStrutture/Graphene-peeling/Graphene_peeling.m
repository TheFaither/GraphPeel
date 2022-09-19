clear; 
clc; 

a = 1.42;
c = 3.34; 
Ty = 3*a; 
Tx = (sqrt(3)*a); 
Tz = c; 

disp('Graphene')
disp('---------------------------------------')
prompt = 'Width of the sheet (Angrstom): ';
xi = 0.0; 
nnx = input(prompt)/(sqrt(3)*a);
nx = int8(nnx);
xtot = double(nx)*sqrt(3)*a - sqrt(3)*a/2;
%%
prompt2 = 'Length of the sheet (Angrstom): ';
yi = 0.0; 
nny = input(prompt2)/(3*a);
ny = int8(nny);
ytot = double(ny)*3*a;


prompt3 = 'Number of sheets: '; 
nz = input(prompt3); 
ztot = nz*Tz;

 zi = 0.0; 

AA = [0, 0, 0]; 
BB = [sqrt(3)*a/2,a/2 , 0]; 
CC = [ sqrt(3)*a/2, 3*a/2 , 0]; 
DD = [0, 2*a, 0]; 
boxZ = 20.0; 
boxX = 5.0;
fileID = fopen('structure', 'w'); 
Ntot = 4*double(nx)*double(ny)*double(nz); 

fprintf(fileID, '\n %d atoms \n', Ntot); 
fprintf(fileID, ' %d atom types \n',nz+1); 
fprintf(fileID, '%f \t %f \t xlo xhi\n', xi-boxX, xtot+boxX); 
fprintf(fileID, '%f \t %f \t ylo yhi\n', yi, ytot); 
fprintf(fileID, '%f \t %f \t zlo zhi\n', zi-boxX, ztot+boxZ); 
fprintf(fileID, '\n Masses \n\n');
for i = 1:nz+1
fprintf(fileID, '%d \t 12.0107\n', i); 
end
fprintf(fileID, '\n Atoms\n\n'); 

N = 1; 

k = 1.0;
type = 1; 
while(k <= nz)
    
    type = k; 
    checkL = mod(k,2);
    
    if(checkL == 0) % per fare il piano di tipo A o B
        in = a; 
    else
        in = 0.0; 
    end
    
    i = 1.0;
    while (i <= nx)       
     
        j = 1.0; 
        while(j <= ny)
        typeA = type; 
        typeB = type; 
        typeC = type; 
        typeD = type; 
        
        A = [AA(1)+ (i-1)*Tx, AA(2)+(j-1)*Ty + in, AA(3)+Tz*(k-1)]; 
        B = [BB(1)+ (i-1)*Tx, BB(2)+(j-1)*Ty + in, BB(3)+Tz*(k-1)];
        C = [CC(1)+ (i-1)*Tx, CC(2)+(j-1)*Ty + in, CC(3)+Tz*(k-1)];
        D = [DD(1)+ (i-1)*Tx, DD(2)+(j-1)*Ty + in, DD(3)+Tz*(k-1)];
        
        if((abs(A(1)- xtot/2)< 3*a)&& (k ==nz ))
        typeA = nz + 1;
        end
        if((abs(B(1)- xtot/2)< 3*a)&& (k==nz))
        typeB = nz + 1;
        end
        if((abs(C(1)- xtot/2)< 3*a) && (k ==nz ))
        typeC = nz + 1;
        end
        if((abs(D(1)- xtot/2)< 3*a) && (k ==nz))
        typeD = nz + 1;
        end  
        fprintf(fileID, '%d \t %d \t%f \t %f \t %f\n', N, typeA,  A(1), A(2), A(3));  
        N = N +1; 
        fprintf(fileID, '%d \t %d \t%f \t %f \t %f \n', N, typeB, B(1), B(2), B(3)); 
        N = N +1; 
         fprintf(fileID, '%d \t %d \t%f \t %f \t %f \n', N, typeC, C(1), C(2), C(3)); 
        N = N +1; 
        fprintf(fileID, '%d \t %d \t%f \t %f \t %f \n', N, typeD, D(1), D(2), D(3)); 
        N = N +1; 
        
        j = j + 1.0; 
        end
        
        i = i + 1.0; 
    end
    k = k+ 1.0; 
end
disp('------------------------------------------'); 
disp('file generated')
fprintf('\n Number of atoms = %d\n \n', N-1); 
