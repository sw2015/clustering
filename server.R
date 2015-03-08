shinyServer(function(input, output) {

   # Compute distance over mtcars
      
   d <- reactive({
     dist(as.matrix(mtcars),  method = input$dist, p=100) 
     })
   
  # Number of Hierarchical clusters from user

  k <- reactive({
   input$clusters
  })


  output$plot1 <- renderPlot({
    hc <-  hclust(d(), method="complete") 
    plot(hc)
    rect.hclust(hc, k(), border="red")
    })
  output$plot2 <- renderPlot({
    hc <-  hclust(d(), method="ward.D") 
    plot(hc)
    rect.hclust(hc, k(), border="red")
    })
  output$plot3 <- renderPlot({
    hc <-  hclust(d(), method="average") 
    plot(hc)
    rect.hclust(hc, k(), border="red")
   }) 
   output$plot4 <- renderPlot({
    hc <-  hclust(d(), method="single")
    plot(hc)
    rect.hclust(hc, k(), border="red")
   })
   output$plot5 <- renderPlot({
    hc <-  hclust(d(), method="centroid")
    plot(hc)
    rect.hclust(hc, k(), border="red")
   })

})
