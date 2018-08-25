#' ---
#' title: "Sesión 6 Regresión lineal simple"
#' author: "Nombre y apellido"
#' date: "Mes día,  año"
#' ---


# Cargar paquetes 

library(car)
library(lmtest)


## Cargar datos 

datos<-read.csv('XXXX.csv', header=T, sep=';')


## Ajuste del modelo de regresión
modelo<-lm(y ~ x)
summary(modelo)

## Gráfico 

plot( x,y,
      xlab='xlabel',ylab='ylabel',col='blue',pch=1)
abline(modelo,col='red')

# Validación del modelo 

  ## Normalidad
    shapiro.test(modelo$residuals)
  ## Homocedasticidad
    hmctest(modelo)
  ## Independencia 
    dwtest(y~x)

