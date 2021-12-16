# R code
# Qianjiang Hu
# This code will generate Fig.L
# 2021-12-16

#####

##  -------- load packages  -----
library('ggplot2')
library('dplyr')

## load data
### read in data generated from GPR87 correlation analysis and the gene fucntion enrichment analysis
df <- read.delim('/enrichment_GPR87_positive_corrGenes_old_IPF.txt', sep = '\t')
df_s <- df[df$p_value<0.01,]
df_s <- arrange(df_s,p_value)
rownames(df) <- df$name
df_2 <- df_s[c(1,10,14,17,24,28,32,37,64,65,66,71,81,92,97),]
df_2 <- arrange(df_2, -recall, p_value)

## generate the plot
ggplot(df_2) + 
  geom_point(aes(x = recall, y = name, color = log10(p_value), size = intersection_size))+
  scale_y_discrete(limits=rev(df_2$name))+ 
  scale_size(range = c(1, 10),name = 'Gene Overlap',
             limits = c(0,170), breaks = c(10, 30, 70,170))+
  labs(x='Gene Ratio',y=NULL,title=NULL)+
  scale_color_gradient(low = 'cyan', high = '#FC01B7')+
  scale_x_continuous(breaks = seq(0,0.2,0.05))+
  theme_bw()+theme(panel.border = element_rect(color = 'black', size = 1),
                   panel.grid.major.x = element_blank(),
                   panel.grid.minor = element_blank(),
                   panel.grid.major.y = element_line(linetype = 2,color = "grey"),
                   axis.title = element_text(size = 17, face = 'bold'),
                   axis.text.x = element_text(size = 16, color = 'black', angle = 45,
                                              hjust = 0.4, vjust = 0.5),
                   axis.text.y = element_text(size = 17, color = 'black',face = 'bold'),
                   legend.title = element_text(size = 14, face = 'bold'),
                   legend.text = element_text(size = 14)) +
  labs(color = guide_legend(title = "Log10(p-value)"))

