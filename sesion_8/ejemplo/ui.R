library(shiny)
library(class)
library(dplyr)
library(stringr)
library(shinydashboard)


shinyUI(
    pageWithSidebar(
        headerPanel ("Aplicacion simple con Shiny"),
        sidebarPanel(
            p("Crear plots con el DF 'iris'"), 
            selectInput("x", "Seleccione el valor de X",
                        choices = names(iris))
        ),
        mainPanel(
            tabsetPanel(
                tabPanel("Plots",
                         h3(textOutput("output_text")), 
                         plotOutput("output_plot"),
                ),
                
                tabPanel("imágenes",
                         img( src = "cor_mtcars.png", 
                              height = 450, width = 450)
                ), 
                
                tabPanel("Summary", verbatimTextOutput("summary")),
                tabPanel("Table", tableOutput("table")),
                tabPanel("Data Table", dataTableOutput("data_table")) 
            )
        )
    )
)
