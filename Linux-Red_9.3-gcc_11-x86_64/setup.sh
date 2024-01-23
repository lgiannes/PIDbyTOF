# Setup the PATH and LD_LIBRARY_PATH environment variables 
# and run all setup scripts
HERE=`pwd` 
export ND280_SYSTEM=`nd280-system` 
unset -f path_remove 
unset -f path_append 
unset -f ld_remove 
unset -f ld_append 
path_remove ()  { export PATH=`echo -n $PATH | awk -v RS=: -v ORS=: '$0 != "'$1'"' | sed 's/:$//'`; } 
path_append ()  { path_remove $1; export PATH="$PATH:$1" ;} 
ld_remove ()  { export LD_LIBRARY_PATH=`echo -n $LD_LIBRARY_PATH | awk -v RS=: -v ORS=: '$0 != "'$1'"' | sed 's/:$//'`; } 
ld_append ()  { ld_remove $1; export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$1" ;} 
path_append /afs/cern.ch/work/l/lgiannes/private/T2K/work/analyse_0.0/${ND280_SYSTEM}/bin 
ld_append /afs/cern.ch/work/l/lgiannes/private/T2K/work/analyse_0.0/${ND280_SYSTEM}/lib 
export ND280SOFTWAREPOLICYROOT=/afs/cern.ch/work/l/lgiannes/private/T2K/work/nd280SoftwarePolicy_3.14/modules/.. 
path_append /afs/cern.ch/work/l/lgiannes/private/T2K/work/testBase_1.20/${ND280_SYSTEM}/bin 
ld_append /afs/cern.ch/work/l/lgiannes/private/T2K/work/testBase_1.20/${ND280_SYSTEM}/lib 
export TESTBASEROOT=/afs/cern.ch/work/l/lgiannes/private/T2K/work/testBase_1.20 
export TESTBASECONFIG=${ND280_SYSTEM}  
for file in /afs/cern.ch/work/l/lgiannes/private/T2K/work/testBase_1.20/setup_script/*.sh ; do [ -f $file ] && . $file ; done
path_append /afs/cern.ch/work/l/lgiannes/private/T2K/work/nd280SoftwarePolicy_3.14/${ND280_SYSTEM}/bin 
ld_append /afs/cern.ch/work/l/lgiannes/private/T2K/work/nd280SoftwarePolicy_3.14/${ND280_SYSTEM}/lib 
export ND280SOFTWAREPOLICYROOT=/afs/cern.ch/work/l/lgiannes/private/T2K/work/nd280SoftwarePolicy_3.14 
export ND280SOFTWAREPOLICYCONFIG=${ND280_SYSTEM}  
path_append /afs/cern.ch/work/l/lgiannes/private/T2K/work/MYSQL_5.6.20.02/${ND280_SYSTEM}/bin 
ld_append /afs/cern.ch/work/l/lgiannes/private/T2K/work/MYSQL_5.6.20.02/${ND280_SYSTEM}/lib 
export MYSQLROOT=/afs/cern.ch/work/l/lgiannes/private/T2K/work/MYSQL_5.6.20.02 
export MYSQLCONFIG=${ND280_SYSTEM}  
path_append /afs/cern.ch/work/l/lgiannes/private/T2K/work/GSL_1.15.0.00/${ND280_SYSTEM}/bin 
ld_append /afs/cern.ch/work/l/lgiannes/private/T2K/work/GSL_1.15.0.00/${ND280_SYSTEM}/lib 
export GSLROOT=/afs/cern.ch/work/l/lgiannes/private/T2K/work/GSL_1.15.0.00 
export GSLCONFIG=${ND280_SYSTEM}  
path_append /afs/cern.ch/work/l/lgiannes/private/T2K/work/ROOT_6.20.04.04/${ND280_SYSTEM}/bin 
ld_append /afs/cern.ch/work/l/lgiannes/private/T2K/work/ROOT_6.20.04.04/${ND280_SYSTEM}/lib 
export ROOTROOT=/afs/cern.ch/work/l/lgiannes/private/T2K/work/ROOT_6.20.04.04 
export ROOTCONFIG=${ND280_SYSTEM}  
for file in /afs/cern.ch/work/l/lgiannes/private/T2K/work/ROOT_6.20.04.04/setup_script/*.sh ; do [ -f $file ] && . $file ; done
path_append /afs/cern.ch/work/l/lgiannes/private/T2K/work/oaEvent_10.6/${ND280_SYSTEM}/bin 
ld_append /afs/cern.ch/work/l/lgiannes/private/T2K/work/oaEvent_10.6/${ND280_SYSTEM}/lib 
export OAEVENTROOT=/afs/cern.ch/work/l/lgiannes/private/T2K/work/oaEvent_10.6 
export OAEVENTCONFIG=${ND280_SYSTEM}  
for file in /afs/cern.ch/work/l/lgiannes/private/T2K/work/oaEvent_10.6/setup_script/*.sh ; do [ -f $file ] && . $file ; done
path_append /afs/cern.ch/work/l/lgiannes/private/T2K/work/CLHEP_2.1.1.0/${ND280_SYSTEM}/bin 
ld_append /afs/cern.ch/work/l/lgiannes/private/T2K/work/CLHEP_2.1.1.0/${ND280_SYSTEM}/lib 
export CLHEPROOT=/afs/cern.ch/work/l/lgiannes/private/T2K/work/CLHEP_2.1.1.0 
export CLHEPCONFIG=${ND280_SYSTEM}  
path_append /afs/cern.ch/work/l/lgiannes/private/T2K/work/oaRawEvent_3.33/${ND280_SYSTEM}/bin 
ld_append /afs/cern.ch/work/l/lgiannes/private/T2K/work/oaRawEvent_3.33/${ND280_SYSTEM}/lib 
export OARAWEVENTROOT=/afs/cern.ch/work/l/lgiannes/private/T2K/work/oaRawEvent_3.33 
export OARAWEVENTCONFIG=${ND280_SYSTEM}  
path_append /afs/cern.ch/work/l/lgiannes/private/T2K/work/oaRuntimeParams_0.10/${ND280_SYSTEM}/bin 
ld_append /afs/cern.ch/work/l/lgiannes/private/T2K/work/oaRuntimeParams_0.10/${ND280_SYSTEM}/lib 
export OARUNTIMEPARAMSROOT=/afs/cern.ch/work/l/lgiannes/private/T2K/work/oaRuntimeParams_0.10 
export OARUNTIMEPARAMSCONFIG=${ND280_SYSTEM}  
path_append /afs/cern.ch/work/l/lgiannes/private/T2K/work/oaSlowControlDatabase_1.15.1/${ND280_SYSTEM}/bin 
ld_append /afs/cern.ch/work/l/lgiannes/private/T2K/work/oaSlowControlDatabase_1.15.1/${ND280_SYSTEM}/lib 
export OASLOWCONTROLDATABASEROOT=/afs/cern.ch/work/l/lgiannes/private/T2K/work/oaSlowControlDatabase_1.15.1 
export OASLOWCONTROLDATABASECONFIG=${ND280_SYSTEM}  
for file in /afs/cern.ch/work/l/lgiannes/private/T2K/work/oaSlowControlDatabase_1.15.1/setup_script/*.sh ; do [ -f $file ] && . $file ; done
path_append /afs/cern.ch/work/l/lgiannes/private/T2K/work/oaOfflineDatabase_2.16/${ND280_SYSTEM}/bin 
ld_append /afs/cern.ch/work/l/lgiannes/private/T2K/work/oaOfflineDatabase_2.16/${ND280_SYSTEM}/lib 
export OAOFFLINEDATABASEROOT=/afs/cern.ch/work/l/lgiannes/private/T2K/work/oaOfflineDatabase_2.16 
export OAOFFLINEDATABASECONFIG=${ND280_SYSTEM}  
for file in /afs/cern.ch/work/l/lgiannes/private/T2K/work/oaOfflineDatabase_2.16/setup_script/*.sh ; do [ -f $file ] && . $file ; done
path_append /afs/cern.ch/work/l/lgiannes/private/T2K/work/oaCalibTables_1.28/${ND280_SYSTEM}/bin 
ld_append /afs/cern.ch/work/l/lgiannes/private/T2K/work/oaCalibTables_1.28/${ND280_SYSTEM}/lib 
export OACALIBTABLESROOT=/afs/cern.ch/work/l/lgiannes/private/T2K/work/oaCalibTables_1.28 
export OACALIBTABLESCONFIG=${ND280_SYSTEM}  
path_append /afs/cern.ch/work/l/lgiannes/private/T2K/work/oaMagnetCalib_4.18/${ND280_SYSTEM}/bin 
ld_append /afs/cern.ch/work/l/lgiannes/private/T2K/work/oaMagnetCalib_4.18/${ND280_SYSTEM}/lib 
export OAMAGNETCALIBROOT=/afs/cern.ch/work/l/lgiannes/private/T2K/work/oaMagnetCalib_4.18 
export OAMAGNETCALIBCONFIG=${ND280_SYSTEM}  
path_append /afs/cern.ch/work/l/lgiannes/private/T2K/work/oaUtility_6.0/${ND280_SYSTEM}/bin 
ld_append /afs/cern.ch/work/l/lgiannes/private/T2K/work/oaUtility_6.0/${ND280_SYSTEM}/lib 
export OAUTILITYROOT=/afs/cern.ch/work/l/lgiannes/private/T2K/work/oaUtility_6.0 
export OAUTILITYCONFIG=${ND280_SYSTEM}  
path_append /afs/cern.ch/work/l/lgiannes/private/T2K/work/oaChanInfo_4.2/${ND280_SYSTEM}/bin 
ld_append /afs/cern.ch/work/l/lgiannes/private/T2K/work/oaChanInfo_4.2/${ND280_SYSTEM}/lib 
export OACHANINFOROOT=/afs/cern.ch/work/l/lgiannes/private/T2K/work/oaChanInfo_4.2 
export OACHANINFOCONFIG=${ND280_SYSTEM}  
path_append /afs/cern.ch/work/l/lgiannes/private/T2K/work/oaGeomInfo_6.4/${ND280_SYSTEM}/bin 
ld_append /afs/cern.ch/work/l/lgiannes/private/T2K/work/oaGeomInfo_6.4/${ND280_SYSTEM}/lib 
export OAGEOMINFOROOT=/afs/cern.ch/work/l/lgiannes/private/T2K/work/oaGeomInfo_6.4 
export OAGEOMINFOCONFIG=${ND280_SYSTEM}  
path_append /afs/cern.ch/work/l/lgiannes/private/T2K/work/reconUtils_1.37/${ND280_SYSTEM}/bin 
ld_append /afs/cern.ch/work/l/lgiannes/private/T2K/work/reconUtils_1.37/${ND280_SYSTEM}/lib 
export RECONUTILSROOT=/afs/cern.ch/work/l/lgiannes/private/T2K/work/reconUtils_1.37 
export RECONUTILSCONFIG=${ND280_SYSTEM}  
path_append /afs/cern.ch/work/l/lgiannes/private/T2K/work/analyse_0.0/${ND280_SYSTEM}/bin 
ld_append /afs/cern.ch/work/l/lgiannes/private/T2K/work/analyse_0.0/${ND280_SYSTEM}/lib 
export ANALYSEROOT=/afs/cern.ch/work/l/lgiannes/private/T2K/work/analyse_0.0 
export ANALYSECONFIG=${ND280_SYSTEM}  
for file in /afs/cern.ch/work/l/lgiannes/private/T2K/work/analyse_0.0/setup_script/*.sh ; do [ -f $file ] && . $file ; done
export LD_LIBRARY_PATH=`echo $LD_LIBRARY_PATH | sed 's/^://g'`
cd $HERE 
