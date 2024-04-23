# This script sequentiallly displays brain datasets for reviewing of processing steps such as brain extraction, segmentation and surface estimation
# Date: 12 April 2023

# Calculates the number of processed datasets (folders) with *t1mprage* name
total_files=0
for i in `ls -d *t1mprage*/`
do
	total_files=`expr $total_files + 1`
done
echo $total_files directories found
counter=0

# Opens processed brain datasets from `mri/` directory and surface images from `surf/` directory for each dataset
for i in `ls -d *t1mprage*/`
do
	counter=`expr $counter + 1`
	echo Viewing directory no. $counter/$total_files $i
	cd $i

  	# Visualizes 2 dimensional Brain images
	freeview mri/brain.mgz
	freeview -v \
	mri/T1.mgz \
	mri/wm.mgz \
	mri/brainmask.mgz \
	mri/aseg.mgz:colormap=lut:opacity=0.2 \
	-f surf/lh.white:edgecolor=blue \
	surf/lh.pial:edgecolor=red \
	surf/rh.white:edgecolor=blue \
	surf/rh.pial:edgecolor=red

 	# Displays 3 dimensional brain volumes
	freeview -f surf/lh.pial:annot=aparc.annot:name=pial_aparc:visible=0 \
	surf/lh.pial:annot=aparc.a2009s.annot:name=pial_aparc_des:visible=0 \
	surf/lh.inflated:overlay=lh.thickness:overlay_threshold=0.1,3::name=inflated_thickness:visible=0 \
	surf/lh.inflated:visible=0 \
	surf/lh.white:visible=0 \
	surf/lh.pial \
	--viewport 3d

	cd ..
	s_name=`basename $i /`
	file_name=BET_comments.txt # Opens a file with name 'BET_commments.txt' for log/record keeping of data quality
	echo $counter/$total_files $s_name >> $file_name
	nano $file_name # Write your comments and press 'Ctrl+X' to save your comments.
done
