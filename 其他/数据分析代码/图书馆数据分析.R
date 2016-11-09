#例1
# 载入软件包
library(networkD3)
# 创建数据
src <- c("A","A","A","A","B","B","C","C","D")
target <- c("B","C","D","J","E","F","G","H","I")
networkData <- data.frame(src, target, zoom = TRUE)
# 画图
simpleNetwork(networkData)


#加载包
library(RODBC)
library(networkD3)
#连接数据库
db3<-odbcConnect('10.24.32.21',uid = "sa",pwd = "123456")
#载入图书馆数据
tsg<-sqlQuery(db3,'SELECT * FROM library_data')
t1<-sqlQuery(db3,'SELECT 题名,count(题名) as 借书次数 FROM library_data group by 题名 ')
d1<-c303 %>% group_by(年级) %>% summarize(平均消费额=mean(交易额))
d1<-data.frame(tsg$姓名,tsg$题名,zoom = TRUE)
simpleNetwork(d1)

attach(tsg)
# 画图
forceNetwork(Links = d1,Nodes =t1,Source = "题名",Target = "姓名",
             Value = "借书次数",NodeID = "题名",Group = "姓名",opacity = 0.8, zoom = TRUE)

detach(tsg)

