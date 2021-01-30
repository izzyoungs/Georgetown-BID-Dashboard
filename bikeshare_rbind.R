library(tidyverse)
library(dplyr)
library(magrittr)

# set wd
setwd("~/GitHub/Georgetown-BID-Dashboard")

historicalcabi <- read_csv("bikesharedata.csv")
newcabi <- read_csv("202010-capitalbikeshare-tripdata.csv")

newcabi$updated <- as.Date(newcabi$started_at)
newcabi$updated <- format(newcabi$updated, format="%m/%d/%Y")
newcabi$updated <- as.character(newcabi$updated)

newcabi <- newcabi %>% 
  select(start_station_name, end_station_name, updated, member_casual) %>%
  filter(start_station_name == "M St & Pennsylvania Ave NW" | 
           start_station_name == "C & O Canal & Wisconsin Ave NW" | 
           start_station_name == "Wisconsin Ave & O St NW" | 
           start_station_name == "Georgetown Harbor / 30th St NW" | 
           start_station_name == "37th & O St NW / Georgetown University" |
           start_station_name == "34th & Water St NW" |
           start_station_name == "Potomac & M St NW" |
           end_station_name == "M St & Pennsylvania Ave NW" | 
           end_station_name == "C & O Canal & Wisconsin Ave NW" | 
           end_station_name == "Wisconsin Ave & O St NW" | 
           end_station_name == "Georgetown Harbor / 30th St NW" | 
           end_station_name == "37th & O St NW / Georgetown University" |
           end_station_name == "34th & Water St NW" |
           end_station_name == "Potomac & M St NW")

updatedcabi <- rbind(historicalcabi, newcabi)

write_csv(updatedcabi, "bikesharedata.csv")
