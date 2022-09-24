

rm(list = ls())
rt=read.table("diff_Ubi_time.txt",sep="\t",header=T,check.names=F,row.names = 1)    
rt1=rt[,-1]
rt1=t(rt1)
rt1=log2(rt1+1)
rt2=rt1[rowMeans(rt1)>0,]
library(ggpubr)
library(pheatmap)
Type=as.data.frame(rt[,1])
colnames(Type)=c("group")
rownames(Type)=colnames(rt1)
summary(factor(Type[,1]))
colP<-c('green4',
        'yellow','#FB9A99',   'red')
pdf(file = "heatmap.pdf",width = 6,height =7)
pheatmap(rt2, annotation_col=Type,gaps_col = c(2),
         color =colP,
         cluster_rows = T,
         cluster_cols =F,
         fontsize=12,
         fontsize_row=8,
          scale="row",
         show_colnames=F,
        show_rownames=F,
         fontsize_col=3)
dev.off()

 