shinyUI(pageWithSidebar(
  headerPanel('Hierarchical Clustering on mtcars'),
  sidebarPanel(

    radioButtons('dist', 'Distance',
                 list('euclidean' = 'euclidean',
		      'manhattan' = 'manhattan',
                      'canberra' = 'canberra',
                      'maximum' = 'maximum',
#                     'manhattan' = 'manhattan',
#		      'canberra' = 'canberra',
		      'binary' = 'binary',
		      'minkowski' = 'minkowski')),
    br(),

    numericInput('clusters', 'Number of Clusters', 7, min = 2, max = 31),
    br(),
    
     h5("Documentation"),
     p("Hierarchical Clustering is a way to cluster observations based on tree structures. Starting from the bottom, each observation is a cluster. We then cluster two observations if they are similar. Here similarrity is viewed in terms of their distances. WE continue this way, we will reach the root of the tree, which indicates all the observations belong to one cluster. Depending on applications, we can use different methods to construct the tree. The common methods are complete, ward, average, single and centroid."), 
     p("Briefly method complete means maximal dissimilarity between clusters, ward minimum variance, average mean dissimilarity, single minimal dissimilarity, and centroid dissimilarity between centroids of clusters
. For distance, metric, we have euclidean, manhattan, canberra, maximum, binary and minkowski For distance, metric, we have euclidean, manhattan, canberra, maximum, binary and minkowski. Definitions of these distances can be found elsewhere such as wiki"),
     p("This app displays Hierarchical Clustering based on different methods, different distances and number of clusters for mtcars. Cars in a red box are in one cluster."),
     p("For mtcars the number of clusters is between 2 and 31. While Euclidean is the most widely used, other distances see their applications as well. Since minkowski depends on a its power p, for this app, we choose p = 100."),
     p("euclidean is set to be the default for distance and 7 is set to be the default for the number of clusters."),
     p("For instance, if you need to see how the cars are clustered in the case of manhattan if the number of cluters is set to be 15 just click manhattan under Distance on the right side and choose 15 for the number of clusters. Then you will get 4 plots: one for method complete, one for ward, one for average, one for single and one for centroid."),  
     p("One thing worth mentioning is that the plots show that single method does not generate a tree that is as balanced as others."),
     p("Note that because the computation is carried on the shinyapps.io server the results of which return over the Internet, it may take some time before plots are shown.")
  ),

  mainPanel(
    br(),
    plotOutput('plot1'),
    br(),
    plotOutput('plot2'),
    br(),
    plotOutput('plot3'),
    plotOutput('plot4'),
    plotOutput('plot5')
  )
))
