



library(ggplot2)

library(plyr)


mydata <- read.table("ThreeGenomes_TAD_size.300K-3M.txt",header=T) 

neworder =c("D","A","K")

newdata <- arrange(transform(mydata,genome=factor(genome,levels=neworder)),genome)

ggplot(newdata,aes(genome,size,fill=genome))+geom_violin(aes(fill=genome))+
  scale_fill_manual(values=c("#FF2BA3","#00BFFF","blue"))+
  geom_boxplot(fill="white",width=0.2,outlier.size = 0.1, outlier.color = "black")+
  theme(panel.background=element_rect(fill="white",color="black"),
        panel.grid.major = element_blank(),panel.grid.minor = element_blank())



library(ggplot2)

library(plyr)



mydata <- read.table("ThreeGenomes_genes_compartment_FPKM.txt",header=T) 

neworder <- c("D","A","K")

newdata <- arrange(transform(mydata,genome=factor(genome,levels=neworder)),genome)

ggplot(newdata,aes(genome,log2(FPKM+0.1),fill=status)) + 
  geom_boxplot(size=0.5,alpha=1,width=0.9,outlier.size = 0.2,outlier.color ="grey")+
  ylab("FPKM")+ylim(c(0,10))


 
#====New Figures====
library(ggplot2)

library(plyr)

mydata <- read.table("ThreeGenomes_genes_Switching_FPKM.txt",header=T) 

neworder <- c("K","A","D")
 
newdata <- arrange(transform(mydata,genome=factor(genome,levels=neworder)),genome)

ggplot(newdata,aes(genome,FPKM,fill=genome))+
    geom_boxplot(size=0.5,alpha=1,width=0.9,outlier.size = 0.2,outlier.color ="grey",show.legend = FALSE)+
	scale_fill_manual(values=c("blue","#FF2BA3","#00BFFF"))+facet_wrap(~status,nco=2,scales="free")+ylab("log2(FPKM+0.1)")+
     theme(panel.background=element_rect(fill="white",color="black"), panel.grid.major = element_blank(),panel.grid.minor = element_blank())



