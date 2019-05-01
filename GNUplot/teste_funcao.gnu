set angles degrees

# Exemplo do Livro

lat0 = -20
lon0 = -75

lat = 25
lon = -90

R = 1.0

B(lat,lon) = cos(lat) * sin(lon - lon0)


fx(lon,lat) = R * asin( B(lat,lon) ) * pi/180
fy(lon,lat) = R * ( atan( (tan(lat)/cos(lon-lon0))) - (lat0)) *pi/180

print(  B(lat,lon) )
print( fx(lon,lat) )
print( fy(lon,lat) )

pause -1 "Finaliza ?" 