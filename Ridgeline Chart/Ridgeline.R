data<-read.csv('"C:/Users/RAD/Downloads/Iris.csv"')

install.packages("ggplot2")
install.packages("ggridges")

ggplot(data, aes(x = Sepal.Length, y = Species, fill = Species)) +
  geom_density_ridges(alpha = 0.6, scale = 1.5) +
  scale_fill_viridis_d() +  # Usa una paleta de color diferente
  theme_minimal() +
  labs(
    title = "Distribución de la Longitud del Sépalo por Especie",
    x = "Longitud del Sépalo",
    y = "Especie"
  )