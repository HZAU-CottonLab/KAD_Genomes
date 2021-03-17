library(ggplot2)
library(plyr)
##All intact LTR
data<-read.table("ThreeGenome_LTR-TE_MYA_plus.txt",header=T)

q<-ggplot(data,aes(x=year,y=..density..,colour=genome))+geom_line(stat="density",size=0.8)+
theme_bw()+geom_line(stat="density",size=0.8)+xlim(c(0,5))+
theme(panel.background=element_rect(fill="white",color="black"),panel.grid.major = element_blank(),panel.grid.minor = element_blank())+
scale_color_manual(values=c("#FF2BA3","#00BFFF","blue"))
q

##Four types
data<-read.table("ThreeGenome_LTR-TE_MYA_4types.txt",header=T)

# mydata <- subset(data,type="Gypsy" || type="Copia" || type="LARD" || type="DIRS")

neworder = c("Gypsy","DIRS","LARD","Copia")

newdata <- arrange(transform(data,type=factor(type,levels=neworder)),type)

ggplot(newdata,aes(x=year,y=..density..,color=genome)) + geom_line(stat="density",size=0.8,show.legend = FALSE)+
    facet_wrap(~type,scales="free",nco=2)+xlim(c(0,10))+
    theme(panel.background=element_rect(fill="white",color="black"),
          panel.grid.major = element_blank(),panel.grid.minor = element_blank())+
    scale_color_manual(values=c("#FF2BA3","#00BFFF","blue"))



