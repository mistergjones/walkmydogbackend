# Walk My dog (Backend) - Connecting Dog Owners with Dog Walkers

## Table of contents

-   [Overview](#overview)
    -   [The challenge](#the-challenge)
    -   [Screenshot](#screenshot)
    -   [Links](#links)
-   [The process](#the-process)
    -   [Built with](#built-with)
    -   [What we learned](#what-we-learned)
    -   [Continued development](#continued-development)
    -   [Useful resources](#useful-resources)
-   [Authors](#authors)

## Overview

### The challenge

The key challenge of this application was to incorporate a payment gateway & Single Sign On (SSO) allowing Dog Owners to book a dog walker and pay them on completion. Think Uber but for Dog Owners.

The main backend technologies (amongst others) underpinning the above utilises Express, Postgres, Stripe and Yup.

### Screenshot

-   Coming Soon
<!-- ![Example screenshot](screenshot.png) -->

### Links

-   Solution URL: []
-   Solution Code Frontend: [https://github.com/mistergjones/walkmydog]
-   Solution Code Backend: [https://github.com/mistergjones/walkmydogbackend]

## The process

-   Establish the idea.
-   whiteboard / develop UI flows.
-   create database table structure (normalised).
-   identify key technologies (i.e. Axios, Node.js, Cloudinary, Stripe) that will for part of the solution.

### Built with

-   Bcrpyt (for encryption)
-   Cors (caters for accessing a web server from a different origin)
-   Dotenv (for environment variables)
-   Express (the WAF)
-   Jsonwebtoken (for cookie persistence)
-   PG (for Postgress Database) (for animated pics)
-   Stripe (for payment processing)
-   Yup (for data validation)

### What was learnt

-   To be documented

<!-- 1. Really enjoyed defining my own mathematical functions to calculate moving averages and RSI. The function below demonstrates the requirement to push a rolling 14 day average into an array for subsequent use.

```js
function calculateFirst14DayAverage(movingAverageDays, theDataArray) {
    var tempArray = [];
    var runningTotal = 0;
    for (i = 0; i < movingAverageDays; i++) {
        runningTotal = runningTotal + theDataArray[i];
    }

    tempArray.push(runningTotal / movingAverageDays);

    return tempArray;
}
``` -->

### Continued development

-   To be documented

## Authors

-   Glen Jones - [https://www.glenjones.com.au]
-   Peter Hristakos
