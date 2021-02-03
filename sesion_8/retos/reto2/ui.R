library(shiny)

shinyUI(fluidPage(
    titlePanel("Elecciones dinámicas de Data Frames"),
    
    sidebarLayout(
        sidebarPanel(
            selectInput("dataset", "Selección del dataset", 
                        c("airquality", "diamonds", "midwest")), 
            uiOutput("var")
        ),
        
        mainPanel(
            plotOutput("plot")
        )
    )
))