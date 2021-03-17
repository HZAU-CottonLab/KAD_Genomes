
library(ggplot2)
library(plyr)

mydata <- read.table("A2_D5_K2_syntenicBlocks_Lens.txt",header=TRUE,row.names=1)

neworder <- c("Grot","Garb","Grai")

newdata <- arrange(transform(mydata,genome=factor(genome,levels=neworder)),genome)


ggplot(newdata,aes(genome,length,fill=genome))+geom_boxplot(outlier.colour ="grey60",outlier.size = 0.2)+
  ylim(c(0,25000000))+scale_fill_manual(values=c("blue","#FF2BA3","#00BFFF"))+
  theme(panel.background=element_rect(fill="white",color="black"),
        panel.grid.major = element_blank(),panel.grid.minor = element_blank())


