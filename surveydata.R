library(cesR)
library(tidyverse)

get_ces("ces2019_web")
raw_data <- ces2019_web
raw_data <- labelled::to_factor(raw_data)
reduced_data <- 
  raw_data %>% 
  select(cps19_citizenship,
         cps19_age,
         cps19_province,
         cps19_education,
         cps19_gender,
         cps19_lr_parties_1,
         cps19_lr_parties_2,
         cps19_votechoice,
         cps19_income_number,
         cps19_income_cat,
         cps19_lr_scale_bef_1
         )%>%
  filter(cps19_votechoice != "NA")



reduced_data<-
  reduced_data %>%
  mutate(vote_liberal = ifelse(cps19_votechoice == "Liberal Party", 1, 0),
         vote_conservative = ifelse(cps19_votechoice == "Conservative Party", 1, 0))


# Saving the survey/sample data as a csv file in my working directory
write_csv(reduced_data, "CES(survey).csv")


