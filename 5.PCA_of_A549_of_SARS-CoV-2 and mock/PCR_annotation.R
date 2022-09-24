rm(list=ls())

rt2=read.table("A549_SARS-CoV-2_ubi.txt",sep="\t",header=T,check.names=F) 
rownames(rt2)<-rt2[,1]
rt2<-rt2[,2:ncol(rt2)]
rt2=rt2[(order(rt2[,1])),]
summary(factor(rt2[,1]))
rt1=rt2[,4:ncol(rt2)]
rts=log2(rt1+1)
rt=as.matrix(rts)  
group=rt2[,1]
df=cbind(as.data.frame(rt),group=rt2[,1])
head(df)
pca_dat3 <- prcomp( df[,1:(ncol(df)-1)], rank. = 3)
library(factoextra)
colP<-c( 'pink',  '#FF7F00',  'orchid', '#99c9fb','dodgerblue2',
        'yellow','green4',   'red','#FB9A99')
fviz_pca_ind(pca_dat3,geom.ind="point",pointsize=4,
             pointshape=21,fill.ind=group,ellipse.type = "confidence",
             palette=c('#FB9A99','green4'),
             legend.titl="Groups",
             title="PCA of Ubiquitin gene")+theme_classic()
ggsave(filename="1.PCA.pdf",width =5,height =3) 

group=rt2[,3]
df=cbind(as.data.frame(rt),group=rt2[,3])
head(df)
pca_dat3 <- prcomp( df[,1:(ncol(df)-1)], rank. = 3)
library(factoextra)
fviz_pca_ind(pca_dat3,geom.ind="point",pointsize=4,
             pointshape=21,fill.ind=group,ellipse.type = "confidence",
             palette=colP,
             legend.titl="Groups",
             title="PCA of Ubiquitin gene")+theme_classic()
ggsave(filename="2.PCA.pdf",width =5,height =3) 

