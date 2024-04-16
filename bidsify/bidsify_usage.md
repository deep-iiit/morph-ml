# bidsify
- BIDS stands for 'Brain Imaging Data Structure' and provides a set of rules to manage neuroimaging datasets.
- This repository provides a number of linux shell scripts to create/convert/organize neuroimaging datasets following the BIDS standard.
- The scripts can be used to convert DICOM files to NIFTI files and to generate BIDS compliant metadata files in BIDS standard structure.

## How to manage neuroimaging data using BIDS standard?
### Usage

   1. For tutorial purpose, you may use a **bidsify** processed BIDS compliant example dataset to check whether it complies BIDS standard. This is available with `valid` directory name, similar dataset shall be the output of **_bidsify_** scripts. To test/demonstrate you may upload this/your dataset to above mentioned website and check the remarks.
   2. A raw dataset has been provided with 'raw' directory name. It contains anatomical and functional raw dicom images of 2 volunteers. This directory contains 2 sub-directories inside representing 2 datasets of 2 subjects.
   3. Set ‘bidsify’ as your current directory.
      `cd bidsify`
   4. Get inside raw/ directory, the output of ‘pwd’ command shall be something like this
      [deep@hp]─[~/raw]
   5. Use ll or ‘ls -la’ to long list the contents of ‘raw’ folder.
   6. First we rename the subject folder names, which will give folder names an identifier and will also anonymize folder names. Run following command
      ./rsub
   7. Then rename mprage and ep2d folders to anat and func folder
      ./rsequence
   8. We can now provide extensions to extensionless DICOM files
      ./mvdcm
   9. Now convert DICOMs to nifti using dcm2niix_afni utility
      ./convert
   10. Delete DICOM files
      ./deldcm (Check the result using tree command)
   11. Rename anat and func volumes to BIDS compliant file name specification.
      ./rvolume (Check the result using tree command)
   12. Add Task name field in functional metadata (.json) files to make it
      ./validator
   13. Please don’t rerun a command twice as it can create cause duplicate copies or errors. Running in the specified manner is recommended, but can be changed once we have the understanding of the scripts (quite easy to understand).
   14. It is better to create a new folder in which you shall paste the sub-1, sub-2, sub-3 ...sub-n folders. To successfully pass the BIDS validation the new folder (created in this step) must have a template (to-be-edit) dataset_description.json and README file. You can copy it from the scripts folder. Upload this folder to above mentioned website, I think it is better to not have scripts in this folder prior to upload step. Check wether this is a valid BIDS dataset. 

* Please edit the document if you feel some information is missing.
* You may create an issue in repository or create a pull request for further contribution.
