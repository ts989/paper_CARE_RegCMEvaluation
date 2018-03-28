LONs=13
LONe=20
LATs=42
LATe=47
D1=1989-03-01
D2=2008-11-30



#--------------------------------------------------------------------
#----------------------------------------------------------- 50km+GRL
#--------------------------------------------------------------------
INPUT=/home1/regcm/DISK_CARE/FROM_SRCE/evaluation_grl
OUTPT=/work/regcm/temp/test_CARE_001

# Join files	
	cdo copy ${INPUT}/EUROPE*SRF*nc ${OUTPT}/tempCOPY.nc

# Computation
	cdo -f nc -sellonlatbox,$LONs,$LONe,$LATs,$LATe -remapnn,UDEL_grid.txt -settime,12:00:00 -setday,15 -seasmean -seldate,$D1,$D2 -selvar,tpr ${OUTPT}/tempCOPY.nc ${OUTPT}/2D_REGCM50km_GRL_ERAINT.nc

# cleanning
	rm -vf ${OUTPT}/tempCOPY.nc

#--------------------------------------------------------------------
#----------------------------------------------------------- 50km+MIT
#--------------------------------------------------------------------
INPUT=/home1/regcm/DISK_zemlja/CORDEX/TEST/RegCM-version/output_CORDEX_MAR2012/MONTHLY_MEANS
OUTPT=/work/regcm/temp/test_CARE_001

# Join files	
	cdo copy ${INPUT}/EUROPE_SRF.??????.nc ${OUTPT}/tempCOPY.nc

# Computation
	cdo -f nc -sellonlatbox,$LONs,$LONe,$LATs,$LATe -remapnn,UDEL_grid.txt -settime,12:00:00 -setday,15 -seasmean -seldate,$D1,$D2 -selvar,tpr ${OUTPT}/tempCOPY.nc ${OUTPT}/2D_REGCM50km_MIT_ERAINT.nc

# cleanning
	rm -vf ${OUTPT}/tempCOPY.nc
