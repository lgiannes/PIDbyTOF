#!/bin/bash 
 set -e 
ND280_SYSTEM=`nd280-system` 
export ND280_NJOBS=${ND280_NJOBS:=1}
  if [ -f /afs/cern.ch/work/l/lgiannes/private/T2K/work/testBase_1.20/cmake/CMakeLists.txt ] ; then
  echo " cd  /afs/cern.ch/work/l/lgiannes/private/T2K/work/testBase_1.20/${ND280_SYSTEM}/ ;cmake ../cmake ; " >../bin/cmakePackagetestBase.sh 
  fi 
    if [ -f /afs/cern.ch/work/l/lgiannes/private/T2K/work/nd280SoftwarePolicy_3.14/cmake/CMakeLists.txt ] ; then
  echo " cd  /afs/cern.ch/work/l/lgiannes/private/T2K/work/nd280SoftwarePolicy_3.14/${ND280_SYSTEM}/ ;cmake ../cmake ; " >../bin/cmakePackagend280SoftwarePolicy.sh 
  fi 
    if [ -f /afs/cern.ch/work/l/lgiannes/private/T2K/work/MYSQL_5.6.20.02/cmake/CMakeLists.txt ] ; then
  echo " cd  /afs/cern.ch/work/l/lgiannes/private/T2K/work/MYSQL_5.6.20.02/${ND280_SYSTEM}/ ;cmake ../cmake ; " >../bin/cmakePackageMYSQL.sh 
  fi 
    if [ -f /afs/cern.ch/work/l/lgiannes/private/T2K/work/GSL_1.15.0.00/cmake/CMakeLists.txt ] ; then
  echo " cd  /afs/cern.ch/work/l/lgiannes/private/T2K/work/GSL_1.15.0.00/${ND280_SYSTEM}/ ;cmake ../cmake ; " >../bin/cmakePackageGSL.sh 
  fi 
    if [ -f /afs/cern.ch/work/l/lgiannes/private/T2K/work/ROOT_6.20.04.04/cmake/CMakeLists.txt ] ; then
  echo " cd  /afs/cern.ch/work/l/lgiannes/private/T2K/work/ROOT_6.20.04.04/${ND280_SYSTEM}/ ;cmake ../cmake ; " >../bin/cmakePackageROOT.sh 
  fi 
    if [ -f /afs/cern.ch/work/l/lgiannes/private/T2K/work/oaEvent_10.6/cmake/CMakeLists.txt ] ; then
  echo " cd  /afs/cern.ch/work/l/lgiannes/private/T2K/work/oaEvent_10.6/${ND280_SYSTEM}/ ;cmake ../cmake ; " >../bin/cmakePackageoaEvent.sh 
  fi 
    if [ -f /afs/cern.ch/work/l/lgiannes/private/T2K/work/CLHEP_2.1.1.0/cmake/CMakeLists.txt ] ; then
  echo " cd  /afs/cern.ch/work/l/lgiannes/private/T2K/work/CLHEP_2.1.1.0/${ND280_SYSTEM}/ ;cmake ../cmake ; " >../bin/cmakePackageCLHEP.sh 
  fi 
    if [ -f /afs/cern.ch/work/l/lgiannes/private/T2K/work/oaRawEvent_3.33/cmake/CMakeLists.txt ] ; then
  echo " cd  /afs/cern.ch/work/l/lgiannes/private/T2K/work/oaRawEvent_3.33/${ND280_SYSTEM}/ ;cmake ../cmake ; " >../bin/cmakePackageoaRawEvent.sh 
  fi 
    if [ -f /afs/cern.ch/work/l/lgiannes/private/T2K/work/oaRuntimeParams_0.10/cmake/CMakeLists.txt ] ; then
  echo " cd  /afs/cern.ch/work/l/lgiannes/private/T2K/work/oaRuntimeParams_0.10/${ND280_SYSTEM}/ ;cmake ../cmake ; " >../bin/cmakePackageoaRuntimeParams.sh 
  fi 
    if [ -f /afs/cern.ch/work/l/lgiannes/private/T2K/work/oaSlowControlDatabase_1.15.1/cmake/CMakeLists.txt ] ; then
  echo " cd  /afs/cern.ch/work/l/lgiannes/private/T2K/work/oaSlowControlDatabase_1.15.1/${ND280_SYSTEM}/ ;cmake ../cmake ; " >../bin/cmakePackageoaSlowControlDatabase.sh 
  fi 
    if [ -f /afs/cern.ch/work/l/lgiannes/private/T2K/work/oaOfflineDatabase_2.16/cmake/CMakeLists.txt ] ; then
  echo " cd  /afs/cern.ch/work/l/lgiannes/private/T2K/work/oaOfflineDatabase_2.16/${ND280_SYSTEM}/ ;cmake ../cmake ; " >../bin/cmakePackageoaOfflineDatabase.sh 
  fi 
    if [ -f /afs/cern.ch/work/l/lgiannes/private/T2K/work/oaCalibTables_1.28/cmake/CMakeLists.txt ] ; then
  echo " cd  /afs/cern.ch/work/l/lgiannes/private/T2K/work/oaCalibTables_1.28/${ND280_SYSTEM}/ ;cmake ../cmake ; " >../bin/cmakePackageoaCalibTables.sh 
  fi 
    if [ -f /afs/cern.ch/work/l/lgiannes/private/T2K/work/oaMagnetCalib_4.18/cmake/CMakeLists.txt ] ; then
  echo " cd  /afs/cern.ch/work/l/lgiannes/private/T2K/work/oaMagnetCalib_4.18/${ND280_SYSTEM}/ ;cmake ../cmake ; " >../bin/cmakePackageoaMagnetCalib.sh 
  fi 
    if [ -f /afs/cern.ch/work/l/lgiannes/private/T2K/work/oaUtility_6.0/cmake/CMakeLists.txt ] ; then
  echo " cd  /afs/cern.ch/work/l/lgiannes/private/T2K/work/oaUtility_6.0/${ND280_SYSTEM}/ ;cmake ../cmake ; " >../bin/cmakePackageoaUtility.sh 
  fi 
    if [ -f /afs/cern.ch/work/l/lgiannes/private/T2K/work/oaChanInfo_4.2/cmake/CMakeLists.txt ] ; then
  echo " cd  /afs/cern.ch/work/l/lgiannes/private/T2K/work/oaChanInfo_4.2/${ND280_SYSTEM}/ ;cmake ../cmake ; " >../bin/cmakePackageoaChanInfo.sh 
  fi 
    if [ -f /afs/cern.ch/work/l/lgiannes/private/T2K/work/oaGeomInfo_6.4/cmake/CMakeLists.txt ] ; then
  echo " cd  /afs/cern.ch/work/l/lgiannes/private/T2K/work/oaGeomInfo_6.4/${ND280_SYSTEM}/ ;cmake ../cmake ; " >../bin/cmakePackageoaGeomInfo.sh 
  fi 
    if [ -f /afs/cern.ch/work/l/lgiannes/private/T2K/work/reconUtils_1.37/cmake/CMakeLists.txt ] ; then
  echo " cd  /afs/cern.ch/work/l/lgiannes/private/T2K/work/reconUtils_1.37/${ND280_SYSTEM}/ ;cmake ../cmake ; " >../bin/cmakePackagereconUtils.sh 
  fi 
    if [ -f /afs/cern.ch/work/l/lgiannes/private/T2K/work/analyse_0.0/cmake/CMakeLists.txt ] ; then
  echo " cd  /afs/cern.ch/work/l/lgiannes/private/T2K/work/analyse_0.0/${ND280_SYSTEM}/ ;cmake ../cmake ; " >../bin/cmakePackageanalyse.sh 
  fi 
  find ../bin -name 'cmakePackage*.sh' -print0 | xargs -0 -I NAME -P ${ND280_NJOBS} /bin/bash NAME "$1" "$2"  
