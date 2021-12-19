# R code
# Qianjiang Hu
# This code will generate Fig.1C
# 2021-12-16

##  -------- load packages  -----
library('openxlsx')
library(EnhancedVolcano)
library(grid)
library(dplyr)
library(pheatmap)
library(RColorBrewer)

## load data
### read in data generated from DEG analysis
de_whole_hea_IPF <- read.csv('DEG_whole_oldvsIPF_MKcorhort_noCycleRegr.csv')
de_whole_hea_IPF = de_whole_hea_IPF[de_whole_hea_IPF$mean>0.02,]
nrow(de_whole_hea_IPF);head(de_whole_hea_IPF)

## generate volcano plot
new <- de_whole_hea_IPF
EnhancedVolcano(new,
                lab = new$gene,
                x = 'log2fc',
                y = 'qval',
                xlab = bquote(~Log[2]~ 'fold change'),
                ylab = bquote(~-Log[10] ~ italic(q)),
                axisLabSize = 28,
                pCutoff = 0.05,
                FCcutoff = 0.6,
                pointSize = 2,
                labSize = 3,
                colAlpha = 1,
                legendPosition = 'right',
                legendLabSize = 28,
                legendIconSize = 4.0,
                drawConnectors = TRUE,
                widthConnectors = 0.5,
                gridlines.major = FALSE,
                gridlines.minor = FALSE,
                xlim = c(-6,6),
                ylim = c(0,17),
                legendLabels = c("NS", expression(Log[2] ~ FC), "q-value", expression("q-value" ~ and
                                                                                      ~ log[2] ~ FC)),
                title = NULL,
                subtitle = NULL,
                captionLabSize = 20,
                hline = c(10e-7),
                #vline = c(4.6),
                vline = c(3.95,4.24,4.8)
)+ 
  geom_segment(x = 4.6, xend = 6.5,y = 6,yend = 6, linetype="dashed",
               size = 0.3)+
  geom_segment(x = 4.6, xend = 6.5,y = 17,yend = 17, linetype="dashed",
               size = 0.3)+
  geom_segment(x = 4.6, xend = 4.6,y = 6,yend = 16.7, linetype="dashed",
               size = 0.3)+
  geom_segment(x = 6.5, xend = 6.5,y = 6,yend = 16.7, linetype="dashed",
               size = 0.3)

grid.text('Correlation Coefficient', x = 0.76, y = 0.74, gp=gpar(fontsize=28, font = 2))
grid.text('KRT5', x = 0.48, y = 0.93, gp=gpar(fontsize=13, font = 2))
grid.text('GPR87', x = 0.44, y = 0.895, gp=gpar(fontsize=13, font = 2))
grid.text('KRT17', x = 0.4, y = 0.93, gp=gpar(fontsize=13, font = 2))

##################################

## select high-expressed genes in volcano plot ---
head(de_whole_hea_IPF)
high_gene = de_whole_hea_IPF[de_whole_hea_IPF$log2fc>0.6 & de_whole_hea_IPF$qval < 0.001,]
high_gene = arrange(high_gene, -log2fc, na.last = NA)
nrow(high_gene)

## select Top15 of log2FC genes
sub_data <- high_gene[c(1:15),]['log2fc']
rownames(sub_data) <- high_gene_s$gene
colnames(sub_data) <- 'Log2FC'

### Set colors
color <- colorRampPalette(c(brewer.pal(11,'RdYlBu')[4], "red3"))(100)
### ploting
pheatmap(sub_data,cluster_cols = F, cluster_row = F,
         col = color,border_color = NA,
         fontsize = 11,
         fontsize_col = 16)
grid.text('Log2FC', x = 0.87, y = 0.72, gp=gpar(fontsize=11, font = 2))

##################################################################
## select Top 15 transmembrane signalling receptor activity Genes (GO:0004888)

### read in GO:0004888 genelist
tsr <- read.delim('GO_term_summary_20211119_150031.txt',
                  sep = '\t', header = TRUE, row.names = NULL)
tsr <- toupper(unique(tsr$MGI.Gene.Marker.ID))
inte <- intersect(high_gene$gene, tsr)
inte = inte[c(1:15)]
inte_tb <- de_whole_hea_IPF[de_whole_hea_IPF$gene %in% inte,]
inte_tb = arrange(inte_tb, -log2fc, na.last = NA)
sub_data <- inte_tb['log2fc']
rownames(sub_data) <- inte_tb$gene
colnames(sub_data) <- 'Log2FC'

### Set colors
color <- colorRampPalette(c(brewer.pal(10,'Set3')[8],brewer.pal(10,'Set3')[10]))(100)
### ploting
pheatmap(sub_data,cluster_cols = F, cluster_row = F,
         breaks = seq(3, 6, length = 100), 
         col = color,border_color = NA,
         fontsize = 11,
         fontsize_col = 16)
grid.text('Log2FC', x = 0.85, y = 0.71, gp=gpar(fontsize=11, font = 2))

