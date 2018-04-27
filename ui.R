ui <- shinyUI(
  fluidPage(
    h4("Mona Lisa SVD"),
    sidebarLayout(
      sidebarPanel(
        sliderInput(inputId = "sv",
                    label = "Singular Values",
                    min = 1, max = 50, step = 1,
                    value = c(1,10)
        ),
        plotOutput(outputId = "SVPlot")
      ),
      mainPanel(
        plotOutput(outputId = "FMona",
                   height = "auto",
                   width = "auto"
        )
      )
    )
  )
)
