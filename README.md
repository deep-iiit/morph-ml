# morph-ml
## Description

This repository contains scripts which perform automated analysis and modeling of brain's morphometrical data.

This toolbox can be used to process brain's structural data (Gray and/or White matter data). For more information kindly go through the Wiki page (https://github.com/deep-iiit/morph-ml/wiki) of this toolbox. The research and DOI link will be available after publication.

---
## Contents

The morph-ml toolbox contains 3 utilities
- BIDS data management
- Automated brian's gray/white matter data analysis
- Machine learning based modeling of morphometrical data

---

## Tutorial

Brain's anatomical connectivity (white matter) information is collected using Diffusion Tensor Imaging technology. The analysis of DTI data was performed using Tract Based Spatial Statistics (TBSS). The scripts with name dti_[1-9]_xxxxxxx.sh are used for dti data analysis. Kindly make sure that shell scripts are executable, you may need to provide execution permission to these shell scripts which can be done using `chmod +x filename.sh` command
Execute the shell file by prefixing it with `./` These scripts are supposed to be run sequentially. The workflow should be something like this.

```
./dti_1_fslroi.sh

./dti_2_bet.sh

./dti_3_xxx.sh

...

./dti_9.sh
```

---

## Notes

1. There will be separate documentation for the toolbox which is under development.
2. All the scripts have inline-comments to serve the purpose of documentation and enhanced readability, kindly read the scripts to understand their usage.
3. For issues in comprehension kindly create a issue in project repository, which will be fixed and released in future releases.
