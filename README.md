# Hybrid-to-Pressure Level Interpolation Using NCO
**Sandro W. Lubis, Ph.D.**
Pacific Northwest National Laboratory (PNNL)


This script converts E3SM atmosphere model output from hybrid vertical coordinates to standard pressure levels using NCO `ncremap`. The workflow is designed for E3SM/CAM-style files that contain hybrid-coordinate variables such as `hyam`, `hybm`, `P0`, and surface pressure `PS`.

## Purpose

E3SM atmospheric variables such as `U` and `V` are often stored on hybrid sigma-pressure levels:

\[
p(k) = hyam(k) \times P0 + hybm(k) \times PS
\]

where `PS` is surface pressure and `P0` is the reference pressure. For many diagnostics and comparisons with reanalysis data, these variables need to be interpolated to fixed pressure levels such as 1000, 850, 500, and 200 hPa.

This script uses NCO to interpolate `U` and `V` from hybrid levels to pressure levels for each year from 1980 to 2014.

