# import libraries
library(dplyr)
library(readxl)
library(writexl)

# import datasets from Excel
table_1 <- read_excel("c:/Users/fox/Desktop/eefp/table 1.xlsx")
table_2 <- read_excel("c:/Users/fox/Desktop/eefp/table 2.xlsx")

# join tables replacing NA in table 1 using values from table 2
table_final <- table_1 %>% 
  left_join(table_2, by = "name") %>% 
  mutate(cws = coalesce(cws.x, cws.y), pages = coalesce(pages.x, pages.y)) %>% 
  select(-cws.x, -cws.y,-pages.x, -pages.y) %>% mutate(net_pages = round((cws/1800),2))

# save the resulting dataset in Excel
write_xlsx(table_final,"c:/Users/fox/Desktop/eefp/table_final.xlsx")

x1 <- data.frame(list.files("c:/Users/fox/Desktop/eefp", recursive = T, include.dirs = T))
colnames(x1) <- c('name')
write_xlsx(x1,"c:/Users/fox/Desktop/eefp/x1.xlsx")
