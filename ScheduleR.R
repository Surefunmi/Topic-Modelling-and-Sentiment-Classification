install.packages("taskscheduleR")
library(taskscheduleR)
#install.packages("minUI")
#install.packages("shiny")
#install.packages("shinyFiles")
#library(miniUI)
#library(shiny)
#library(shinyFiles)

taskscheduler_create(
  taskname = "webscraping_boards",
  rscript = "",
  schedule = "",
  starttime = format(sys.time() + 62, "%H:%M"),
  startdate = format(Sys.Date(), "%m/%d/%Y"),
  Rexe = file.path(Sys.getenv("R_HOME"), "bin", "Rscript.exe")
)