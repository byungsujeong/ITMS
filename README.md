# ITMS(International Trade Management System)
https://youtu.be/BnmxAKVqJ74

# Summary
Providing WebERP for Managing Export-Import Trade Transactions.

# Languages
* Java
* jsp(HTML5)
* MySQL
* JavaScript
* CSS

# Tools
* eGovFrame_eclipse(https://www.egovframe.go.kr/uss/eng/index.do)
* workbench
* GitHub
* GitKraken
* MS Excel
* CSV

# Frameworks and Technologies
* SPring
* AWS RDS
* jQuery(Ajax)
* Semantic UI(https://semantic-ui.com/)

# APIs & Library
* MyBatis
* jxls
* POI
* jackson-databind

# Features
* Distinguish between corporate and employee logins in the same page.
* Register all employees at once through uploading CSV files.
* Download a list of employees in Excel file by using jxls library

# Trade-off decisions
When signing up as a corporate member, I tried to implement the application so that employees who did not memorize the business information upload the image of the business registration card and sign up in extracted characters without typing the imformation.
However, I had a hard time figuring out how to implement the vision API provided by Kakao in the java environment, and when I tested it with the sample of the business registration card image I had, I couldn't pinpoint the character I wanted.
Eventually, I couldn't use the vision API, but I'd like to try to find the required text using openCV next time.

# Challenges
When uploading a CSV file and enrolling in a batch, ajax asynchronous processing was required because the user had to visually make sure the information to register. That's why I needed to understand the better ajax asynchronous processing.
Also, in order to take advantage of the slide buttons in the Semantic UI, I needed to find the properties of each button. So, using jQuery, I had to improve my ability to find each attribute in the DOM tree by checking the results on the console several times.
