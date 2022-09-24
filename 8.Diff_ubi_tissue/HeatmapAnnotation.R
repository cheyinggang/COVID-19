


rm(list = ls())

rt=read.table("1.ubi_GSE182299.txt",sep="\t",header=T,row.names=1,check.names=F) 

rt1=rt[,-(1:3)]
rt1=t(rt1)
dimnames=list(rownames(rt1),colnames(rt1))
rt1=matrix(as.numeric(as.matrix(rt1)),nrow = nrow(rt1),dimnames = dimnames)
rt1=log2(rt1+1)
rt2=rt1[rowMeans(rt1)>0,]
library(ggpubr)
Type=as.data.frame(rt[,1:3])

library(ComplexHeatmap)
ha = HeatmapAnnotation(df=Type)

rt2=as.data.frame(rt2)
colP<-c('green4','yellow','#FB9A99',   'red')
pdf(file = "heatmap_20.pdf",width = 7,height = 4)
Heatmap(rt2, name = "expression",show_row_names = T,
        show_column_names = F,cluster_columns =F,col = colP,
        column_title = NULL,bottom_annotation =  ha
)
dev.off()


rt$Ubi=log2(rt$AVE_Ubi+1)
head(rt)
summary(factor(rt$Histologic_origin))
ggplot(rt, aes(x=Histologic_origin, y=Ubi, color=Histologic_origin)) + 
  geom_boxplot()+
  geom_jitter(position=position_jitter(0.2))+
  labs(title="",x="", y = "log2(Ubi_AVE+1)")+ 
  theme_classic()+ 
  scale_color_brewer(palette="Dark2") + 
  theme_classic()  + 
  theme(axis.title.y =  element_text(size = 15,vjust = 0.5,hjust = 0.5))+
  theme(axis.text.x = element_text(size = 15,angle = 45,vjust = 1,hjust = 1))+
  theme(axis.text.y = element_text(size = 15))+
  theme(plot.title = element_text(hjust = 0.5,size=15,face="bold"))+
  theme(legend.position = "NA") +
  stat_compare_means() 
ggsave("diff_plot.pdf",width =5,height =4.5)


