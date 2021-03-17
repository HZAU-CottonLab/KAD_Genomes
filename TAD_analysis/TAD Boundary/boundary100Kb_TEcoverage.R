library(ggplot2)
library(plyr)


data<-read.table("ThreeGenomes_TADboundary100Kb_TEcoverage.txt",header=T)

neworder =c("K","A","D")

newdata <- arrange(transform(data,genome=factor(genome,levels=neworder)),genome)

ggplot(newdata,aes(genome,TEcoverage,fill=type))+
  geom_boxplot(outlier.size = 0.2, outlier.color = "grey60")+
  theme(panel.background=element_rect(fill="white",color="black"),
        panel.grid.major = element_blank(),panel.grid.minor = element_blank())+
  scale_fill_manual(values=c("#00BFFF","#EEC900"))

