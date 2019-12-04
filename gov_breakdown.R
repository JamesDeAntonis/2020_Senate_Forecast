library(httr)
library(RCurl)
library(curl)
library(usmap)
library(ggplot2)
library(forcats)
library(data.table)
library(dplyr)
library(yaml)
library(diagram)
library(cowplot)

###############  diagram

png(filename="gov_overview.png")
par(mar = c(1, 1, 1, 1))  # i think sets the margins of the graph
openplotmat()
elpos <- coordinates(c(1, 3, 4))  # places the values logically in space, each entry a level
fromto <- matrix(ncol = 2, byrow = TRUE, data = c(1, 2, 1, 3, 1, 4, 2, 5, 2, 6))
nr <- nrow(fromto)  # number of transitions
nnodes <- length(elpos) / 2  # number of nodes (currently unused)
arrpos <- matrix(ncol = 2, nrow = nr)  # will contain the arrows
#  make the edges
for (i in 1:nr) {
  print(paste('***',i))
  print(elpos[fromto[i, 2], ])
  print(elpos[fromto[i, 1], ])
  arrpos[i, ] <- straightarrow (to = elpos[fromto[i, 2], ],
                                from = elpos[fromto[i, 1], ], lwd = 2,
                                arr.pos = 0.6, arr.length = 0.5)
}
# make the nodes
textellipse(elpos[1,], 0.1, lab = "US Gov", box.col = "firebrick1",
            cex = 1.5)
textrect (elpos[2,], 0.15, 0.05,lab = "Legislative", box.col = "lightblue",
          cex = 1.5)
textrect (elpos[3,], 0.15, 0.05,lab = "Executive", box.col = "lightblue",
          cex = 1.5)
textrect(elpos[4,], 0.15, 0.05, lab = "Judicial", box.col = "lightblue",
         cex = 1.5)
textellipse(elpos[5,], 0.1, 0.1, lab = "Senate", box.col = "lightgreen",
            cex = 1.5)
textellipse(elpos[6,], 0.1, 0.1, lab = c("House", "of", "Reps"),box.col = "lightgreen",
            cex = 1.5)
dev.off()
