library(shiny)
library(kmeansrpack)  # Load your package

ui <- fluidPage(
  titlePanel("k-means clustering"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput('xcol', 'X Variable', names(iris)),
      selectInput('ycol', 'Y Variable', names(iris),
                  selected=names(iris)[[2]]),
      numericInput('clusters', 'Cluster count', 3,
                   min = 1, max = 9)
    ),
    
    mainPanel(
      plotOutput('plot1')
    )
  )
)

server <- function(input, output, session) {
  
  selectedData <- reactive({
    iris[, c(input$xcol, input$ycol)]
  })
  
  clusters <- reactive({
    calcCluster(selectedData(), input$clusters)
  })
  
  output$plot1 <- renderPlot({
    plotClusters(selectedData(), clusters())
  })
}

shinyApp(ui = ui, server = server)