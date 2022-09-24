

rm(list = ls())
rt=read.table("UbiGene_Anno_GSE162911.txt",sep="\t",header=T,row.names=1,check.names=F)   
rt1=rt[,-(1:12)]
rt1=t(rt1)
rt1=log2(rt1+1)
rt2=rt1[rowMeans(rt1)>0,]
library(ggpubr)
library(pheatmap)
Type=as.data.frame(rt[,1:12])
summary(factor(Type[,10]))
library(ComplexHeatmap)
ha = HeatmapAnnotation(df=Type)
rt2=as.data.frame(rt2)
colP<-c('green4','yellow','#FB9A99',   'red')

Heatmap(rt2, name = "expression",show_row_names = F,cluster_columns = F,
        show_column_names = F,col = colP,
        column_title = NULL,bottom_annotation =  ha
)


