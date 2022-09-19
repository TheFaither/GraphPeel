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
xtot = input(prompt); 
nx = int8(xtot/Tx);
prompt2 = 'Length of the sheet (Angrstom): ';
yi = 0.0; 
ytot = input(prompt2); 
ny = int8(ytot/Ty);
prompt3 = 'Number of sheets: '; 
nz = input(prompt3); 
ztot = nz*Tz;

 zi = 0.0; 




AA = [0, 0, 0]; 
BB = [sqrt(3)*a/2,a/2 , 0]; 
CC = [ sqrt(3)*a/2, 3*a/2 , 0]; 
DD = [0, 2*a, 0]; 
box = 5.0; 
fileID = fopen('structure', 'w'); 
Ntot = 4*double(nx)*double(ny)*double(nz); 

fprintf(fileID, '\n %d atoms \n', Ntot); 
fprintf(fileID, ' %d atom types \n',nz); 
fprintf(fileID, '%f \t %f \t xlo xhi\n', xi- box, xtot+box); 
fprintf(fileID, '%f \t %f \t ylo yhi\n', yi- box, ytot+box); 
fprintf(fileID, '%f \t %f \t zlo zhi\n', zi- box, ztot+box); 
fprintf(fileID, '\n Masses \n\n');
for i = 1:nz
fprintf(fileID, '%d \t 12.0107\n', i); 
end
fprintf(fileID, '\n Atoms\n\n'); 

N = 1; 


k = 1.0;
type = 1; 
while(k <= nz)
    
    type = k; 
    checkL = mod(k,2); 
    if(checkL == 0)
       in = a; 
    else
        in = 0.0; 
    end
    i = 1.0; 
    while (i <= nx)       
     
        j = 1.0; 
        while(j <= ny)
       
        
        A = [AA(1)+ i*Tx , AA(2)+j*Ty+ in, AA(3)+Tz*k]; 
        B = [BB(1)+ i*Tx, BB(2)+j*Ty + in, BB(3)+Tz*k];
        C = [CC(1)+ i*Tx , CC(2)+j*Ty+ in , CC(3)+Tz*k];
        D = [DD(1)+ i*Tx, DD(2)+j*Ty + in , DD(3)+Tz*k];
        
        fprintf(fileID, '%d \t %d \t%f \t %f \t %f\n', N, type,  A(1), A(2), A(3));  
        N = N +1; 
        fprintf(fileID, '%d \t %d \t%f \t %f \t %f \n', N, type, B(1), B(2), B(3)); 
        N = N +1; 
         fprintf(fileID, '%d \t %d \t%f \t %f \t %f \n', N, type, C(1), C(2), C(3)); 
        N = N +1; 
        fprintf(fileID, '%d \t %d \t%f \t %f \t %f \n', N, type, D(1), D(2), D(3)); 
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

