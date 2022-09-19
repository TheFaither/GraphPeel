clear; 
clc; 
a = 1.42;
c = 3.34; 
Ty = 3*a; 
Tx = (sqrt(3)*a); 
Tz = c; 

%------------------- immettere dimensioni della struttura-----------------
% Width of the sheet (Angrstom):
xx = 600.0; 
xi = 0.0; 
nnx = (xx)/(sqrt(3)*a);
nx = int32(nnx);
xtot = double(nx)*sqrt(3)*a - sqrt(3)*a/2;

xx_f = 550.0; 
xi_f = 0.0; 
nnx_f = (xx_f)/(sqrt(3)*a);
nx_f = int32(nnx_f);
xtot_f = double(nx_f)*sqrt(3)*a - sqrt(3)*a/2;

xx_b = 500.0; 
xi_b = 0.0; 
nnx_b = (xx_b)/(sqrt(3)*a);
nx_b = int32(nnx_b);
xtot_b = double(nx_b)*sqrt(3)*a - sqrt(3)*a/2;


% Length of the sheet (Angrstrom): 
yy = 15.0;
yi = 0.0; 
nny = yy/(3*a);
ny = int8(nny);
ytot = double(ny)*3*a;

%'Number of sheets: '; 
nz = 16; 
ztot = nz*Tz;
zi = 0.0; 

AA = [0, 0, 0]; 
BB = [sqrt(3)*a/2,a/2 , 0]; 
CC = [ sqrt(3)*a/2, 3*a/2 , 0]; 
DD = [0, 2*a, 0]; 
boxX = 5.0;
boxZ = 150.0; 

fileID = fopen('structure_t3', 'w'); 
Ntot = 4*double(nx)*double(ny)*double(nz-3) + 4*double(nx_f)*double(ny)+4*2*double(nx_b)*double(ny) ; 
fprintf(fileID, '\n %d atoms \n', Ntot); 
fprintf(fileID, ' %d atom types \n',5); 
fprintf(fileID, '%f \t %f \t xlo xhi\n', xi-boxX, xtot+boxX); 
fprintf(fileID, '%f \t %f \t ylo yhi\n', yi, ytot); 
fprintf(fileID, '%f \t %f \t zlo zhi\n', zi-boxX, ztot+boxZ); 
fprintf(fileID, '\n Masses \n \n');
for i = 1:6
fprintf(fileID, '%d \t 12.0107 \n', i); 
end
fprintf(fileID, '\n  Atoms\n'); 

N = 1; 
k = 1.0;
type = 1; 
% genero il bulk 
while(k < nz-2)
    if(k == 1)
        type = 1; 
    else
        type = 2; 
    end
    
    checkL = mod(k,2);
    if(checkL == 0) %per fare il piano di tipo A o B
        in = a; 
    else
        in = 0.0; 
    end
    i = 1.0;
    
    while (i <= nx)       
        j = 1.0; 
        while(j <= ny)
        typeA = type;  % a tutti viene assegnato 1
        typeB = type; 
        typeC = type; 
        typeD = type; 
        A = [AA(1)+ (i-1)*Tx, AA(2)+(j-1)*Ty + in, AA(3)+Tz*(k-1)]; 
        B = [BB(1)+ (i-1)*Tx, BB(2)+(j-1)*Ty + in, BB(3)+Tz*(k-1)];
        C = [CC(1)+ (i-1)*Tx, CC(2)+(j-1)*Ty + in, CC(3)+Tz*(k-1)];
        D = [DD(1)+ (i-1)*Tx, DD(2)+(j-1)*Ty + in, DD(3)+Tz*(k-1)]; 
       
        
        
        if((abs(A(1)- xtot)< 3*a)|(abs(A(1))< 3*a)) 
        typeA = 1;
        end
        if((abs(B(1)- xtot)< 3*a)|(abs(B(1))< 3*a))
        typeB = 1;
        end
        if((abs(C(1) - xtot)< 3*a)|(abs(C(1))< 3*a))
        typeC = 1;
        end
        if((abs(D(1) - xtot)< 3*a)|(abs(D(1))< 3*a))
        typeD = 1;
        end  
        
        fprintf(fileID, '\n%d \t %d \t%f \t %f \t %f', N, typeA,  A(1), A(2), A(3));  
        N = N +1; 
        fprintf(fileID, '\n%d \t %d \t%f \t %f \t %f', N, typeB, B(1), B(2), B(3)); 
        N = N +1; 
        fprintf(fileID, '\n%d \t %d \t%f \t %f \t %f', N, typeC, C(1), C(2), C(3)); 
        N = N +1; 
        fprintf(fileID, '\n%d \t %d \t%f \t %f \t %f', N, typeD, D(1), D(2), D(3)); 
        N = N +1; 
        j = j + 1.0; 
        end
        i = i + 1.0; 
    end
    k = k+ 1.0; 
end



%genero lo strato da tirare, ha una lunghezza diversa, vario la x

    checkL = mod(k,2);
    if(checkL == 0) %per fare il piano di tipo A o B
        in = a; 
    else
        in = 0.0; 
    end
    i = 1.0;
    type = 3; 
while (i <= nx_f)       
j = 1.0; 
while(j <= ny)
        typeA = type;  % a tutti viene assegnato 1
        typeB = type; 
        typeC = type; 
        typeD = type; 
        A = [AA(1)+ (i-1)*Tx, AA(2)+(j-1)*Ty + in, AA(3)+Tz*(k-1)]; 
        B = [BB(1)+ (i-1)*Tx, BB(2)+(j-1)*Ty + in, BB(3)+Tz*(k-1)];
        C = [CC(1)+ (i-1)*Tx, CC(2)+(j-1)*Ty + in, CC(3)+Tz*(k-1)];
        D = [DD(1)+ (i-1)*Tx, DD(2)+(j-1)*Ty + in, DD(3)+Tz*(k-1)];
        if(abs(A(1))< 3*a) % strato a sinistra bloccato 
        typeA = 1;
        end
        if(abs(B(1))< 3*a)
        typeB = 1;
        end
        if(abs(C(1))< 3*a) 
        typeC = 1;
        end
        if(abs(D(1))< 3*a)
        typeD = 1;
        end
        
        if((A(1) > xtot_b )&&(A(1)< xtot_f)) % parte che si muoverà ora
        typeA = 5;
        end
        if((B(1) > xtot_b )&&(B(1)< xtot_f)) % parte che si muoverà ora
        typeB = 5;
        end
        if((C(1) > xtot_b )&&(C(1)< xtot_f)) % parte che si muoverà ora
        typeC = 5;
        end
        if((A(1) > xtot_b )&&(A(1)< xtot_f)) % parte che si muoverà ora
        typeD = 5;
        end
       
        
        
        if(abs(A(1)- xtot_f)< 3*a) % parte da tirare
        typeA = 4;
        end
        if(abs(B(1)- xtot_f)< 3*a)
        typeB = 4;
        end
        if(abs(C(1)- xtot_f)< 3*a)
        typeC = 4;
        end
        if(abs(D(1)- xtot_f)< 3*a)
        typeD = 4;
        end  
        
        fprintf(fileID, '\n%d \t %d \t%f \t %f \t %f', N, typeA,  A(1), A(2), A(3));  
        N = N +1; 
        fprintf(fileID, '\n%d \t %d \t%f \t %f \t %f ', N, typeB, B(1), B(2), B(3)); 
        N = N +1; 
        fprintf(fileID, '\n%d \t %d \t%f \t %f \t %f', N, typeC, C(1), C(2), C(3)); 
        N = N +1; 
        fprintf(fileID, '\n%d \t %d \t%f \t %f \t %f', N, typeD, D(1), D(2), D(3)); 
        N = N +1; 
        j = j + 1.0; 
        end
        i = i + 1.0; 
end
k = k+1; 

while(k <= nz)
    type = 6; 
        
    checkL = mod(k,2);
    if(checkL == 0) %per fare il piano di tipo A o B
        in = a; 
    else
        in = 0.0; 
    end
    i = 1.0;
    
    while (i <= nx_b)       
        j = 1.0; 
        while(j <= ny)
        typeA = type;  % a tutti viene assegnato 1
        typeB = type; 
        typeC = type; 
        typeD = type; 
        A = [AA(1)+ (i-1)*Tx, AA(2)+(j-1)*Ty + in, AA(3)+Tz*(k-1)]; 
        B = [BB(1)+ (i-1)*Tx, BB(2)+(j-1)*Ty + in, BB(3)+Tz*(k-1)];
        C = [CC(1)+ (i-1)*Tx, CC(2)+(j-1)*Ty + in, CC(3)+Tz*(k-1)];
        D = [DD(1)+ (i-1)*Tx, DD(2)+(j-1)*Ty + in, DD(3)+Tz*(k-1)]; 
        
        fprintf(fileID, '\n%d \t %d \t%f \t %f \t %f', N, typeA,  A(1), A(2), A(3));  
        N = N +1; 
        fprintf(fileID, '\n%d \t %d \t%f \t %f \t %f', N, typeB, B(1), B(2), B(3)); 
        N = N +1; 
        fprintf(fileID, '\n%d \t %d \t%f \t %f \t %f', N, typeC, C(1), C(2), C(3)); 
        N = N +1; 
        fprintf(fileID, '\n%d \t %d \t%f \t %f \t %f', N, typeD, D(1), D(2), D(3)); 
        N = N +1; 
        j = j + 1.0; 
        end
        i = i + 1.0; 
    end
    k = k+ 1.0; 
end







 fprintf(fileID, '\n '); 
disp('------------------------------------------'); 
disp('file generated')
fprintf('\n Number of atoms = %d\n \n', N-1); 
