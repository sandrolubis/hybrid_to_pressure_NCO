cat > vrt_plev_pa.cdl << 'EOF'
netcdf vrt_plev_pa {
dimensions:
    plev = 37 ;

variables:
    double plev(plev) ;
        plev:units = "Pa" ;
        plev:long_name = "pressure" ;
        plev:standard_name = "air_pressure" ;
        plev:axis = "Z" ;
        plev:positive = "down" ;

data:
    plev =
    100000., 97500., 95000., 92500., 90000., 87500., 85000., 82500., 80000., 77500.,
    75000., 70000., 65000., 60000., 55000., 50000., 45000., 40000., 35000., 30000.,
    25000., 22500., 20000., 17500., 15000., 12500., 10000., 7000., 5000., 3000.,
    2000., 1000., 700., 500., 300., 200., 100. ;
}
EOF

ncgen -o vrt_plev_pa.nc vrt_plev_pa.cdl

rm vrt_plev_pa.cdl
