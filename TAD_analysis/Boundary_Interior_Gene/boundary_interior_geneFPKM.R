

library(ggplot2)
library(plyr)


data <- read.table("ThreeGenomes_genesInBoundaryInterior_FPKM.txt",header=T)

neworder =c("D","A","K")

mydata <- arrange(transform(data,genome=factor(genome,levels=neworder)),genome)

ggplot(mydata,aes(genome,TEratio,fill=stats))+
    geom_boxplot(outlier.size = 0.2, outlier.color = "grey60")+
    theme(panel.background=element_rect(fill="white",color="black"),
          panel.grid.major = element_blank(),panel.grid.minor = element_blank())+
    scale_fill_manual(values=c("#4AABC6","#F68B32"))+ylab("Percentage of TE in gene 5kb")+xlab("")
	

library(ggplot2)
library(plyr)

data <- read.table("A-D-K.A.Compartment.FPKM.txt",header=T)

neworder =c("K","A","D")

mydata <- arrange(transform(data,genome=factor(genome,levels=neworder)),genome)

ggplot(mydata,aes(genome,log2(FPKM+0.1),fill=stats))+
  geom_boxplot(outlier.shape = NA)+ylim(c(-3,10))+
  theme(panel.background=element_rect(fill="white",color="black"),
        panel.grid.major = element_blank(),panel.grid.minor = element_blank())+
  scale_fill_manual(values=c("#00BFFF","#EEC900"))+ylab("Normalized gene expression")+xlab("")
  
#==========Conserved and specific TAD  in genes number==================
data <- read.table("ThreeGenomes_TADboundary100Kb_geneNumber_Evolution.txt",header=T)

neworder =c("K","A","D")

mydata <- arrange(transform(data,genome=factor(genome,levels=neworder)),genome)

ggplot(mydata,aes(genome,number,fill=type))+
	geom_boxplot(outlier.size = 0.2, outlier.color = "grey60")+
	theme(panel.background=element_rect(fill="white",color="black"),
    panel.grid.major = element_blank(),panel.grid.minor = element_blank())+
    scale_fill_manual(values=c("#00BFFF","#EEC900"))+ylab("Number of gene")+xlab("")
	
	
	
	
	
	
	
	
	
	