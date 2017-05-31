#!/bin/bash

analyseType=$1;
out1=$2;
out2=$3;
out3=$4;
log1=$5;
galaxyOutDir=$6;


mkdir -p  "/var/tmp/"$galaxyOutDir

# Suppression des 6 premiers arguments de la liste des arguments $@
shift; shift; shift; shift; shift; shift;


if [[ $analyseType == glm ]] 
then
 /var/tmp/run_pipeline.pl $* >> $log1 2>&1
 mv "/var/tmp/"$galaxyOutDir"/TASSELGLM1.txt" $out1
 mv "/var/tmp/"$galaxyOutDir"/TASSELGLM2.txt" $out2
fi

if [[ $analyseType == mlm ]] 
then
 /var/tmp/run_pipeline.pl $* >> $log1 2>&1
 mv "/var/tmp/"$galaxyOutDir"/TASSELMLM1.txt" $out1
 mv "/var/tmp/"$galaxyOutDir"/TASSELMLM2.txt" $out2
 mv "/var/tmp/"$galaxyOutDir"/TASSELMLM3.txt" $out3
fi

if [[ $analyseType == ld ]] 
then
 /var/tmp/run_pipeline $* >> $log1 2>&1
fi


if [[ $analyseType == ck ]]
then
 /var/tmp/run_pipeline.pl $* >> $log1 2>&1
 mv "/var/tmp/"$galaxyOutDir"/kinship.txt" $out1
fi


