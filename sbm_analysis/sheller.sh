#!/bin/sh
# This shell script runs freesurfer based preprocessing pipelines for all selected subjects using parallel processing
# Author: Deepak@Nurolab

cores=`nproc --all` # Count number of CPU cores available to check how many of them can be utilised for parallel processing
echo $cores cores are available
max_cores=`expr $cores - 4`
n_job=0

list=`ls *.nii` # Select all files with .nii extension ## Filter
for i in $list
do
  n_job=`expr $n_job + 1`
done
echo "There are $n_job files"

if [ $n_job -lt $max_cores ];
then
 SUBJECTS_DIR=`pwd`
 for i in $list
 do
  echo $i
  gnome-terminal -- bash -c "echo Subjects directory is : $SUBJECTS_DIR; echo Processing for : $i; recon-all -i $i -s `basename $i .nii` -autorecon1; recon-all -s `basename $i .nii` -autorecon2; recon-all -s `basename $i .nii` -autorecon3; recon-all -s `basename $i .nii` -qcache; exec bash"
 done
fi
