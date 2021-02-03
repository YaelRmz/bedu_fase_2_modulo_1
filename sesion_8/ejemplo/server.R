library(shiny)

shinyServer(function(input, output) {
    output$output_text <- renderText(paste("Petal.Width~", input$x))   #Titulo del main Panel
    
    output$output_plot <- renderPlot(plot(as.formula(paste("Petal.Width~", input$x)),
                                            data = iris) )
    
    output$summary <- renderPrint({
        summary(iris)
    })
    
    output$table <- renderTable({ 
        data.frame(iris)
    })
    
    
    output$data_table <- renderDataTable({iris}, 
                                         options = list(aLengthMenu = c(10,20,50),
                                                        iDisplayLength = 10))
})
