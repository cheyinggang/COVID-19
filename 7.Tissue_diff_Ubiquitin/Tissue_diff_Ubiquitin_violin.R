

require(ggplot2)
require(ggpubr)
rm(list = ls())
rt=read.table("Tissue_diff_Ubiquitin.txt",sep="\t",header=T,check.names=F) 
rt2=rt



head(rt2)
ggplot(rt2, aes(x=Segment, y=rt2$AVE_ubi, fill=Segment)) + 
  geom_violin(trim=FALSE)+
  geom_boxplot(width=0.1, fill="white")+
  labs(title="",x="", y = "Ubi_AVE")+theme_classic() +
  theme(axis.line=element_line(colour="black"))+theme(axis.title.x = element_blank())+
  theme(axis.title.y =  element_text(size = 15,vjust = 0.5,hjust = 0.5))+
  theme(axis.text.x = element_text(size = 15,angle = 45,vjust = 1,hjust = 1))+
theme(axis.text.y = element_text(size = 15))+
  theme(plot.title = element_text(hjust = 0.5,size=15,face="bold"))+
  theme(legend.position = "NA") +
  scale_fill_brewer(palette = "Set1")+ 
  stat_compare_means() 

ggsave("Figure_A.pdf",width = 4,height =4.5)



head(rt2)
summary(factor(rt2$Morphology))
ggplot(rt2, aes(x=Morphology, y=rt2$AVE_ubi, fill=Morphology)) + 
  geom_violin(trim=FALSE)+
  geom_boxplot(width=0.1, fill="white")+
  labs(title="",x="Morphology", y = "Ubi_AVE")+ theme_classic()+ 
  theme(axis.line=element_line(colour="black"))+theme(axis.title.x = element_blank())+
  theme(axis.title.y =  element_text(size = 15,vjust = 0.5,hjust = 0.5))+
  theme(axis.text.x = element_text(size = 15,angle = 45,vjust = 1,hjust = 1))+
  theme(axis.text.y = element_text(size = 15))+
  theme(plot.title = element_text(hjust = 0.5,size=15,face="bold"))+
  scale_fill_brewer(palette = "Set1")+
  theme(legend.position = "NA") + 
  stat_compare_means()

ggsave("Figure_B.pdf",width = 8,height =5.25)








