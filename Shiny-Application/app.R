## ui.R
library(shiny)

# Define the user interface (UI)
ui <- fluidPage(
  titlePanel("Payroll Calculator"),
  
  sidebarLayout(
    sidebarPanel(
      numericInput("hours_worked", "Hours Worked:", 40, min = 0),
      numericInput("hourly_rate", "Hourly Rate ($):", 15, min = 0),
      numericInput("overtime_threshold", "Overtime Threshold (hours):", 40, min = 0),
      numericInput("tax_rate", "Tax Rate (%):", 20, min = 0),
      actionButton("calculate_button", "Calculate")
    ),
    mainPanel(
      h4("Payroll Results:"),
      textOutput("gross_pay"),
      textOutput("tax_deduction"),
      textOutput("net_pay")
    )
  )
)

server <- function(input, output) {
  observeEvent(input$calculate_button, {
    # Calculate gross pay
    hours_worked <- input$hours_worked
    hourly_rate <- input$hourly_rate
    overtime_threshold <- input$overtime_threshold
    tax_rate <- input$tax_rate
    
    if (hours_worked > overtime_threshold) {
      regular_hours <- overtime_threshold
      overtime_hours <- hours_worked - overtime_threshold
    } else {
      regular_hours <- hours_worked
      overtime_hours <- 0
    }
    
    gross_pay <- (regular_hours * hourly_rate) + (overtime_hours * hourly_rate * 1.5)
    
    # Calculate tax deduction
    tax_deduction <- (gross_pay * (tax_rate / 100))
    
    # Calculate net pay
    net_pay <- gross_pay - tax_deduction
    
    # Update the output elements
    output$gross_pay <- renderText({
      paste("Gross Pay: $", formatC(gross_pay, format = "f", digits = 2))
    })
    
    output$tax_deduction <- renderText({
      paste("Tax Deduction: $", formatC(tax_deduction, format = "f", digits = 2))
    })
    
    output$net_pay <- renderText({
      paste("Net Pay: $", formatC(net_pay, format = "f", digits = 2))
    })
  })
}

shinyApp(ui = ui, server = server)
