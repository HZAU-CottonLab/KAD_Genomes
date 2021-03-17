
library(ggplot2)
library(plyr)

data<-read.table("ThreeGenomes_IntergenicDist.txt",header=T)

neworder =c("K","A","D")

mydata <- arrange(transform(data,genome=factor(genome,levels=neworder)),genome)


q<-ggplot(mydata,aes(x=genome,y=log10(dist),fill=genome)) + 
  geom_violin()+  scale_fill_manual(values=c("blue","#FF2BA3","#00BFFF"))+
  geom_boxplot(fill="white",width=0.4,outlier.size = 0.1, outlier.color = "black")+
  theme(panel.background=element_rect(fill="white",color="black"),
        panel.grid.major = element_blank(),panel.grid.minor = element_blank())
q
