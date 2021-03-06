shinyServer(function(input, output, session) {
  aspect <- 200 / 298
  res <- 72
  size <- 8
  h <- size * res
  w <- size * res * aspect
  output$FMona <- renderPlot (height = h, width = w, {
    svd <- svd(mona)
    s <- rep(0, 200)
    s[input$sv[1]:input$sv[2]] <- svd$d[input$sv[1]:input$sv[2]]
    D <- diag(s)
    fmona <- svd$u %*% D %*% t(svd$v)
    par(mar = c(0, 0, 0, 0))
    image(
      z = fmona,
      col = pal,
      axes = FALSE,
      xlab = NA,
      ylab = NA
    )
  })

  output$SVPlot <- renderPlot ({
    s <- svd(mona)
    S <- data_frame(Number = seq(1, 50), SValue = s$d[1:50])
    P <- data_frame(Number = input$sv[1]:input$sv[2],
                    SValue = s$d[input$sv[1]:input$sv[2]])
    drng <- range(s$d[1:50])
    ymin <- drng[1]
    ymax <- drng[2] * 1.1
    xmin <- input$sv[1] - 0.5
    xmax <- input$sv[2] + 0.5
    w <- input
    R <- data_frame(xmin = xmin, xmax = xmax, ymin = ymin, ymax = ymax)
    gSV <- ggplot() +
      geom_rect(data = R,
                aes(xmin = xmin, ymin = ymin, xmax = xmax, ymax = ymax),
                alpha = 0.2,
                color = "gray") +
      geom_point(data = S,
                 inherit.aes = FALSE,
                 aes(x = Number, y = SValue)) +
      geom_point(data = P,
                 aes(x = Number, y = SValue),
                 color = "red") +
      labs(x = "Number", y = "Singular Value") +
      theme(text = element_text(size = 20)) + xlim(0.4, 50.6) +
      scale_y_log10()

    gSV
  })
})
