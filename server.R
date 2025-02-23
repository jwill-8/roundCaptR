source("helpers.R")
server <- function(input, output, session) {
  ## Main App Header -----------------------------------------------------------
  output$mainAppHeader <- renderUI({
    div(h1("roundCaptR"))
  })
  
  ## subHeader - one of my favorite golf quotes --------------------------------
  output$appSubheader <- renderUI({
    div(h3(HTML(
      "<b><i><u>You have to love it to hate it.</u></i></b>"
    )))
  })
  
  ## Sidebar Header ------------------------------------------------------------
  output$roundInputHeader <- renderUI({
    div(h3("Enter Round Info"))
  })
  
  ## Sidebar inputs ------------------------------------------------------------
  ## Since these are all txt inputs I'll just make them together, 
  purrr::map2(
    c("courseNm", "teesPlayed"), 
    c("Enter Course Name", "Enter Tees Played"),
    function(id, lbl) {
      output[[id]] <- renderUI({
        div(textInput(inputId = id, value = '', label = lbl))
      })
    })
  
  ## Since these are all numeric inputs I'll make them together
  purrr::map(
    toNumericSideBarInputUIValues(), function(paramList) {
      output[[paramList[["id"]]]] <-
        renderUI({
          div(numericInput(
            inputId = paramList[["id"]],
            label = paramList[["label"]],
            value = paramList[["value"]],
            min = paramList[["min"]],
            max = paramList[["max"]]
          ))
        })
    }
  )
  
  output$proceedToHoleByHoleStats <- renderUI({
    req(input$courseNm,
        input$teesPlayed,
        input$holesPlayed,
        input$startHole,
        input$par)
    div(
      class = "centered-button",
      actionButton(
      inputId = "proceedToHoleByHoleStats",
      label = "Click To Begin Entering Hole By Hole Stats"
    ))
  })
  
  ## Stash starting hole in this  will increment as we we enter hole-by-hole stats
  currentHole <- reactiveVal(NULL)
  observeEvent(input$proceedToHoleByHoleStats, {
    
    ## first currentHole is startingHole 
    currentHole(input$startHole) 
    
    ##renderUI 
    output$holeByHoleStatsUI <- renderUI ({
      tagList(
        toHoleScoreInfoUI(currentHole()),
        toTeeBallResultUI(currentHole())
      )
    })
    
  })
  
               
  
  
}