

rm(list = ls())

rt=read.table("diff_Ubi_time.txt",sep="\t",header=T,row.names=1,check.names=F)   
rt1=rt[,-1]
rt1=t(rt1)
library(pheatmap)
Type=as.data.frame(rt[,1])
colnames(Type)=c("group")
rownames(Type)=colnames(rt1)
pdf(file = "heatmap.pdf",width = 4,height = 8)
pheatmap(rt1, annotation_col=Type,
         color =colorRampPalette(c("green4", "white", "red2"))(50),
         cluster_rows = T,
         cluster_cols =F,
         fontsize=12,
         fontsize_row=8,
         show_colnames=F,
        show_rownames=F,
         fontsize_col=3)

dev.off()

