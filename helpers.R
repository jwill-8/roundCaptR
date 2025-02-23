toHolesPlayedOrder <- function(startingHole = 1, holesPlayed = 18) {
  
  if (startingHole == 1) {
    #1:18
    return(startingHole:holesPlayed)
  } 
  
  startingHoleUntil18 <- startingHole:holesPlayed
  
  remainingHoles <- 1:(holesPlayed - length(startingHoleUntil18))
  
  return(c(startingHoleUntil18, remainingHoles))
}

toNumericSideBarInputUIValues <- function() {
  inputs <- list(
    "id" = c("yardage", "par", "holesPlayed", "startHole"),
    "label" = c(
      "Enter Total Yardage Played",
      "Enter Total Par",
      "Enter Number of Holes Played",
      "Enter Starting Hole"
    ),
    "value" = c(6600, 72, 18, 1),
    "min" = c(0, 0, 9, 1),
    "max" = c(10000, 74, 18, 18)
  )
  
  purrr::pmap(inputs, function(id, label, value, min, max) {
    list(
      "id" = id,
      "label" = label,
      "value" = value,
      "min" = min,
      "max" = max
    )
  })
}


## Hole by hole stats ui -------------------------------------------------------

## User logs: 
## Hole par, 
## Hole score,
## 

## Hole by Hole stats info:
toHoleByHoleStatsUI <- function(currentHole) {
  
}
## Tee Ball Choices ------------------------------------------------------------
toTeeBallResultChoices <- function() {
  c(
    "Fairway",
    paste("Fringe", c("Left", "Right", "Short", "Long"), sep = " - "),
    paste("Rough", c("Left", "Right", "Short", "Long"), sep = " - "),
    paste("Bunker", c("Left", "Right", "Center", "Short", "Long"), sep = " - "),
    paste("OB", c("Left", "Right", "Short", "Long"), sep = " - ")
  )
}

toApproachChoices <- function() {
  c(
    paste("Green Hit", c("Left", "Right", "Front", "Back"), sep = " - "),
    paste("Green Missed", c("Left", "Right", "Short", "Long"), sep = " - "),
    paste("Green Missed - Bunker", c("Left", "Right", "Short", "Long"), sep = " - ")
  )
}

toHoleScoreInfoUI <- function(currentHole) {
  div(
    class = "hole-by-hole-teeball-fieldset",
    tags$fieldset(
      tags$legend("Score"),
      div(
        class = "hole-by-hole-input-row",
        numericInput(
          inputId = paste0("par", currentHole),
          label = "Enter hole par",
          value = 4,
          min = 3,
          max = 5,
          step = 1,
          width = "50%"
        ),
        numericInput(
          inputId = paste0("score", currentHole),
          label = "Enter hole score",
          value = 4,
          min = 1,
          max = 10,
          step = 1,
          width = "50%"
        ),
        numericInput(
          inputId = paste0("handicap", currentHole),
          label = "Enter hole handicap",
          value = 9,
          min = 1,
          max = 18,
          step = 1,
          width = "50%"
        )
      )
    )
  )
}

toTeeBallResultUI <- function(currentHole) { 
  div (
    class = "hole-by-hole-teeball-fieldset", 
    tags$fieldset(
      tags$legend("Tee Ball Result"),
      div(
        class = "hole-by-hole-input-row",
        selectInput(
          inputId = paste0("teeBallResult", currentHole),
          "Result of tee ball",
          choices = toTeeBallResultChoices(),
          multiple = FALSE
        ),
        numericInput(
          inputId = paste0("teeBallDistance", currentHole),
          label = "Tee ball distance (total)",
          value = 230,
          min = 0,
          max = 1000,
          step = 1
        )
      )
      
    )
  )
}


## TODO --
## GIR (auto generated)
## Putts
## Score
## Vibe
## ARG paces to hole (conditional render based on putts/score)

## 
