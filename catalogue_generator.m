input_filename = 'honeycombResonantFreq_wallPermittivity1_wallThickness3mm.xlsx';
output_filename = 'honeycombEpsilon_wallPermittivity1_wallThickness3mm.xlsx';


if isequal( input_filename, output_filename)
    stop();
end

catalogue = xlsread(input_filename);

mode = 1;
mu = 1;
a = 47;
b = 47;
h = 9;
c = 299792458; %Speed of Light

if isequal( mode, 1)      
    m=1; n=1; p=0;
elseif isequal( mode, 2)
    m=1; n=0; p=1;
elseif isequal( mode, 3)
    m=1; n=0; p=0;
elseif isequal( mode, 4)
    m=0; n=1; p=1;
elseif isequal( mode, 5)
    m=0; n=1; p=0;
elseif isequal( mode, 6)
    m=0; n=0; p=1;
elseif isequal( mode, 7)
    m=0; n=0; p=0;
else
    fprintf( '\t mode not between 1-8')
end


mode_constant =  ((m/a)^2 + (n/b)^2 + (p/h)^2)*(10^3)^2 ; 
for i = 2 : length( catalogue(:,1) )
    for j = 2 : length( catalogue(1,:) )
        catalogue(i,j) = (( c / ( 2 * catalogue(i,j)* 10^9 * sqrt(mu) ) )^2 )* mode_constant;  
    end
end


if isequal( input_filename, output_filename)
    stop();
end
xlswrite(output_filename,catalogue);
