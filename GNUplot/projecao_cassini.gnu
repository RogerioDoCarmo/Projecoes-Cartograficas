# Autores deste script: PPGCC - FCT/UNESP
#         Felipe Foglia Martins
#         Rogério Ramos Rodrigues docarmo
#         Maio/2019
# --------------------------------------------------------
reset

set angles degrees

set noborder 
set xtics 
set ytics 
set grid

# Coluna 1 - Longitude
# Coluna 2 - Latitude

# Cassini

# Saara Ocidental
lon0 = -10.79908
lat0 =  27.04604

R = 6371.000

B(lat,lon) = cos(lat) * sin(lon - lon0)

fx(lat,lon) = R * asin( B(lat,lon) ) * pi/180
fy(lat,lon) = R * ( ((atan(tan(lat) / (cos(lon-lon0))))-(lat0)) * (pi/180) )

set title "Projeção de Cassini (caso esférico)"

plot 'data\saara.dat' 	using (fx($2,$1)):(fy($2,$1)) t '' with lines lc 8 lw 1
rep  'data\saara.mer' 	using (fx($2,$1)):(fy($2,$1)) t '' with lines lc 9 lw 1
rep  'data\saara.par' 	using (fx($2,$1)):(fy($2,$1)) t '' with lines lc 9 lw 1
rep  'data\capital.dat' using (fx($2,$1)):(fy($2,$1)) t "El Aiune" with points lc 2 pt 6

pause -1 "Finaliza ?"