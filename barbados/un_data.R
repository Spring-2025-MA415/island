library(dplyr)
source("helper_functions.R")

# make sure i make good use of shiny
# data analysis
# clean code
# clean repo


####### UN Data #######

# demographics, contains all UN country data
demographics <- read.csv("data/WPP2024_Demographic_Indicators_Medium.csv.gz")

# filtering to get all Barbados information
demographics <- demographics |> filter(Location == "Barbados")
demographics <- demographics |> drop_one_value_col()

# filtering further since lots of data
population <- demographics |> select(Time, TPopulation1Jan, TPopulation1July, 
                                     TPopulationMale1July, TPopulationFemale1July,
                                     PopDensity, PopSexRatio, MedianAgePop, 
                                     NatChange, NatChangeRT, PopChange, PopGrowthRate,
                                     DoublingTime)
births <- demographics |> select(Time, Births, Births1519, CBR, TFR, NRR, MAC, SRB)
deaths <- demographics |> select(Time, Deaths, DeathsMale, DeathsFemale, CDR)
life_expectancy <- demographics |> select(Time, LEx, LExMale, LExFemale, LE15, LE15Male, 
                                          LE15Female, LE65, LE65Male, LE65Female, LE80,
                                          LE80Male, LE80Female)
mortality <- demographics |> select(Time, InfantDeaths, IMR, LBsurvivingAge1, Under5Deaths, 
                                    Q5, Q0040, Q0040Male, Q0040Female, Q0060, Q0060Male,
                                    Q0060Female, Q1550, Q1550Male, Q1550Female, Q1560,
                                    Q1560Male, Q1560Female)
migrations <- demographics |> select(Time, NetMigrations, CNMR)

