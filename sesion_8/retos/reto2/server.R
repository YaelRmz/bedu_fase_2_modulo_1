library(shiny)
library(dplyr)

shinyServer(function(input, output) {
    datasetImput <- reactive(
        switch(input$dataset, 
               "airquality" = select(airquality, Ozone, Solar.R, Wind, Temp, Month, Day), 
               "diamonds" = select(diamonds, carat, depth, price),
               "midwest" = select(midwest, colnames(midwest)[4:11]))
    )
    
    airquality <- airquality
    
    output$var <- renderUI({
        radioButtons("varname", 
                     "elige una variable", 
                     names(datasetImput()))
    })
    
    output$plot <- renderPlot({
        if(!is.null(input$varname)){
            if(!input$varname %in% names(datasetImput())){
                colname <- names(datasetImput())[1]
                
            } else {
                colname <- input$varname
            }
            hist(datasetImput()[,colname],
                 main = paste("Histograma de", colname), 
                 xlab = colname)
        }
        
    })
    
})