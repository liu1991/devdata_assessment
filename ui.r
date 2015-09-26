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