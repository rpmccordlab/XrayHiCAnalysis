# XrayHiCAnalysis
Custom scripts needed to calculate TAD boundaries with HiCRatio and to calculate Hi-C dataset reproducibility as implemented in the manuscript: Sanders et al. 2020 "Radiation-Induced DNA Damage and Repair Effects on 3D Genome Organization"

Code author: Yang Xu

HiC reproducibility: hic_reproducibility.R
script should be run in R or RStudio. To produce the results shown in the paper, user can run the code in the script line by line.
To test the code, the user can use the 3 2.5 Mb binned sample datasets provided.  Hi-C contact matrices should be in c-world format

Calling TADs by ratio method: TAD_Calling_By_Ratio.py
TAD calling by ratio is developed from Lazaris et al., 2017
https://bmcgenomics.biomedcentral.com/articles/10.1186/s12864-016-3387-6
Usage: python TAD_Calling_By_Ratio.py hic_contact_matrix_directory/ output_directory/ window_size
User needs to specify the directory where hic contact matrices are stored and the directory in which the user wants to save output files.
Hi-C contact matrices should be in c-world format as in the sample chromosome 22 40 kb matrix file included.
Parameter window_size defines the range (in number of bins) to call local peaks (TAD boundaries) in the interaction ratio. We use 10 in our analysis. 
