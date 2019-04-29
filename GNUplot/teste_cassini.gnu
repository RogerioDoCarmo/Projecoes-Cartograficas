#
# #################################
# #   Arquivo 'plate_carre.gnu'   #
# #################################
#
# Este arquivo mostra um exemplo de aplicacao do  software
# GNUPLOT na  visualizacao  de  projecoes  em  cartografia
#
# Para mais detalhes sobre este aplicativo consulte:
#
# //www.gnuplot.info/
# www2.fct.unesp.br/docentes/carto/galo/web/gnuplot/fct.htm
#
# Autor deste "script": Eng. Cart. Mauricio Galo
#                       UNESP/Departamento de Cartografia
#                       mauricio.galo@unesp.br
#                       Abril/2019
# --------------------------------------------------------

reset
set xtics
set ytics
set grid
#set noxtics
#set noytics
set angles degrees
#set noborder

#
# Coluna 1 - Longitude
# Coluna 2 - Latitude

#Cassini

lon0=-10.79908
lat0=27.04604

#lon0=-13
#lat0=25
#lon0=0
#lat0=0

R=6371

#fx(lon,lat) = R * asin((cos(lat)*sin(lon-lon0)))
#fy(lon,lat) = R *( atan( (tan(lat)/cos(lon-lon0)) - lat0 ) )

fx(lon,lat) = asin(cos(lat)*sin(lon-lon0))
fy(lon,lat) = atan2(sin(lat),cos(lat)*cos(lon-lon0))

#fy(lon,lat)=atan((tan(lat)/cos(lon-lon0))-lat0)
#fx(lon,lat)=asin((cos(lat)*sin(lon-lon0)))

#fy(lat,lon)=lon
#fx(lat,lon)=lat


set title "Projeção de Cassini..."
plot 'data\worldn.dat' using (fy($2,$1)):(fx($2,$1)) t"" with lines lc 1
#rep  'data\world_cim.mer' using (fy($2,$1)):(fx($2,$1)) t '' with lines lc 9
#rep  'data\world_cim.par' using (fy($2,$1)):(fx($2,$1)) t '' with lines lc 9
pause -1 "Finaliza ?"

