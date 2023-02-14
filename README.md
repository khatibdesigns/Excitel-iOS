# README #

# **Prerequisite**

## 1. ***Be sure you clone the Main branch*** gh repo clone khatibdesigns/Excitel-iOS / https://github.com/khatibdesigns/Excitel-iOS.git

## 2. ***Install cocoapods*** [dependency manager for Swift](https://guides.cocoapods.org/using/getting-started.html)

***In terminal navigate to root folder run:***

    $ sudo gem install cocoapods
    
## 3. ***Install Pods in the project***

***In terminal navigate to the project folder & run:***

    $ pod install
    
## 4. ***Open the Project*** 

After pods have been installed, open the MyExcitel.xcworkspace file


### Task: ###  
### Create an iOS native application by using the following API. ### 

GET
https://excitel-countries.azurewebsites.net/countries

2. Present the results in a list ordered by population in descending order.
3. Provide search functionality by country name (local search). The search must start
automatically after at least 3 characters were entered.
4. When a particular list entry is selected, launch a new screen with more detailed information:

● Country name
● Region
● Population
● Capital
● Flag
● A map centered above the capital

5. Provide support for screen orientation changes.
6. Try to architecture your solution using best practices - separation of concerns, SOLID
principles, etc.
7. Publish your solution in github and send a link.
Note: There are no restrictions related to library usage.
