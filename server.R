library(shiny)
library(datasets)

# Define server logic required to summarize and view the selected dataset

data(mtcars)
mtcars$makemodel <- rownames(mtcars)
mtcars$make <- gsub( " .*$", "", mtcars$makemodel)

shinyServer(function(input, output) {
  
  # Return the requested dataset
  makeInput <- reactive({
    switch(input$make,
           "Mazda" = Mazda,
           "Datsun" = Datsun,
           "Hornet" = Hornet,
           "Valiant" = Valiant,
           "Duster" = Duster,
           "Merc" = Merc,
           "Cadillac" = Cadillac,
           "Lincoln" = Lincoln,
           "Chrysler" = Chrysler,
           "Fiat" = Fiat,
           "Honda" = Honda,
           "Toyota" = Toyota,
           "Dodge" = Dodge,
           "AMC" = AMC,
           "Camaro" = Camaro,
           "Pontiac" = Pontiac,
           "Porsche" = Porsche,
           "Lotus" = Lotus,
           "Ford" = Ford,
           "Ferrari" = Ferrari,
           "Maserati" = Maserati,
           "Volvo" = Volvo)
  })
  
  featureInput <- reactive({
    switch(input$feature,
           "qsec" = qsec,
           "mpg" = mpg,
           "cyl" = cyl,
           "disp" = disp,
           "hp" = hp,
           "drat" = drat,
           "wt" = wt,
           "vs" = vs,
           "am" = am,
           "gear" = gear,
           "carb" = carb)
  })
  
  # Print out the make selected
  output$make <- renderText({
    paste("You have selected",input$make,"as the car make")
  })
  
  # Print out the feature selected
  output$feature <- renderText({
    paste("You have selected",input$feature,"as the car feature")
  })
  
  output$tabletext <- renderText({
    paste("The table below summarises the mtcars data available for the car make which you selected:")
  })
  
  # Show table of results for that make
  output$view <- renderTable({
    print(mtcars[mtcars$make==input$make,1:11])
  })
  
  # Print out the mean of feature selected
  output$mean <- renderText({
    data <- mtcars[mtcars$make==input$make,input$feature]
    paste("The mean value of",input$feature,"for",input$make,"cars is",print(mean(data)))
    #    print(mean(data))
  })
})