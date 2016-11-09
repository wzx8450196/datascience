data<-read.csv("三食堂数据.csv")
head(data)
data1<-data[data$交易时间<2015-04-01,]
data<-read.csv("3-1.csv")
head(data)
plot(data$交易时间,data$交易额)
lines(data$交易时间,data$交易额)
tail(data)
abline(data$交易时间,data$交易额)
p1<-function(data,sDate=min(index(data)),eDate(index(data))){
  g<-ggplot(aes(x=Index,y=Value),data=data,melt=TRUE)
  g<-g+geom_line()
  g<-g+geom_line(aes(colour=series))
  g<-g+scale_x_date(labels = data_format("%h"),breaks=data_breaks("1 hour"))}

g<-ggplot(data,aes(x=交易时间,y=交易额))+geom_line()
g<-ggplot(data,aes(x=交易时间,y=交易额))+geom_point()
g+geom_line()
g
p<-ggplot(data,aes(x=姓名,y=交易次数))+geom_bar()
p<-ggplot(data,aes(x=姓名,y=交易次数))+geom_point()
p
attach(data)
q1<-hist(交易额)
q2<-barplot()
barchart(data$姓名~data$交易额)
head(data)
detach(data)



head(d1)
fit<-lm(SALARY~SPENDING,data = d1)
plot(fit)

par(mfrow=c(2,2))
plot(fit)
library(RODBC)
#查看数据库
odbcDataSources()
#连接sql server数据库
database<-odbcConnect('BigData',uid = "sa",pwd = "123456")
carteen3<-sqlQuery(database,'select * from 三食堂3月')
carteen3_3<-sqlQuery(database,'select * from 三食堂3月_改')
head(carteen3)
head(carteen3_3)
tail(carteen3_3)
#查看维度
dim(carteen3)
#查看属性
attributes<-(carteen3)
data1<-sqlQuery(database,'select 姓名,个人编码,交易时间,交易次数,入卡值,交易额,余额,机号 from 三食堂3月')
 head(data1)
plot(data=data1,个人编码,交易额)
plot(data1)


