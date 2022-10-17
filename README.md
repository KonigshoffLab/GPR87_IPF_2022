### <div align='center' ><font size='70'>Single cell RNA Sequencing Identifies G-protein Coupled Receptor 87 as a Basal Cell Marker Expressed in Distal Honeycomb Cysts in Idiopathic Pulmonary Fibrosis </font></div>

<p align = "center"> <font size=3><i>European Respiratory Journal 2022 59: 2102373; DOI:10.1183/13993003.02373-2021</i></font>
 
</p>




<p align = "justify"> 
Idiopathic Pulmonary Fibrosis (IPF) is a devastating and life-threatening lung disease characterized by epithelial reprogramming and increased extracellular matrix deposition leading to loss of lung function. A prominent histopathological structure in the distal IPF lung include honeycomb cysts in the alveolar space. These are heterogeneous bronchiolized areas that feature clusters of simple epithelium with Keratin (KRT)5<sup>+</sup> basal-like cells interspersed with pseudostratified epithelium containing differentiated, hyperplastic epithelial cells as well as aberrant ciliated cells. Recent single-cell RNA sequencing studies of the lung epithelium shed further light into cellular subtypes unique to IPF, including basaloid KRT5<sup>-</sup>/KRT17<sup>+</sup> cells present in the distal lung. However, IPF distal bronchiole KRT5<sup>+</sup> basal cell subtypes still remain poorly characterized and their disease contribution remains under-investigated. Using single-cell RNA sequencing of enriched EpCAM<sup>+</sup> lung cells of the distal IPF lung, we identified  G-protein coupled receptor (GPR) 87 as a marker of distal bronchioles and KRT5<sup>+</sup> basal-like cells in IPF. 
</p>


<div align="center">
<img src=https://github.com/KonigshoffLab/GPR87_IPF_2022/blob/main/Figures/readme.png width = "500" height = "450" alt="readme"  />
</div>

### <div align='left' ><font size='35'>Methods of single-cell RNA sequencing data analysis </font></div>

<p align = "justify"> 
Following sequencing, the generation of count matrices was performed by using the Cell Ranger computational pipeline from 10x Genomics (v3.1.0, STAR v2.5.3a). The reads were aligned to the hg38 human reference genome (GRCh38.97). Downstream analysis was performed using the Scanpy package (v1.8.0) [1]. We assessed the quality of our libraries and excluded barcodes with either less than 400 genes detected and retained those with number of transcripts between 1000 to maximal 20 000. We further removed cells with high proportion (> 15%) of transcript counts derived from mitochondria-encoded genes. Genes were only considered if they were expressed in at least 3 cells in the data set. To mitigate effects of background mRNA contamination, we employed the R library SoupX [2]. We manually set the contamination fraction to 0.3 and corrected the count matrices with adjustCounts(). The expression matrices were normalized with scran’s size factor based approach [3] and log transformed via scanpy’s pp.log1p() function. Variable genes were selected patient-wise (flavor = “cell_ranger”), excluding known cell cycle genes. Those genes being ranked among the top 4,000 in at least 3 samples were used as input for principal component analysis (3,426 genes). Clustering was performed via scanpy’s leiden method at resolution 2 and cell types were manually annotated based on known marker genes. We encountered one cluster marked by high number of mitochondrial transcripts, and another cluster by high doublet scores as calculated sample-wise with scrublet [4] and excluded both of these clusters. The UMAP visualization was obtained after computing a batch-balanced k-nearest neighbor graph with bbknn [5] by defining the individual patient as batches and setting n_pcs = 20, neighbors_within_batch = 4. The final object encompassed 17,111 genes across 46,199 cells. R packages including EnhancedVolcano (v1.12.0), pheatmap (v1.0.12) and ggplot2 (v 3.3.5) were used to generate figures. The raw data have been deposited in NCBI's Gene Expression Omnibus with accession number GSE190889. 
</p>

### <div align='left' ><font size='35'>References </font></div>

>1.	Wolf FA, Angerer P, Theis FJ. SCANPY: large-scale single-cell gene expression data analysis. Genome Biol 2018: 19(1): 15.<br>
>2.	Young MD, Behjati S. SoupX removes ambient RNA contamination from droplet-based single-cell RNA sequencing data. Gigascience 2020: 9(12).<br>   
>3.	Lun AT, McCarthy DJ, Marioni JC. A step-by-step workflow for low-level analysis of single-cell RNA-seq data with Bioconductor. F1000Res 2016: 5: 2122.<br> 
>4.	Wolock SL, Lopez R, Klein AM. Scrublet: Computational Identification of Cell Doublets in Single-Cell Transcriptomic Data. Cell Syst 2019: 8(4): 281-291 e289.<br> 
>5.	Polanski K, Young MD, Miao Z, Meyer KB, Teichmann SA, Park JE. BBKNN: fast batch alignment of single cell transcriptomes. Bioinformatics 2020: 36(3): 964-965.<br>
  
