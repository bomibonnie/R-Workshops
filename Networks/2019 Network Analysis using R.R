##################################################################
#  Name:   Network Analysis using R.R                            #
#  Date:   October 23, 2019                                      #
#  Author: Bomi Lee                                              #
#  Purpose: Create plots and and calculate statistics            #
#           of network data.                                     #
#  Thanks to Elizabeth Menninga for some of this code.           #         #
##################################################################

# Install and load needed packages

#install.packages("statnet")
#install.packages("ergm")
library(statnet)
library(rio)
library(ergm)

# Set Working Directory
getwd()
## setwd("C:/Users/bomim/Documents/Rworkshop")

# Load and plot data
##statnet
edge <- import("edgeList.csv")
head(edge)
View(edge)

net<-network(edge,matrix.type="edgelist")
net

windows()
plot(net,displaylabels=T)

###weights
netweighted<-network(edge,matrix.type="edgelist",
                     ignore.eval=F,
                     names.eval="weight")
windows()
plot(netweighted,
     displaylabels=T,
     edge.lwd=5*netweighted%e%"weight")

netweighted[,] #adjacency matrix without weight
as.sociomatrix.sna(netweighted,"weight")
netweighted %e% "weight"

###attribute data
netweighted %v% "gender"<-c("M","F","F","M","M","M")
netweighted %v% "gender"

netweighted %v% "vertex.names"

netweighted %v% "age" <- 1:4
netweighted %v% "age" #what happened?

netweighted

##igraph
library(igraph)

node <- import("nodeList.csv")
net_igraph<-graph_from_data_frame(d=edge, v=node, directed=T)

V(net_igraph)$gender <- c("M","F","F","M","M","M")
V(net_igraph)$gender

V(net_igraph)$age <- 1:6
V(net_igraph)$age

E(net_igraph)$Weight

net_igraph

windows()
plot(net_igraph,
     edge.width=2*E(net_igraph)$Weight,
     edge.arrow.size=.6,
     vertex.size=5, 
     vertex.frame.color="black", 
     vertex.color="purple",
     vertex.label.cex=1.5,
     vertex.label.dist=1,
     layout=layout.fruchterman.reingold)

## Real data
atop <- import("atop_sample.csv")

head(atop)
atop2002_dat <-subset(atop, year==2002, c(stateabb1, stateabb2))
atop2002 <- graph.data.frame(atop2002_dat)
atop2002g <- as.undirected(atop2002, mode='collapse')

windows()
plot(atop2002g,
     vertex.label=NA,
     edge.width=1.5, vertex.size=3.5, 
     vertex.frame.color="black", 
     vertex.color="blue",
     layout=layout.fruchterman.reingold)
##Appropriate for unweighted, undirected graphs. Ignores edge weights
#Attractive forces occur between adjacent vertices only, 
#whereas repulsive forces occur between every pair of vertices. 
#Each iteration computes the sum of the forces on each vertex, 
#then moves the vertices to their new positions.

windows()
plot(atop2002g,
     vertex.label=NA,
     edge.width=1.5, vertex.size=3.5, 
     vertex.frame.color="black", 
     vertex.color="blue",
     layout=layout.kamada.kawai)

##kamada.kawai algorithm requires the graph to be connected 
#(only one component and no isolates) 
#Uses distance between nodes to determine where they should go. 
#The shorter the distance between nodes the closer they are.

### https://igraph.org/r/doc/


# Calculate Network Statistics

## Centrality

### Degree - Number of adjacent ties for a node
?degree
atop2002g
degree(atop2002g)

degree(net_igraph,
       mode = "in")

degree(net_igraph,
       mode = "out")

degree(net_igraph,
       mode = "total")

### Eigenvector
#eigen_centrality(net_igraph)
eigen_centrality(atop2002g)$vector

### Betweenness
betweenness(net_igraph)
betweenness(atop2002g)

### Closeness
closeness(net_igraph)
#closeness(atop2002g)

state <- V(atop2002g)
degree <- degree(atop2002g)
eigen <- eigen_centrality(atop2002g)$vector

cent_data <- data.frame(state, degree, eigen)  
