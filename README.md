# SLAM_MatlabProject

## Exercici SLAM en Matlab de l'assignatura de Robòtica Terrestre del Màster de Robòtica d'Eurecat

L'script "SlamScript" utilitza totes les funcions proporcionades per a tal de recrear el mapa proporcionat.

## Imatge proporcionada:

<img src="images/1.JPG" width="500">


## Solució aconseguida:

<img src="images/Sol.jpg" width="700">


## Proposta de millora:

Factor 5:

Mesura: [1.2; 30*pi/180], Covariance: diag([[1.5e-2, (10/180)*2])

    abans: 1.5                              1.3e-2
    
Factor 8:

Mesura: [2.5;_-28*pi/180], Covariance: diag([2e-2, (7*pi/180)*2])

    abans: 2.8                              4e-2
    
Factor 9:

Mesura: [1.7; -35*pi/180], Covariance: diag([1.5e-2, (10*pi/180)*2])

    abans:  2.5                             2e-2

## Solució millorada:

script "SlamScriptv2"

<img src="images/Sol2.jpg" width="700">


En la solució millorada l'estat 6 en l'eix x ja no s'en va fins a més de 2.5 i l'estat 4 segueix amb una x entre l'estat 2 i 6. Això s'aproxima bastant més a la realitat.

En les y, l'estat 6 també arriba a -1, que en la primera proposta no hi arribava.
