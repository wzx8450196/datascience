library(visNetwork)
nodes <- jsonlite::fromJSON("https://raw.githubusercontent.com/datastorm-open/datastorm-open.github.io/master/visNetwork/data/nodes_miserables.json")
edges <- jsonlite::fromJSON("https://raw.githubusercontent.com/datastorm-open/datastorm-open.github.io/master/visNetwork/data/edges_miserables.json")
visNetwork(nodes, edges, height = "700px", width = "100%") %>%
  visPhysics(stabilization = FALSE)
Links<-read.csv("StudentTop10.csv")
Nodes<-read.csv("booktop10.csv")
visNetwork(Links, Nodes, height = "700px", width = "100%") %>%
  visPhysics(stabilization = FALSE)


library(igraph)
d1<-read.csv("test_lib.csv")
d1<-read.csv("StudentTop10.csv")
t1<-data.frame(d1$A2,d1$B2)
gg<- graph.data.frame(d=t1,directed = F)
is.simple(gg)
gg<-simplify(gg)
is.simple(gg)
par(mar=c(0,0,0,0))
set.seed(14)
plot(gg,layout=layout.fruchterman.reingold,vertex.size = 10, vertex.label = NA,edge.color = grey(0.5), edge.arrow.mode = "-")
#社交关系，关系数：
listall = sort(table(d1[,4]), dec = T)
top=names(listall[1:20])
top
tmp4 = d1[d1[,2] %in% top, 4]
top20 = sort(table(tmp4), dec = T)
top20
head(d1)
d1l<- d1 %>% group_by(target) %>% summarise(借阅量=n())
hc<-highchart() %>%
    hc_chart(type="pie") %>%
    hc_title(text="排行前十图书借阅比例") %>%
    hc_xAxis(categories=d1l$target) %>%
    hc_add_series(data=d1l$借阅量,names=d1$target)
%>%
    hc_add_series(data = list(d1l$target,sliced = TRUE))

