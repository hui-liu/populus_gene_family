# run this script in R version 3.3.2
# dir
rm(list=ls())
setwd("D:/my_research/populus_gene_family/")
# bash shell
# cat report_run.cafe | grep "# IDs of nodes" | cut -f 2 -d ":" | sed 's/$/;/' > xso_cafe.tre

# library
library(ggtree)
library(ggimage)

# load data
summary_node <- read.table("cafe/summary_run_node.txt", header = T, sep="\t")
tree1 <- read.tree(file = "r8s/r8s_ultrametric.tre")
tree2 <- read.tree(file = "cafe/xso_cafe.tre")

#p1<-ggtree(tree1) + geom_text(aes(label=node), hjust=-.3)+ geom_tiplab(size = 3, hjust=-0.3)
# data manipulation
p1 <- ggtree(tree1)
dat1 <- p1$data[c("node", "label")]

p2<-ggtree(tree2)
dat2 <- p2$data[c("node", "label")]

merge1 <- merge(dat1, dat2, by = "node")
merge2 <- merge(merge1, summary_node, by.x = names(merge1)[3], by.y = "Node")

# Expansion and Contraction data
EC <- merge2[c("Expansions", "Contractions", "node")]

#############
revts <- function (treeview) 
{
  x <- treeview$data$x
  x <- x - max(x)
  treeview$data$x <- x
  treeview
}

# plot
fig1 <- ggtree(tree1) + geom_tiplab(size = 4)
pies <- nodepie(EC, cols=1:2, color = c("#00A8E8", "#E71D36"), alpha=.6)
fig1 <- inset(fig1, pies, width = 50, height = 50)


fig2 <- ggtree(tree1) + geom_tiplab(size = 4) + theme_tree2()
fig2 <- revts(fig2)
fig2 <- fig2 + scale_x_continuous(breaks=seq(-1200, 0, 200), labels=abs(seq(-1200, 0, 200)))

# save plot
pdf(file="tree_piechart.pdf", 12, 8)
fig1
fig2
dev.off()
