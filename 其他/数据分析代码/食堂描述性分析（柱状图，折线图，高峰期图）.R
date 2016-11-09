library(dplyr)
library(RODBC)
library(RColorBrewer)
library(networkD3)
library(ggplot2)
library(highcharter)
odbcDataSources()
db1<-odbcConnect('10.201.20.73',uid = "sa",pwd = "123456")
db2<-odbcConnect('10.201.20.100',uid = "sa",pwd = "Data123456")
db3<-odbcConnect('10.201.20.70',uid = "sa",pwd = "123456")
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

t<-sqlQuery(db2,'select 交易时间,count(交易时间) as 交易次数 from c403 group by 交易时间 order by 交易时间')

data_c1<-sqlQuery(db2,'select * from data_c1')
data_c2<-sqlQuery(db2,'select * from data_c2')
data_c3<-sqlQuery(db2,'select * from data_c3')
data_c4<-sqlQuery(db2,'select * from data_c4')

d103<-c103 %>% group_by(学院) %>% summarise(交易次数=n())
d104<-c104 %>% group_by(学院) %>% summarise(交易次数=n())

d203<-c203 %>% group_by(学院) %>% summarise(交易次数=n())
d204<-c204 %>% group_by(学院) %>% summarise(交易次数=n())

d303<-c303 %>% group_by(学院) %>% summarise(交易次数=n())
d304<-c304 %>% group_by(学院) %>% summarise(交易次数=n())

d403<-c403 %>% group_by(学院) %>% summarise(交易次数=n())
d404<-c404 %>% group_by(学院) %>% summarise(交易次数=n())
#柱状图
#一食堂3、4月份
p103<- ggplot(d103,aes(学院,交易次数,fill=学院))+geom_bar(stat="identity",width = 0.7)+labs(x = "学院", y = "交易次数", title = "一食堂2015年3月各学院消费次数")+geom_text(aes(label=round(交易次数)),vjust=-1,colour="black",size=5)
p103
p103+scale_fill_brewer(palette = "Paired")
p104<- ggplot(d104,aes(学院,交易次数,fill=学院))+geom_bar(stat="identity",width = 0.7)+labs(x = "学院", y = "交易次数", title = "一食堂2015年4月各学院消费次数")+geom_text(aes(label=round(交易次数)),vjust=-1,colour="black",size=5)
p104
p104+scale_fill_brewer(palette = "Paired")

#二食堂3、4月份
p203<- ggplot(d203,aes(学院,交易次数,fill=学院))+geom_bar(stat="identity",width = 0.7)+labs(x = "学院", y = "交易次数", title = "二食堂2015年3月各学院消费次数")+geom_text(aes(label=round(交易次数)),vjust=-1,colour="black",size=5)
p203
p203+scale_fill_brewer(palette = "Paired")
p204<- ggplot(d204,aes(学院,交易次数,fill=学院))+geom_bar(stat="identity",width = 0.7)+labs(x = "学院", y = "交易次数", title = "二食堂2015年4月各学院消费次数")+geom_text(aes(label=round(交易次数)),vjust=-1,colour="black",size=5)
p204
p204+scale_fill_brewer(palette = "Paired")
#三食堂3、4月份
p303<- ggplot(d303,aes(学院,交易次数,fill=学院))+geom_bar(stat="identity",width = 0.7)+labs(x = "学院", y = "交易次数", title = "三食堂2015年3月各学院消费次数")+geom_text(aes(label=round(交易次数)),vjust=-1,colour="black",size=5)
p303
p303+scale_fill_brewer(palette = "Paired")
p304<- ggplot(d304,aes(学院,交易次数,fill=学院))+geom_bar(stat="identity",width = 0.7)+labs(x = "学院", y = "交易次数", title = "三食堂2015年4月各学院消费次数")+geom_text(aes(label=round(交易次数)),vjust=-1,colour="black",size=5)
p304
p304+scale_fill_brewer(palette = "Paired")
#四食堂3、4月份
p403<- ggplot(d403,aes(学院,交易次数,fill=学院))+geom_bar(stat="identity",width = 0.7)+labs(x = "学院", y = "交易次数", title = "四食堂2015年3月各学院消费次数")+geom_text(aes(label=round(交易次数)),vjust=-1,colour="black",size=5)
p403
p403+scale_fill_brewer(palette = "Paired")
p404<- ggplot(d404,aes(学院,交易次数,fill=学院))+geom_bar(stat="identity",width = 0.7)+labs(x = "学院", y = "交易次数", title = "四食堂2015年4月各学院消费次数")+geom_text(aes(label=round(交易次数)),vjust=-1,colour="black",size=5)
p404
p404+scale_fill_brewer(palette = "Paired")

#风向图
#一食堂3、4月份
p103<-ggplot(d103,aes(学院,交易次数,fill=学院))+geom_bar(stat="identity",width = 1)+coord_polar()+labs(x = "学院", y = "交易次数", title = "一食堂2015年3月各学院消费次数")+geom_text(aes(label=round(交易次数)),vjust=0,colour="black",size=4)
p103
p103+scale_fill_brewer(palette = "Paired")
p104<-ggplot(d104,aes(学院,交易次数,fill=学院))+geom_bar(stat="identity",width = 1)+coord_polar()+labs(x = "学院", y = "交易次数", title = "一食堂2015年4月各学院消费次数")+geom_text(aes(label=round(交易次数)),vjust=0,colour="black",size=4)
p104
p104+scale_fill_brewer(palette = "Paired")
#二食堂3、4月份
p203<-ggplot(d203,aes(学院,交易次数,fill=学院))+geom_bar(stat="identity",width = 1)+coord_polar()+labs(x = "学院", y = "交易次数", title = "二食堂2015年3月各学院消费次数")+geom_text(aes(label=round(交易次数)),vjust=0,colour="black",size=4)
p203
p203+scale_fill_brewer(palette = "Paired")
p204<-ggplot(d204,aes(学院,交易次数,fill=学院))+geom_bar(stat="identity",width = 1)+coord_polar()+labs(x = "学院", y = "交易次数", title = "二食堂2015年4月各学院消费次数")+geom_text(aes(label=round(交易次数)),vjust=0,colour="black",size=4)
p204
p204+scale_fill_brewer(palette = "Paired")
#三食堂3、4月份
p303<-ggplot(d303,aes(学院,交易次数,fill=学院))+geom_bar(stat="identity",width = 1)+coord_polar()+labs(x = "学院", y = "交易次数", title = "三食堂2015年3月各学院消费次数")+geom_text(aes(label=round(交易次数)),vjust=0,colour="black",size=4)
p303
p303+scale_fill_brewer(palette = "Paired")
p304<-ggplot(d304,aes(学院,交易次数,fill=学院))+geom_bar(stat="identity",width = 1)+coord_polar()+labs(x = "学院", y = "交易次数", title = "三食堂2015年4月各学院消费次数")+geom_text(aes(label=round(交易次数)),vjust=0,colour="black",size=4)
p304
p304+scale_fill_brewer(palette = "Paired")
#四食堂3、4月份
p403<-ggplot(d403,aes(学院,交易次数,fill=学院))+geom_bar(stat="identity",width = 1)+coord_polar()+labs(x = "学院", y = "交易次数", title = "四食堂2015年3月各学院消费次数")+geom_text(aes(label=round(交易次数)),vjust=0,colour="black",size=4)
p403
p403+scale_fill_brewer(palette = "Paired")
p404<-ggplot(d404,aes(学院,交易次数,fill=学院))+geom_bar(stat="identity",width = 1)+coord_polar()+labs(x = "学院", y = "交易次数", title = "四食堂2015年4月各学院消费次数")+geom_text(aes(label=round(交易次数)),vjust=0,colour="black",size=4)
p404
p404+scale_fill_brewer(palette = "Paired")


#修改柱状图
#一食堂
highchart() %>% 
  hc_chart(type = "column") %>% 
  hc_title(text = "一食堂3、4月各学院消费次数") %>% 
  hc_xAxis(categories = d103$学院) %>% 
  hc_add_series(data = d103$交易次数,name = "3月") %>%
  hc_add_series(data = d104$交易次数,name = "4月")
#二食堂
highchart() %>% 
  hc_chart(type = "column") %>% 
  hc_title(text = "二食堂3、4月各学院消费次数") %>% 
  hc_xAxis(categories = d103$学院) %>% 
  hc_add_series(data = d203$交易次数,name = "3月") %>%
  hc_add_series(data = d204$交易次数,name = "4月")
#三食堂
highchart() %>% 
  hc_chart(type = "column") %>% 
  hc_title(text = "三食堂3、4月各学院消费次数") %>% 
  hc_xAxis(categories = d303$学院) %>% 
  hc_add_series(data = d303$交易次数,name = "3月") %>%
  hc_add_series(data = d304$交易次数,name = "4月")
#四食堂
highchart() %>% 
  hc_chart(type = "column") %>% 
  hc_title(text = "四食堂3、4月各学院消费次数") %>% 
  hc_xAxis(categories = d403$学院) %>% 
  hc_add_series(data = d403$交易次数,name = "3月") %>%
  hc_add_series(data = d404$交易次数,name = "4月")

#饼状图（修改）
school1<-c303[,1]
school2<-c304[,1]
table(school1)
lbls<-c("工商学院","公管学院","管科学院","国际商学院","会计学院","金融学院","经济学院","数统学院","外语学院","文法学院","信息学院","艺术学院")
slices1<-c(22211, 17967, 11342, 7614, 9892, 10693, 18033, 6116, 2497, 18450, 20488, 5890)
slices2<-c(17721,14840,9135,6197,8415,9089,15035,5187,2058,14950 ,15943 ,3991 )
par(mfrow=c(1,2))
pie(slices,labels=paste(lbls," ",round(slices1/sum(slices1)*100,2),"%",sep=""),col=brewer.pal(12,"Set3"),border=FALSE,main="3食堂2015年3月份各个学院消费次数比")
pie(slices,labels=paste(lbls," ",round(slices2/sum(slices2)*100,2),"%",sep=""),col=brewer.pal(12,"Set3"),border=FALSE,main="3食堂2015年4月份各个学院消费次数比")
d404<-c404 %>% group_by(学院) %>% summarise(交易次数=n())
pie(d103$交易次数,labels=paste(d103$学院," ",round(d103$交易次数/sum(d103$交易次数)*100,2),"%",sep=""),col=brewer.pal(12,"Set3"),border=FALSE,main="一食堂2015年3月份各个学院消费次数比")
pie(d104$交易次数,labels=paste(d104$学院," ",round(d104$交易次数/sum(d104$交易次数)*100,2),"%",sep=""),col=brewer.pal(12,"Set3"),border=FALSE,main="一食堂2015年4月份各个学院消费次数比")
pie(d203$交易次数,labels=paste(d203$学院," ",round(d203$交易次数/sum(d203$交易次数)*100,2),"%",sep=""),col=brewer.pal(12,"Set3"),border=FALSE,main="二食堂2015年3月份各个学院消费次数比")
pie(d204$交易次数,labels=paste(d204$学院," ",round(d204$交易次数/sum(d204$交易次数)*100,2),"%",sep=""),col=brewer.pal(12,"Set3"),border=FALSE,main="二食堂2015年4月份各个学院消费次数比")
pie(d303$交易次数,labels=paste(d303$学院," ",round(d303$交易次数/sum(d303$交易次数)*100,2),"%",sep=""),col=brewer.pal(12,"Set3"),border=FALSE,main="三食堂2015年3月份各个学院消费次数比")
pie(d304$交易次数,labels=paste(d304$学院," ",round(d304$交易次数/sum(d304$交易次数)*100,2),"%",sep=""),col=brewer.pal(12,"Set3"),border=FALSE,main="三食堂2015年4月份各个学院消费次数比")
pie(d403$交易次数,labels=paste(d403$学院," ",round(d403$交易次数/sum(d403$交易次数)*100,2),"%",sep=""),col=brewer.pal(12,"Set3"),border=FALSE,main="四食堂2015年3月份各个学院消费次数比")
pie(d404$交易次数,labels=paste(d404$学院," ",round(d404$交易次数/sum(d404$交易次数)*100,2),"%",sep=""),col=brewer.pal(12,"Set3"),border=FALSE,main="四食堂2015年4月份各个学院消费次数比")




library(highcharter)
highchart() %>% 
  hc_chart(type = "column") %>% 
  hc_title(text = "3月各学院消费次数") %>% 
  hc_xAxis(categories = d103$学院) %>% 
  hc_add_series(data = d103$交易次数,name = "1食堂") %>%
  hc_add_series(data = d203$交易次数,name = "2食堂") %>%
  hc_add_series(data = d303$交易次数,name = "3食堂") %>%
  hc_add_series(data = d403$交易次数,name = "4食堂") %>%
  hc_add_theme(hc_theme_economist())



#读取数据
x<-sqlQuery(db2,'select * from sum_c403')
#各学院消费人数
highchart() %>% 
  hc_chart(type = "line") %>% 
  hc_title(text = "四食堂3月各学院消费人数") %>% 
  hc_xAxis(categories = x$学院) %>% 
  hc_add_series(data = x$消费人数,name = "消费人数")
#各学院消费总次数
highchart() %>% 
  hc_chart(type = "column") %>% 
  hc_title(text = "四食堂3月各学院消费总次数") %>% 
  hc_xAxis(categories = x$学院) %>% 
  hc_add_series(data = x$消费总次数,name = "消费总次数")
#人均消费次数（折线图）
highchart() %>% 
  hc_chart(type = "line") %>% 
  hc_title(text = "四食堂3月各学院人均消费次数") %>% 
  hc_xAxis(categories = x$学院) %>% 
  hc_add_series(data = round(x$消费总次数/x$消费人数,2),name = "人均消费次数") 

#人均消费次数（柱状图）
highchart() %>% 
  hc_chart(type = "column") %>% 
  hc_title(text = "四食堂3月各学院人均消费次数") %>% 
  hc_xAxis(categories = x$学院) %>% 
  hc_add_series(data = round(x$消费总次数/x$消费人数,2), colorByPoint = TRUE,name = "人均消费次数") %>%
  hc_add_theme(hc_theme_darkunica())
highchart() %>% 
  hc_chart(type = "column") %>% 
  hc_title(text = "四食堂3月各学院人均消费次数") %>% 
  hc_xAxis(categories = x$学院) %>% 
  hc_add_series(data = round(x$消费总次数/x$消费人数,2),name = "人均消费次数") %>%
  hc_add_theme(hc_theme_darkunica())

#时间序列(实验)
library("quantmod")
library("TTR")
library("zoo")
library("xts")
t1<-filter(data_c3,Date=="2015-03-11")
t1.ts<- t1 %>% group_by(Time) %>% summarise(Times=n())
head(t1.ts)
hchart(t1.ts, "line", x = Time, y = Times)

highchart(type = "stock") %>% 
  hc_title(text = "Monthly Deaths from Lung Diseases in the UK") %>% 
  hc_subtitle(text = "Deaths from bronchitis, emphysema and asthma") %>% 
  hc_add_series_ts(t1.ts, name = "日期")

time1<- as.Date(c("2015-03-01","2015-03-30"), format = "%Y-%m-%d")
time2<- as.Date(c("05:00:00","23:00:00"), format = "%H:%M:%S")
highchart(type = "stock") %>% 
  hc_add_series_xts(t1.ts, id = "Times")
highchart(type = "stock") %>% 
  hc_add_series_xts(t1, id = "Time")
highchart() %>% 
  hc_chart(type = "line") %>% 
  hc_title(text = "3月各学院消费额") %>% 
  hc_xAxis(categories = d1$Date) %>% 
  hc_add_series(data = d1$Spending,name = "1食堂")

highchart(type = "stock") %>% 
  hc_title(text = "Monthly Deaths from Lung Diseases in the UK") %>% 
  hc_subtitle(text = "Deaths from bronchitis, emphysema and asthma") %>% 
  hc_add_series_ts(fdeaths, name = "Female") %>%
  hc_add_series_ts(mdeaths, name = "Male")
hchart(tx, "line", x = Time, y = Times)

#做实验：
library(dygraphs)
dygraph(tx, main = "New Haven Temperatures") %>% 
  dyRangeSelector(dateWindow = c("1920-01-01", "1960-01-01"))
dygraph(nhtemp, main = "New Haven Temperatures") %>% 
  dyRangeSelector(dateWindow = c("1920-01-01", "1960-01-01"))

#本地读取数据并处理（失败）
data<-read.csv("1食堂 201503.csv")
d1<-filter(data,交易日期=="2015/3/11")
d1.ts<-d1 %>%
  group_by(交易时间) %>%
  summarise(交易次数=n()) %>%
  arrange(desc(交易时间))
d1.x<- arrange(d1,desc(交易时间))
d1.ts<- d1 %>% 
        group_by(交易时间) %>% 
        summarise(交易次数=n())
d103<-as.xts(d1.ts$交易时间)
arrange(d1.ts, desc(交易时间))

#做2015-03-11整天的消费次数时间序列
t<-sqlQuery(db2,'select 交易时间,交易次数 from table_t1 order by 交易时间')
hchart(t, "line", x = 交易时间, y = 交易次数)

#做一个月的消费次数时间序列
c1_03<-sqlQuery(db2,'select * from C103_ts_time1 order by 交易日期')
c2_03<-sqlQuery(db2,'select * from C203_ts_time1 order by 交易日期')
c3_03<-sqlQuery(db2,'select * from C303_ts_time1 order by 交易日期')
c4_03<-sqlQuery(db2,'select * from C403_ts_time1 order by 交易日期')
#做一天的消费总次数时间序列
t1_03<-sqlQuery(db2,'select * from C103_ts_time2 order by 交易时间')
t2_03<-sqlQuery(db2,'select * from C203_ts_time2 order by 交易时间')
t3_03<-sqlQuery(db2,'select * from C303_ts_time2 order by 交易时间')
t4_03<-sqlQuery(db2,'select * from C403_ts_time2 order by 交易时间')

#单独做1食堂3月时间序列
hchart(c1_03, "line", x = 交易日期, y = 交易次数)%>% 
  hc_title(text = "1食堂交易次数时间变化图")
#加载viridisLite包
library("viridisLite")
cols <- viridis(4)
cols <- substr(cols, 0, 7)
#日期的交易次数折线图
hc<-highchart() %>% 
  hc_chart(type = "line") %>% 
  hc_title(text = "3月各学院消费次数") %>% 
  hc_xAxis(categories = c1_03$交易日期) %>% 
  hc_add_series(data = c1_03$交易次数,name = "一食堂") %>%
  hc_add_series(data = c2_03$交易次数,name = "二食堂") %>%
  hc_add_series(data = c3_03$交易次数,name = "三食堂") %>%
  hc_add_series(data = c4_03$交易次数,name = "四食堂") %>% 
  hc_colors(cols) %>% 
  hc_tooltip(crosshairs = TRUE, backgroundColor = "#FCFFC5",
             shared = TRUE, borderWidth = 5)
hc %>% hc_add_theme(hc_theme_darkunica())

#时间的日均消费高峰期
hc1<-highchart() %>% 
  hc_chart(type = "line") %>% 
  hc_title(text = "消费高峰期") %>% 
  hc_xAxis(categories = t2_03$交易时间) %>% 
  hc_add_series(data = round(t1_03$交易次数/61,2),name = "一食堂") %>%
  hc_add_series(data = round(t2_03$交易次数/61,2),name = "二食堂") %>%
  hc_add_series(data = round(t3_03$交易次数/61,2),name = "三食堂") %>%
  hc_add_series(data = round(t4_03$交易次数/61,2),name = "四食堂") %>% 
  hc_colors(cols) %>%
  hc_tooltip(crosshairs = TRUE, backgroundColor = "#FCFFC5",
             shared = TRUE, borderWidth = 5) %>% 
  hc_exporting(enabled = TRUE)
 hc1 %>%  hc_add_theme(hc_theme_economist())
#一食堂消费高峰期
highchart() %>% 
   hc_chart(type = "line") %>% 
   hc_title(text = "一食堂消费高峰期") %>% 
   hc_xAxis(categories = t2_03$交易时间) %>% 
   hc_add_series(data = round(t1_03$交易次数/61,2),name="一食堂")
#二食堂消费高峰期
highchart() %>% 
  hc_chart(type = "line") %>% 
  hc_title(text = "二食堂消费高峰期") %>% 
  hc_xAxis(categories = t2_03$交易时间) %>% 
  hc_add_series(data = round(t2_03$交易次数/61,2),name="二食堂")
#三食堂消费高峰期
highchart() %>% 
  hc_chart(type = "line") %>% 
  hc_title(text = "三食堂消费高峰期") %>% 
  hc_xAxis(categories = t2_03$交易时间) %>% 
  hc_add_series(data = round(t3_03$交易次数/61,2),name="三食堂")
#四食堂消费高峰期
highchart() %>% 
  hc_chart(type = "line") %>% 
  hc_title(text = "四食堂消费高峰期") %>% 
  hc_xAxis(categories = t2_03$交易时间) %>% 
  hc_add_series(data = round(t4_03$交易次数/61,2),name="四食堂")

#3、4月份人次流量对比
SumSpending_all<-sqlQuery(db2,'select * from SumSpendingT')
#一食堂3、4月
flow_c13<-sqlQuery(db2,'select * from SumSchool_c13')
flow_c14<-sqlQuery(db2,'select * from SumSchool_c14')
highchart() %>% 
  hc_chart(type = "column") %>% 
  hc_title(text = "一食堂3、4月份各学院流量对比") %>% 
  hc_xAxis(categories = flow_c13$学院) %>% 
  hc_add_series(data = flow_c13$消费次数,name="3月份") %>%
  hc_add_series(data = flow_c14$消费次数,name="4月份")

#二食堂3、4月
flow_c23<-sqlQuery(db2,'select * from SumSchool_c23')
flow_c24<-sqlQuery(db2,'select * from SumSchool_c24')
highchart() %>% 
  hc_chart(type = "column") %>% 
  hc_title(text = "二食堂3、4月份各学院流量对比") %>% 
  hc_xAxis(categories = flow_c23$学院) %>% 
  hc_add_series(data = flow_c23$消费次数,name="3月份") %>%
  hc_add_series(data = flow_c24$消费次数,name="4月份")

#三食堂3、4月
flow_c33<-sqlQuery(db2,'select * from SumSchool_c33')
flow_c34<-sqlQuery(db2,'select * from SumSchool_c34')
highchart() %>% 
  hc_chart(type = "column") %>% 
  hc_title(text = "三食堂3、4月份各学院流量对比") %>% 
  hc_xAxis(categories = flow_c33$学院) %>% 
  hc_add_series(data = flow_c33$消费次数,name="3月份") %>%
  hc_add_series(data = flow_c34$消费次数,name="4月份")

#四食堂3、4月
flow_c43<-sqlQuery(db2,'select * from SumSchool_c43')
flow_c44<-sqlQuery(db2,'select * from SumSchool_c44')
highchart() %>% 
  hc_chart(type = "column") %>% 
  hc_title(text = "四食堂3、4月份各学院流量对比") %>% 
  hc_xAxis(categories = flow_c43$学院) %>% 
  hc_add_series(data = flow_c43$消费次数,name="3月份") %>%
  hc_add_series(data = flow_c44$消费次数,name="4月份")

#月平均交易次数
highchart() %>% 
  hc_chart(type = "column") %>% 
  hc_title(text = "各食堂内各学院月平均交易次数") %>% 
  hc_xAxis(categories = flow_c13$学院) %>% 
  hc_add_series(data = round((flow_c13$消费次数+flow_c14$消费次数)/2,2),name="一食堂") %>%
  hc_add_series(data = round((flow_c23$消费次数+flow_c24$消费次数)/2,2),name="二食堂") %>%
  hc_add_series(data = round((flow_c33$消费次数+flow_c34$消费次数)/2,2),name="三食堂") %>%
  hc_add_series(data = round((flow_c43$消费次数+flow_c44$消费次数)/2,2),name="四食堂")


forceNetwork(Links = Links, Nodes = Nodes,
             Source = "学生1", Target = "target",
             Value = "学生2", NodeID = "书名",
             Group = "group", opacity = 0.8, zoom = TRUE)
library(visNetwork)
nodes <- jsonlite::fromJSON("https://raw.githubusercontent.com/datastorm-open/datastorm-open.github.io/master/visNetwork/data/nodes_miserables.json")
edges <- jsonlite::fromJSON("https://raw.githubusercontent.com/datastorm-open/datastorm-open.github.io/master/visNetwork/data/edges_miserables.json")

visNetwork(nodes, edges, height = "700px", width = "100%") %>%
  visOptions(selectedBy = "group", 
             highlightNearest = TRUE, 
             nodesIdSelection = TRUE) %>%
  visPhysics(stabilization = FALSE)
 