---
title       : Regresión lineal
subtitle    : Curso Análisis de datos experimentales con R
logo        : db.jpg
author      : Carlos Neftaly Lozano A.
job         : www.microbiostats.com 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : mathjax            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
license     : by-nc-sa
---


## Introducción 

Técnica que permite estimar, proyectar o describir el comportamiento de una variable _dependiente cuantitativa_ en función de otras independientes, _generalmente también cuantitativas_, que se presume inciden o modifican el comportamiento de esta. Y puede ser modelada como una línea recta. 

<span style="display:block; height: 0.8 cm;"></span>


\[ y = \beta_o + \beta_1  + \epsilon \]

<span style="display:block; height: 1.5 cm;"></span>

<img src="assets/img/rg.png" title="plot of chunk unnamed-chunk-1" alt="plot of chunk unnamed-chunk-1" width="700px" style="display: block; margin: auto;" />

---

## ¿Para qué usarla? 


<span style="display:block; height: 1 cm;"></span>

Hay tres usos principales en ciencias biológicas: 

+  Probar hipótesis de relaciones causa y efecto. 
+  Probar hipótesis de asociación entre las variables, pero, sin inferir necesariamente relación causa - efecto.
+ Predecir: Estimar el valor de una variable correspondiente a un valor particular de la otra. 

---

## Modelo de regresión 

Se denomina modelo de regresión, a la ecuación que describe cómo _y_ está relacionada con _x_ y el término de error.

\[\underbrace{y}_{\text{VD}}=\underbrace{\beta_o + \beta_1x}_{\text{Componente lineal}} + \underbrace{\epsilon}_{Error aleatorio}\]

- $\beta_0$ y $\beta_1$ son llamados parámetros del modelo.

- $\epsilon$ término de error. 	

---

## Modelo de regresión 

<span style="display:block; height: 1.5 cm;"></span>

<img src="assets/img/g4.png" title="plot of chunk unnamed-chunk-2" alt="plot of chunk unnamed-chunk-2" width="700px" style="display: block; margin: auto;" />

---
	

## Modelo de regresión 

<span style="display:block; height: 1 cm;"></span>

  \[\widehat{y}=\widehat{\beta}_o + \widehat{\beta}_1x + \epsilon\]
		
		
### Interpretación 

+  $\widehat{\beta}_1$: Cuánto se espera que cambie la variable dependiente (respuesta) por unidad de cambio en Xi.
+ $\widehat{\beta}_o$: Intercepto con y. 
+ ${\widehat{y}}$: es el valor estimado de y dado un valor de x.

---

## Explicando las variaciones....

<span style="display:block; height: 0.5 cm;"></span>

\[\underbrace{SST}_{\sum{(y-\bar{y})^2}}=\underbrace{SSR}_{\sum{(\widehat{y}-\bar{y})^2}}+ \underbrace{SSE}_{\sum{(y-\widehat{y})^2}}\]

<img src="assets/img/g6.png" title="plot of chunk unnamed-chunk-3" alt="plot of chunk unnamed-chunk-3" width="800px" style="display: block; margin: auto;" />


---


## Coeficiente de determinación $R^2$

<span style="display:block; height: 1.5 cm;"></span>

El Coeficiente de determinación ($R^2$) es la proporción de la variación total en la variable dependiente, que es explicada por la variación la variable independiente. 

\[R^2=\frac{SSR}{SST}\]

Donde, 

\[0 \leq R^2 \leq 1\]

---

## Coeficiente de correlación

<span style="display:block; height: 0.5 cm;"></span>

\[r=(\text{signo de} \beta_1) \sqrt{R^2}\]

Donde, 

\[-1 \leq r \leq 1\]

--- 

## Supuestos 

1. El error ($\epsilon$) es una variable aleatoria con media cero.
2. La varianza de $\epsilon$, $\sigma^2$, es la misma para todos los valores de x.
3. Los valores de  $\epsilon$ son independientes. 
4. El error $\epsilon$ está normalmente distribuido. 


---


## Supuestos 

<img src="assets/img/s1.png" title="plot of chunk unnamed-chunk-4" alt="plot of chunk unnamed-chunk-4" width="800px" style="display: block; margin: auto;" />


--- 


## Supuestos 

<img src="assets/img/s2.png" title="plot of chunk unnamed-chunk-5" alt="plot of chunk unnamed-chunk-5" width="800px" style="display: block; margin: auto;" />


--- 

## Supuestos 

<img src="assets/img/s3.png" title="plot of chunk unnamed-chunk-6" alt="plot of chunk unnamed-chunk-6" width="800px" style="display: block; margin: auto;" />


--- 

## Inferencia basadas en $\beta_1$ 

Para poner a prueba la significancia de la relación entre _x_ y _y_, 
sometemos a evaluación la hipótesis nula $\beta_1=0$.


### Hipótesis 
	
	
\[H_0: \beta_1=0\] 
	
\[H_a: \beta_1 \neq 0\]
			
Comúnmente se usa:
	
	
+ Intervalos de confianza

+ Valores P

---


## Veamos un ejemplo.. Ajuste del modelo de regresión






```r
modelo<-lm(eruptions ~ waiting, data=faithful)
```

---


## Veamos un ejemplo.. Ajuste del modelo de regresión


```r
summary(modelo)
```

```
## 
## Call:
## lm(formula = eruptions ~ waiting, data = faithful)
## 
## Residuals:
##      Min       1Q   Median       3Q      Max 
## -1.29917 -0.37689  0.03508  0.34909  1.19329 
## 
## Coefficients:
##              Estimate Std. Error t value Pr(>|t|)    
## (Intercept) -1.874016   0.160143  -11.70   <2e-16 ***
## waiting      0.075628   0.002219   34.09   <2e-16 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 0.4965 on 270 degrees of freedom
## Multiple R-squared:  0.8115,	Adjusted R-squared:  0.8108 
## F-statistic:  1162 on 1 and 270 DF,  p-value: < 2.2e-16
```

---

## Gráficamos 


```r
plot( waiting,eruptions,
xlab='Waiting',ylab='Eruptions',col='blue',pch=1)
abline(modelo,col='red')
```

<img src="figure/unnamed-chunk-10-1.png" title="plot of chunk unnamed-chunk-10" alt="plot of chunk unnamed-chunk-10" style="display: block; margin: auto;" />


---

## Validación

### Normalidad


```r
shapiro.test(modelo$residuals)
```

```
## 
## 	Shapiro-Wilk normality test
## 
## data:  modelo$residuals
## W = 0.99278, p-value = 0.2106
```


---

## Validación  


### Homocedasticidad


```r
hmctest(modelo)
```

```
## 
## 	Harrison-McCabe test
## 
## data:  modelo
## HMC = 0.53377, p-value = 0.767
```


---

## Validación  


### Independencia


```r
dwtest(eruptions~waiting)
```

```
## 
## 	Durbin-Watson test
## 
## data:  eruptions ~ waiting
## DW = 2.561, p-value = 1
## alternative hypothesis: true autocorrelation is greater than 0
```


---
