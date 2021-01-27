#analyze_trends.R

#Load Highway Statistics Datasets
VM2_df <- read.csv("inst/extdata/Highway_Statistics/vm2/vm2.csv")
MV1_df <- read.csv("inst/extdata/Highway_Statistics/mv1/mv1.csv")
MF21_df <- read.csv("inst/extdata/Highway_Statistics/mf21/mf21.csv")
DL22_df <- read.csv("inst/extdata/Highway_Statistics/dl22/dl22.csv")

#Plot relationship of fuel consumption to VMT
plotFuelVsVmt <- function(Year) {
  RemoveRow <- which(VM2_df$State == "TOTAL")
  Fuel_St <- MF21_df[-RemoveRow, paste0("X", Year)]
  names(Fuel_St) <- MF21_df[-RemoveRow, "STATE"]
  Vmt_St <- VM2_df[-RemoveRow, paste0("X", Year)]
  names(Vmt_St) <- VM2_df[-RemoveRow, "STATE"]
  plot(Fuel_St ~ Vmt_St)
}
