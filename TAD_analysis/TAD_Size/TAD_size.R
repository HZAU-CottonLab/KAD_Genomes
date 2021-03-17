
library(ggplot2)

mydata <- read.table("All_ABcompartment_genes_FPKM6.txt",header=T) 

neworder =c("GhAt_AtoB","GhAt_BtoA","GhDt_AtoB","GhAt_BtoA",
            "GbAt_AtoB","GbAt_BtoA","GbDt_AtoB","GbDt_BtoA")

newdata <- arrange(transform(mydata,Type=factor(Type,levels=neworder)),Type)

cbPalette <- c("#EEC900","#EEC900","#CD4F39","#CD4F39","#0000FF","#0000FF","#008B00","#008B00")

ggplot(mydata,aes(Type,log(Ratio),fill=Type))+
  geom_boxplot(size=0.5,alpha=1,width=0.9,outlier.size = 0.2,outlier.color ="grey")+
  ylim(c(-3,3))+theme_bw()+scale_fill_manual(values=cbPalette)


mydata <- read.table("All_ABstable_FPKM_ratio7.txt",header=T) 

ggplot(mydata,aes(Type,log(Ratio),fill=Type))+
  geom_boxplot(size=0.5,alpha=1,width=0.9,outlier.size = 0.2,outlier.color ="grey")+
  ylim(c(-3,3))+theme_bw()


mydata <- read.table("f:/ggplot_data_3Dgenome/All_AB_compartment_Switch_Ratio.txt",header=T) 

cbPalette <- c("#EEC900","#EEC900","#EEC900","#CD4F39","#CD4F39","#CD4F39","#0000FF",
               "#0000FF","#0000FF","#008B00","#008B00","#008B00")

ggplot(mydata,aes(Type,log(Ratio),fill=Type))+
  geom_boxplot(size=0.5,alpha=1,width=0.9,outlier.size = 0.2,outlier.color ="grey")+
  ylim(c(-3,3))+theme_bw()+scale_fill_manual(values=cbPalette)





library(ggplot2)
library(plyr)


mydata <- read.table("ThreeGenomes_TAD_size.300K-3M.txt",header=T) 

neworder =c("K","A","D")

newdata <- arrange(transform(mydata,genome=factor(genome,levels=neworder)),genome)

ggplot(newdata,aes(genome,size,fill=genome))+geom_violin(aes(fill=genome))+
  scale_fill_manual(values=c("#FF2BA3","#00BFFF","blue"))+
  geom_boxplot(fill="white",width=0.2,outlier.size = 0.1, outlier.color = "black")+
  theme(panel.background=element_rect(fill="white",color="black"),
        panel.grid.major = element_blank(),panel.grid.minor = element_blank())

ggplot(newdata,aes(genome,size,fill=genome))+geom_boxplot(outlier.colour ="grey60",outlier.size = 0.2)+
  scale_fill_manual(values=c("blue","#FF2BA3","#00BFFF"))+
  theme(panel.background=element_rect(fill="white",color="black"),
      panel.grid.major = element_blank(),panel.grid.minor = element_blank())

	  
3*3







