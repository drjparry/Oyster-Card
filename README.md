#Oystercard Challenge - Week 2 Maker's Academy

##What is it?

Oyster Card is a program that mimicks the functionality of the real Oyster Card for the Underground. It allows a user to top up the balance, touch in and touch out, be penalized and have money deducted if they fail to complete a jounrney. 

##Objective

The main objectives this week are to practice more Test Driven Development usign RSPEC, including the use of doubles, mocks and stubs. We also aim to improve our OOP best practices through the implementation of Single Responsibility, Open and Closed principle and law of Demeter. In particular, the focus will be on extracting classed. 

## Authors: 
David Parry, Eduardo Delgado, Russell Vaughan, Tom Pickard, Barry Grubb, and Alain Lemaire

## Our approach

Oystercard class: responsible for topping up, touching in, and touching out.
Journey class: responsible for managing the journey, calculating the fare, and deducting a penalty when necessary
JourneyLog class: responsible for recording the journey and logging the history of all journeys
Station class: responsible for creating stations


```
User Stories

Here are the user stories you will be working on for this project:

In order to use public transport
As a customer
I want money on my card

In order to keep using public transport
As a customer
I want to add money to my card

In order to protect my money
As a customer
I don't want to put too much money on my card

In order to pay for my journey
As a customer
I need my fare deducted from my card

In order to get through the barriers
As a customer
I need to touch in and out

In order to pay for my journey
As a customer
I need to have the minimum amount for a single journey

In order to pay for my journey
As a customer
I need to pay for my journey when it's complete

In order to pay for my journey
As a customer
I need to know where I've travelled from

In order to know where I have been
As a customer
I want to see to all my previous trips

In order to know how far I have travelled
As a customer
I want to know what zone a station is in

In order to be charged correctly
As a customer
I need a penalty charge deducted if I fail to touch in or out

In order to be charged the correct amount
As a customer
I need to have the correct fare calculated

```

Installation and use. 
