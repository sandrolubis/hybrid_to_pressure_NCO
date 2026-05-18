#!/bin/bash
set -e

indir="."
outdir="./output"
vrt="vrt_plev_pa.nc"

mkdir -p "$outdir"

for var in U V; do
    for yr in $(seq 1980 2014); do

        infile="${indir}/CTRL.h2.${yr}.daily.nc"
        tmp_pa="${outdir}/tmp_${var}_${yr}_plev_Pa.nc"
        outfile="${outdir}/CTRL.${var}.${yr}.plev.nc"

        echo "Processing ${var} ${yr}"

        if [ ! -f "$infile" ]; then
            echo "Missing input file: $infile"
            continue
        fi

        if [ ! -f "$vrt" ]; then
            echo "Missing vertical template: $vrt"
            exit 1
        fi

        if [ -f "$outfile" ]; then
            echo "Output already exists, skipping: $outfile"
            continue
        fi

        # Interpolate using pressure levels in Pa
        ncremap --vrt="$vrt" \
                --vrt_xtr=mss_val \
                --vrt_ntp=log \
                -v "$var" \
                "$infile" \
                "$tmp_pa"

        # Convert plev coordinate from Pa to hPa
        ncap2 -O -s 'plev=plev/100.0' "$tmp_pa" "$outfile"
        ncatted -O -a units,plev,o,c,"hPa" "$outfile"

        # Remove area variable and its reference
        ncks -O -x -v area "$outfile" "$outfile"
        ncatted -O -a cell_measures,"$var",d,, "$outfile"

        # Delete temporary Pa file
        rm -f "$tmp_pa"

        echo "Finished ${var} ${yr}: $outfile"
    done
done

echo "All done. Final hPa files are in: $outdir"
