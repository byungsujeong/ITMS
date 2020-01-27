# ITMS(International Trade Management System)

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
* Distinguish between corporate and employee logins at same page.
* Register employees en masse through uploading CSV files.
* Download a list of employees in Excel file using jxls library

# Trade-off decisions
When signing up as a corporate member, I tried to implement the application so that employees who did not memorize the business information upload the image of the business registration card and sign up in extracted characters without having to enter it directly.
However, I had a hard time figuring out how to implement the vision API provided by Kakao in the java environment, and when I tested it with the sample of the business registration card image I had, I couldn't pinpoint the character I wanted.
Eventually, I couldn't use the vision API, but I'd like to try to find the required text using openCV next time.

# Challenges
