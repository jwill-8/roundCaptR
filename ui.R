ui <- fluidPage(
  tags$style(HTML(
    "
    .centered-button {
      display: flex;
      justify-content: center;
    }
    
    .hole-by-hole-teeball-fieldset {
    border: 10px solid green;
    padding: 20px;
    }
    
    .hole-by-hole-teeball-fieldset legend {
    font-weight: bold;
    color: #FF1493;
  }
    .hole-by-hole-teeball-fieldset 
    .hole-by-hole-input-row {
    display: flex;               
    justify-content: center;     
    gap: 15px;                   
    flex-wrap: wrap; 
    }
    
    .hole-by-hole-teeball-fieldset {
    align-items: center;
    border: 5px solid green;
    margin: 20px 0;
    }
  "
  )),
  uiOutput('mainAppHeader'),# app nm,
  uiOutput('appSubheader'), # quote - 
  sidebarLayout(
    sidebarPanel = sidebarPanel(
      uiOutput('roundInputHeader'), #Header
      uiOutput('courseNm'), # Course Nm
      uiOutput('teesPlayed'), # Tees
      uiOutput('yardage'), # Yardage,
      uiOutput('par'), # Par,
      uiOutput('holesPlayed'), # holes played
      uiOutput('startHole'),
      uiOutput('proceedToHoleByHoleStats')# starting hole
      ),
    mainPanel(
      tabsetPanel(
        id = "mainTabset",
        tabPanel(
          title = "Enter Hole By Hole Stats",
          uiOutput('holeByHoleStatsUI')
        )
      )
    )
  )
)