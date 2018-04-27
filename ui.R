ui <- shinyUI( fluidPage(
  h4( "Mona Lisa SVD" ),
  sidebarLayout(
    sidebarPanel(
      sliderInput("sv", "Singular Values", min = 1,
                  max = 50, value = c(1, 10), step = 1 ),
      plotOutput( "SVPlot" )
    ),

    # Plot panel
    mainPanel(
      plotOutput( "FMona", height = "auto", width = "auto" )
    )
  )
))
