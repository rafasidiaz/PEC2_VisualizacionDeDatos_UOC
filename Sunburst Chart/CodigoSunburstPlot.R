library(dplyr)
library(plotly)
library(tidyr)

mov = read.csv("C:/Users/RAD/Downloads/processed_data2.csv")

mov = mov[,1:2]

dist <- distinct(mov)
dist <- dist[,c(2,1)]

numero_modelos <- mov %>%
  count(phone_brand, phone_model) %>%
  arrange(phone_brand, desc(n)) 
numero_modelos = numero_modelos[,2:3]

numero_marcas <- mov %>%
  count(phone_brand) %>%
  arrange(phone_brand) 

marcas <- mov %>% 
  distinct(phone_brand)
marcas <- marcas[,1]
modelos <-  mov %>% 
  distinct(phone_model)
modelos <- modelos[,1]


labels <- append(modelos,marcas)
df <- as.data.frame(labels)
df <- merge(df,dist, by.x = 'labels', by.y = 'phone_model',all.x = TRUE)
df$n <- ifelse(df$labels %in% numero_marcas$phone_brand, numero_marcas$n[match(df$labels,
                                                                               numero_marcas$phone_brand,)], NA)
df <- merge(df,numero_modelos, by.x = 'labels', by.y = 'phone_model',all.x = TRUE)
df$n.x <- replace_na(df$n.x,0)
df$n.y <- replace_na(df$n.y,0)
df$n <- df$n.x + df$n.y

df <- df[df$n > 4,]

fig <- plot_ly(
  labels = df$labels ,
  parents = df$phone_brand,
  values = df$n,
  type = 'sunburst',
  branchvalues = 'total'
)

fig




