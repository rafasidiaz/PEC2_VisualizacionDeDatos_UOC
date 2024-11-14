# Instalar ggplot2 si no está instalado
install.packages("ggplot2")

# Cargar ggplot2
library(plotly)
library(dplyr)

# Cargar los datos
data <- read.csv("C:/Users/RAD/Downloads/heart.csv")

# Crear el scatterplot en 3D
fig <- plot_ly(data, 
               x = ~age, 
               y = ~cholestoral, 
               color = ~factor(target),
               colors = c('#636EFA', '#EF553B')) %>%
  add_markers() %>%
  layout(
    scene = list(
      xaxis = list(title = 'Edad'),
      yaxis = list(title = 'Máxima Frecuencia Cardíaca')
    ),
    title = "Edad frente a Colesterol considerando la posibilidad de enfermedad cardíaca"
  )

fig
