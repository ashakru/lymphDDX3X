## Bioinformatic analysis of DDX3X mutations in Burkitt Lymphoma

[![DOI](https://zenodo.org/badge/351418436.svg)](https://zenodo.org/badge/latestdoi/351418436)

### Manuscript

[Sequential inverse dysregulation of the RNA helicases DDX3X and DDX3Y facilitates MYC-driven lymphomagenesis.](http://dx.doi.org/10.2139/ssrn.3520953)  
Chun Gong, Joanna A Krupka ... Shamith Samarjiwa, Daniel J Hodson

### Highlights
- Loss-of-function mutations of DDX3X are enriched in MYC-driven B cell lymphomas.  
- Loss of DDX3X activity restrains the ability of MYC to drive global protein synthesis and proteotoxic stress in human germinal center B cells.  
- Protein synthesis capacity is restored in established male lymphomas by ectopic expression of the Y-chromosome homologue DDX3Y, expression of which is normally restricted to the testis.  
- DDX3Y is an induced, tumour-essential protein and an attractive therapeutic target in male lymphoma.  

### Abstract 

DDX3X is a ubiquitously expressed RNA helicase involved in multiple stages of RNA biogenesis. DDX3X is frequently mutated in Burkitt lymphoma but the functional basis for this is unknown. Here, we show that loss-of-function DDX3X mutations are also enriched in MYC-translocated diffuse large B cell lymphoma and reveal **functional co-operation between mutant DDX3X and MYC**. **DDX3X promotes translation of mRNAs encoding components of the core translational machinery, thereby driving global protein synthesis**. Loss-of-function DDX3X mutations moderate MYC-driven global protein synthesis, thereby buffering MYC-induced proteotoxic stress during early lymphomagenesis. Established lymphoma cells restore full protein synthetic capacity by aberrant expression of DDX3Y, a Y-chromosome homologue that is normally expressed exclusively in testis.  These findings show that DDX3X loss-of-function can buffer MYC-driven proteotoxic stress and highlight the capacity of male B cell lymphomas to then compensate for this loss by ectopic DDX3Y expression.  

### Content 

  `./01_mutationPattern`:
	Analysis scripts and data examining the distribution of DDX3X mutations in MYC-driven lymphomas and other cancer types 
  
  `./02_coIP`:
	Analysis of DDX3X binding proteins   
  
  `./03_iCLIP`:
	Analysis of DDX3X binding RNAs
  
  `./04_RiboSeq`:
	Analysis examining if DDX3X affects the translation of its targets
  
  `./05_Proteomics`:
	Analysis of mass spectrometry data following shRNA DDX3X knock-down and U2932 cells expressing DDX3X mutant or wild-type

  `./06_ProteomeHD`:
	Analysis of [Proteome HD](https://www.proteomehd.net) data related to DDX3X
  
  `./07_primaryGCB`:
	Analysis of transcriptional consequences of MYC overexpression in primary GC B-cells
  
  `./08_U2932clones`:
	Analysis of RNA-Seq dataset of U2932 cells expressing DDX3X mutant or wild-type 
  
  `./utilis`:
	Supplemmentary data and annotations used in the analysis above
	
### Raw sequencing data 

Targeted sequencing data has been deposited to EGA. Accession number: EGAS00001004649. 
RNA-seq and ribosome profiling data has been deposited to GEO. 
Accession numbers: GSE144983 and GSE143393. 
