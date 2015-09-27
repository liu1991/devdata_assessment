---
title       : Shiny on K-means Clustering
subtitle    : Develop Data Products Assessment
author      : Terence Liu, Ph.D candidate
job         : NJU
framework   : io2012      # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Aim & Usage

This application is to cluster the rock dataset by k-means, with various algorithms. The user can set the varibles, number of cluster and algorithm

1. The paired varibles of the dataset
2. Number of cluster
3. Algorithm

--- .class #id 

## ur.R


```r
shinyUI(pageWithSidebar(
  headerPanel('Rock k-means clustering using different algorithms'),
  sidebarPanel(
    h5('This application is to cluster the rock dataset by k-means, using different
       algorithms. The user can set the varibles, number of cluster and algorithm'),
  
    selectInput('xcol', 'X Variable', names(rock)[-1]),
    selectInput('ycol', 'Y Variable', names(rock)[-1],
                selected=names(rock)[2]),
    numericInput('clusters', 'Cluster count', 3,
                 min = 1, max = 6),
    selectInput('algo', 'Algorithm', c("Hartigan-Wong", "Lloyd", "Forgy","MacQueen"))
    
  ),
  mainPanel(
    plotOutput('plot1')
  )
))
```

```
## Error in eval(expr, envir, enclos): 没有"shinyUI"这个函数
```

---

## server.R


```r
palette(rainbow(6))

shinyServer(function(input, output, session) {
  selectedData <- reactive({
    rock[, c(input$xcol, input$ycol)]
  })
  clusters <- reactive({
    kmeans(selectedData(), input$clusters, algorithm=input$algo)
  }) 
  output$plot1 <- renderPlot({
    par(mar = c(5.1, 4.1, 0, 1))
    plot(selectedData(),
         col = clusters()$cluster,
         pch = 20, cex = 3)
    points(clusters()$centers, pch = 4, cex = 4, lwd = 4)
  }) 
})
```

```
## Error in eval(expr, envir, enclos): 没有"shinyServer"这个函数
```

---

##  To run it

To use the applicaiton, you can

* In R, set the directory with the ui.r and server.r file and type runApp()
* Run it online with the link: <https://liu1991.shinyapps.io/Rock_k-means_clustering>

Now, have fun and enjoy it!

