library(ggplot2)
library(plyr)



data<-read.table("f:/ggplot_data_projects/ggplot_data_3genomes/threegenomes_LTRs_MYA.txt",header=T)

q<-ggplot(data,aes(x=year,y=..density..,colour=genome)) + 
  geom_line(stat="density",size=0.8) +
  theme_bw()+
  geom_step(aes(y=..y..,color=genome),stat="ecdf",size=0.6)+
  theme_bw()+
  xlab("MYA")+xlim(c(0,10))+
  theme(legend.position="right")
q






data<-read.table("f:/ggplot_data_projects/ggplot_data_3genomes/ThreeGenome_LTR-TE_MYA_types_noCopia.txt",header=T)

# mydata <- subset(data,type="Gypsy" || type="TIR" || type="LARD" || type="DIRS")

neworder = c("Gypsy","DIRS","LARD","TIR")

newdata <- arrange(transform(data,type=factor(type,levels=neworder)),type)

ggplot(newdata,aes(x=year,y=..density..,color=genome)) + geom_line(stat="density",size=0.8)+
  facet_wrap(~type,scales="free")+xlim(c(0,10))+
  theme(panel.background=element_rect(fill="white",color="black"),
        panel.grid.major = element_blank(),panel.grid.minor = element_blank())+
  scale_color_manual(values=c("#FF2BA3","#00BFFF","blue"))



