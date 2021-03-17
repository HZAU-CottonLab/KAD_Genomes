library(ggplot2)
library(plyr)
#===========Gene number in TAD boundary 100 Kb=============================
data<-read.table("ThreeGenomes_TADboundary100Kb_geneNumber.txt",header=T)
neworder =c("K","A","D")
newdata <- arrange(transform(data,genome=factor(genome,levels=neworder)),genome)
ggplot(newdata,aes(genome,number,fill=genome))+geom_boxplot(outlier.colour ="grey60",outlier.size = 0.2)+
  scale_fill_manual(values=c("blue","#00BFFF","#FF2BA3"))+
  theme(panel.background=element_rect(fill="white",color="black"),
      panel.grid.major = element_blank(),panel.grid.minor = element_blank())
	  
#==========Gene number in conserved and specific TAD boundary 100 Kb========
data <- read.table("ThreeGenomes_Conserved_Specific_TADboundary100Kb_geneNumber.txt",header=T)
neworder =c("K","A","D")
mydata <- arrange(transform(data,genome=factor(genome,levels=neworder)),genome)
ggplot(mydata,aes(genome,number,fill=type))+
	geom_boxplot(outlier.size = 0.2, outlier.color = "grey60")+
	theme(panel.background=element_rect(fill="white",color="black"),
    panel.grid.major = element_blank(),panel.grid.minor = element_blank())+
    scale_fill_manual(values=c("#00BFFF","#EEC900"))+ylab("Number of gene")+xlab("")
	
#=======Expressed TEs (active) in TAD boundary 100 Kb========================
data<-read.table("Activated_TE_in_TADboundary.txt",header=T)
neworder =c("K","A","D")
newdata <- arrange(transform(data,genome=factor(genome,levels=neworder)),genome)
ggplot(newdata,aes(genome,number,fill=genome))+geom_boxplot(outlier.colour ="grey60",outlier.size = 0.2)+
  scale_fill_manual(values=c("blue","#00BFFF","#FF2BA3"))+
  theme(panel.background=element_rect(fill="white",color="black"),
      panel.grid.major = element_blank(),panel.grid.minor = element_blank())

#====Expressed TEs (active) in conserved and specific TAD boundary 100 Kb====
data <- read.table("Activated_TE_in_conserved_specific_TADboundary.txt",header=T)
neworder =c("K","A","D")
mydata <- arrange(transform(data,genome=factor(genome,levels=neworder)),genome)	  
	  ggplot(mydata,aes(genome,log2(RPKM+0.1),fill=type))+
    geom_boxplot(outlier.size = 0.2, outlier.color = "grey60")+
    theme(panel.background=element_rect(fill="white",color="black"),
          panel.grid.major = element_blank(),panel.grid.minor = element_blank())+
    scale_fill_manual(values=c("#00BFFF","#EEC900"))+ylab("log2(RPKM+0.1)")+xlab("") 
	 	
#========A/B compartment in conserved and specific TAD boundary 100 Kb========
data <- read.table("A-D-K.conserved_specific.ABgeneratio.txt",header=T)
neworder =c("K","A","D")
mydata <- arrange(transform(data,genome=factor(genome,levels=neworder)),genome)
ggplot(mydata,aes(genome,Coverage,fill=status))+
    geom_boxplot(outlier.size = 0.2, outlier.color = "grey60")+
    theme(panel.background=element_rect(fill="white",color="black"),
          panel.grid.major = element_blank(),panel.grid.minor = element_blank())+
    scale_fill_manual(values=c("#00BFFF","#EEC900"))+ylab("Compartment coverage")+xlab("")+ylim(c(0.001,1))+facet_wrap(~type,nco=2,scales="free")

	
	
	
	
	
	
	
	
	
	
	
	 
	 
	 
	 
	 