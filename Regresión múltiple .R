#' ---
#' title: "Sesión 6 Regresión lineal múltiple"
#' author: "Nombre y apellido"
#' date: "Mes día,  año"
#' ---

## Paquetes
library(corrplot) 
library(MASS)
require(MASS)
######### Cargar datos################
datos<-read.csv('melonoma.csv',header=T, sep=';')
attach(datos)

modelo.fit <- lm(Mortality ~ Longitude + Latitude + as.factor(Ocean) )
summary(modelo.fit) # Ver los resultados del modelo ajustado (Tabla de coeficientes)

## Matríz de crrelaciones

plot(datos[,-1],  pch=16, col="blue")
corrplot(cor(datos[,-1]), method = "square", type='lower')


######### Coeficiente y valores 'predichos'
coefficients(modelo.fit) # Se obtiene los coefciente del modelo
confint(modelo.fit, level=0.95) # Intervalos de confianza al 95% para los coeficientes 

residuals(modelo.fit) # Se obtiene los residuos del modelo

anova(modelo.fit) # Tabla ANOVA 'Completar con diagn?stico de supuestos' 


############# Supuestos y diagn?sticos del modelo ##########
## Outliers
require(car)
outlierTest(modelo.fit)
qqPlot(modelo.fit, main="QQ Plot")

## Normalidad


sresid <- studres(modelo.fit) 
hist(sresid, freq=FALSE, 
     main="Distribuci?n de los residuales")
xfit<-seq(min(sresid),max(sresid),length=40) 
yfit<-dnorm(xfit) 
lines(xfit, yfit)
shapiro.test(sresid);shapiro.test(modelo.fit$residuals)

#### Homocedasticidad
ncvTest(modelo.fit)

spreadLevelPlot(modelo.fit) # plot studentized residuals vs. fitted values 

##### Multicolinealidad
vif(modelo.fit) # Factor de inflaci?n de varianza
(vif(modelo.fit)) >10 # SI el VIF es mayor que  puede ser problem?tico

#### Independencia de los errores
durbinWatsonTest(modelo.fit)

########### Selecci?n de variables sig#####
# Selecci?n del modelo por el m?todo paso a paso adelante


summary(stepAIC(modelo.fit))

