
library(dplyr)
library(RODBC)
library(plotrix)
library(plot3D)
library(networkD3)
library(ggplot2)
odbcDataSources()
db1<-odbcConnect('10.201.20.73',uid = "sa",pwd = "123456")
db2<-odbcConnect('10.201.20.100',uid = "sa",pwd = "Data123456")
#一食堂数据
c103<-sqlQuery(db2,'select * from c103')
c104<-sqlQuery(db2,'select * from c104')
#二食堂数据
c203<-sqlQuery(db2,'select * from c203')
c204<-sqlQuery(db2,'select * from c204')
#三食堂数
c303<-sqlQuery(db2,'select * from c303')
c304<-sqlQuery(db2,'select * from c304')
#四食堂数据
c403<-sqlQuery(db2,'select * from c403')
c404<-sqlQuery(db2,'select * from c404')
data_c1<-sqlQuery(db2,'select * from data_c1')
data_c2<-sqlQuery(db2,'select * from data_c2')
data_c3<-sqlQuery(db2,'select * from data_c3')
data_c4<-sqlQuery(db2,'select * from data_c4')
#读取图书馆的数据
tsg<-sqlQuery(db2,'SELECT [姓名],[题名] FROM [DataSicence].[dbo].[library_data]')
table(c303$年级)
table(c304$年级)
head(c303)
head(c304)

#数据合并
collage<-d3$学院
Mar<-d3$三月
d4<-c304 %>% group_by(学院) %>% summarise(四月=n())
Apr<-d4$四月
dt1<-data.frame(collage,Mar,Apr)
head(dt1)


#分区显示
par(mfrow=c(2,2))
par(mfrow=c(1,2))

barchart(table(c303$学院))
#饼状图
pie3D(table(c303$年级),labels = names(table(c303$年级)),
      explode = 0.1,main="各年级刷卡次数饼状图",labelcex =0.8)
#数据处理
d1<-c303 %>% group_by(年级) %>% summarize(平均消费额=mean(交易额))
d2<-c304 %>% group_by(年级) %>% summarize(平均消费额=mean(交易额))
#柱状图
p1<-ggplot(d1,aes(x=年级,y=平均消费额,fill=as.factor(年级)))+
  geom_bar(stat="identity")+
  geom_text(aes(label=round(平均消费额,2)),vjust=-1,colour="black")
#风筝图
d3<-c303 %>% group_by(学院) %>% summarise(三月=n())
d4<-c304 %>% group_by(学院) %>% summarise(四月=n())
p2<-ggplot(d3,aes(学院,交易次数,fill=factor(学院)))+geom_bar(stat="identity",width = 1)+coord_polar()+
  geom_text(aes(label=round(交易次数)),vjust=0,colour="black")
ggplot(d3,aes(学院,交易次数,fill=mylabel))+geom_bar(stat="identity",width = 1)+coord_polar()+
    labs(x = "", y = "", title = "三月份各学院三月份交易量")+scale_fill_discrete()+
    geom_text(aes(label=round(交易次数)),vjust=0,colour="black",size=5)

pie(school103,col = brewer.pal(12,"Set3"),round(school103/sum(school103)*100,2),colorRamp(c("blue","purple")))
school105<- sqlQuery(db2,'select 学院 as school,count(学院) as Times from c104')
library(RColorBrewer)
pct<-round(school103/sum(school103)*100,2)
lbls2<-paste(s," ",pct,"%",sep="")
b2p2 <- colorRamp(c("blue", "purple"))


ggplot(c303,aes(学院))+geom_bar(stat = "identity")+
  labs(x = "学院", y = "消费次数", title = "三月份各学院三月份交易量")+
  geom_text(aes(round(table(c303$学院)/sum(table(c303$学院))*100,2)))
