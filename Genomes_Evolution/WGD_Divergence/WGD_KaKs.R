library(ggplot2)
library(plyr)

data<-read.table("Threegenomes_Compare_WGD_KaKs.txt",header=T)

mydataWGD <- subset(data,type =="A" | type =="D" | type =="K")
mydataSP <- subset(data,type =="AvsK" | type =="DvsA" | type =="DvsK")

ggplot(mydataSP,aes(x=Ks,y=..density..,colour=type)) + 
  geom_line(stat="density",size=0.8) +
  theme_bw()+
  xlab("Ks")+xlim(c(0,0.2))+ylim(c(0,30))+
  theme(panel.background=element_rect(fill="white",color="black"),
        panel.grid.major = element_blank(),panel.grid.minor = element_blank())


ggplot(mydataWGD,aes(x=Ks,y=..density..,colour=type)) + 
  geom_line(stat="density",size=0.8) +
  theme_bw()+ylim(c(0,2.5))+
  xlab("Ks")+xlim(c(0,2))+scale_color_manual(values=c("#FF2BA3","#00BFFF","blue"))+
  theme(panel.background=element_rect(fill="white",color="black"),
        panel.grid.major = element_blank(),panel.grid.minor = element_blank())