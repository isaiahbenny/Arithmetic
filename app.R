library(shiny)

ui <- fluidPage(
    titlePanel("Let's Do Arithmetic!"),
    sidebarLayout(
        sidebarPanel(
            numericInput(inputId = "number1",
                         label = "Number 1",
                         value = 0),
            numericInput(inputId = "number2",
                         label = "Number 2",
                         value = 0),
            actionButton(inputId = 'click_add',
                         label = "Add"),
            actionButton(inputId = 'click_multiply',
                         label = "Multiply")
            
        ),
        mainPanel(
            h2("The sum of the two numbers is:"),
            textOutput("sum"),
            h2("The product of the numbers is:"),
            textOutput('product')
        )
    )
)

server <- function(input, output) {
    s <- eventReactive(input$click_add, {
      as.numeric(input$number1) + as.numeric(input$number2)
    })
    
    p <- eventReactive(input$click_multiply, {
      as.numeric(input$number1) * as.numeric(input$number2)
    })
    output$sum <- renderText({
        s()
    })
    output$product <- renderText({
      p()
    })
}

shinyApp(ui = ui, server = server)


