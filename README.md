# Final Project Links

- [Final Deployed Website](https://the-menu-client.netlify.app/)
- [Api address](https://the-menu-api.herokuapp.com/)
- [Front End React Github](https://github.com/dannyknows/the-menu-client)
- [Back End Rails Api Github](https://github.com/cDask/the-menu-api)

# Set up

To use the web site locally some things are required to set it up properly. Including a local copy of both the client repository and the back end repository. These instructions will only work on Linux and Mac

## 1. Set up Rails Back End

1. git clone the project from the repository [here](https://github.com/cDask/the-menu-api) in a directory of your choice.
2. Using CLI `cd` into the directory and run:

```
  bundle install
```

3. Create the database by running:

```
rails db:create
```

4. Migrate the database using:

```
rails db:migrate
```

- OPTIONAL: To get some seed data run:

```
rails db:seed
```

5. You will need to make a master key in order to get the backend to work to do this delete the `credentials.yml.enc` from the config directory.
6. Run

```
run rails credentials:edit
```

To generate a new `master.key`

7. To run the rails server locally run:

```
rails server
```

## 2. Set up React Front End

1. git clone the front end from the repository [here](https://github.com/cDask/the-menu-api) into a directory of your choice
2. Using the command line `cd` into the directory and run:

```
 yarn install
```

To install all dependencies.

3. To get the project to function you will need to create a file and name it `.env.development`.
4. Paste the below code into the file:

```
PORT=8080
REACT_APP_BACKEND_URL=http://localhost:3000
```

5. To run the front end server run:

```
yarn start
```

6. This will open the project in your browser but can also be found on the address: [localhost:8080/](http://localhost:8080/)
7. If you seeded data in the steps above you can test functionality using the following credentials:

```
email: test@test.com
password: testpass
```

# Libraries

Several libraries were utilised in this project. Below is a comprehensive list of libraries used in the front end and the back end.

## Rails Back End Libraries

- jbuilder - This is the json builder to create the complex json responses from our api.
- bcrypt - Library used to encrypt data for our user authentication
- knock - User authentication library
- rspec-rails - Testing library used to do unit testing and integration testing of the back end.
- factory_bot_rails - Testing library that creates fake entries to be used for our back end testing.
- should-matchers - Testing library that gives more powerful functionality to create test cases.
- simplecov - A test coverage library that creates a back end testing report.
- database cleaner - A library that cleans up any records from the database created during testing.
- rubocop-rails - A linter to ensure that our code follow a specific format.
- faker - A library used to create random data for our seeds
- aws-sdk-s3- A library to allow for aws s3 bucket integration. This was set up but was never used. (NOTE: INSTALLED BUT UNUSED)

## React Front End Libraries

- Cypress - Testing library to do our end to end tests
- jackfranklin/test-data-bot - Similar to factory bot a library that creates test records to be used in testing.
- styled components - A styling library that allows for styled components
- react color - A library that provides different colour pickers that can be used in react

# Purpose

The Purpose of our app is to create a platform for small restaurant owners to establish an online presence.

With "final project name" the restaurant owner will be able to create a simple page with general information about their business to have a google page ranking.

Currently the skew of restaurant online representation is large and confusing. Some opt for just a google maps listing, having only opening hours, address and contact information. Others options are a facebook page, which offers less customisation, or a full fledges wix website which can be time consuming and confusing.

We aim to solve this problem of multiple identities, where businesses can collected all their information in one place, while linking already established identities, such as Instagram, UberEats and or Google Maps.

# Features/Functionality

The final application should have the following features

- Account registration - User should be able to sign up for a new account
- Log in functionality - Registered User should be able to log in to their accounts
- Create a restaurant web page - A user should be able to create and add a new restaurant page
- Create/Add a menu to a restaurant - Users should have the ability to add one or more menus to their restaurants
- Create/Add items to menus - Users should be able to add items to their menus
- Tag items - Items should be able to have one or several different tags such as dietary information like vegan, gluten free etc.
- Add ingredients to items - A user should be able to add ingredients to their items
- Different sizes or prices - A user should be able to have different sizes of item that can have different prices. For examples glass of wine or bottle of wine.
- Pick different themes for menus and items - Users should be able to pick different layouts/themes for their menus and items
- Pick different colours and styles for restaurant, menus and items - A user should be able to customize the colours, fonts and styles of their restaurant page, menu sections and each item in their menus.
- Add extra contact information - A user should be able to add additional information about their restaurant such as google maps link, phone number, social media or delivery service.
- Edit their webpage - Users should be able to edit their restaurant web page including themes, styles and information.
- Unique URLs - Restaurants should have unique web urls
- View their webpage - Anybody should be able to view the restaurants webpage

# Target Audience

The target audience for this project is aimed specifically at small restaurant owners who may not have their own website or web presence. This service is to give those small business owner an opportunity to have an customizable webpage to show case their restaurant. This site could also be suitable for larger restaurant owners who want a quick and easy way to get some online presence without having to build their own website.

It will also target everyday restaurants customer who are looking for more information about local smaller restaurants online and want to see their menu offerings as well as filter through their menu depending on different criteria.

# Tech Stack

Backend Language/Framework

- Ruby on Rails

Front End Framework

- React
- CSS/SASS

Database

- PostgreSQL

Image Storage

- AWS S3 Buckets

External APIs

- Stripe

Version Control/Repo Hosting

- Git/Github

Deployment Services

- Heroku
- Netlify

# User Stories

## Restaurant Owners

My name is Jimmy Hendrix, I own a small juice bar called Jacked Juice. I wish to establish an online presence but don’t have the time or money to set up a complete website.

- I want to create an account. Fill out information about the items on my menu
- I want to have a site generated for my restaurant displaying opening hours and street address.
- I also want to have a link to my Instagram on the site.

My name is Elon Tusk, I manage a small burger chain, each shop has a different menu. I already have an account with “final project name".

- I want to update opening hours of a restaurant
- I want to add a new item to a menu.

My name is Al Capone, I help out at my parents restaurant. They have a Hawaiian lunch and Italian dinner menu as well as a drinks and happy hour menu.

- I want to create multiple menus
- I want to have a theme each of them.

My name is Dandrews, I run a small food truck. I don’t have the means to set up a complete website.

- I want to create a “final project name” site.
- I want it to display the hours I operate
- I want to list the multiple locations I operate my truck from
- I also want to list the food available.

## Customers

My name is Angela Merkel, I’ve come to a new area of my city and am craving banana cake. After googling local bakeries I find a “final project name” site on here;

- I want to search the menu for banana bread,
- I want to find opening hours and a phone number.
- I want to enjoy cake

My name is Austin Powers, I have a favourite restaurant in my town and I wish to know more about their menu and the gluten free options available. I visit their “final project name” site on here;

- I want to organise the menu prioritising gluten free.
- I want to see what items they deliver

My name is The Zuck, I want to find out what my local Chilean restaurant offers for take away and their phone number. I google Chilean food and find a "final project name" listing on here;

- I also want to find their vegan options available for takeaway.
- I want to find their UberEats Account

# Dataflow Diagram

![Dataflow Diagram](./resources/DatafFlowDiagram.png)

# Entity Relationship Diagram

![ERD](./resources/ERD.png)

# Application Architecture Diagram

![Application Architecture Diagram](./resources/AppArchitectureDiagram.png)

# Wire Frames

Below are the wire frames for this project, to better understand them the following legend has been provided.

![Wire Frame Legend](./resources/wireframes/mobile/Legend.png)

As shown on the legend above image place holder are represented by large grey square, user input by grey rectangles with text and button by blue rounded rectangles.

## Mobile

### Landing Page

![Landing Page](./resources/wireframes/mobile/Landing.png)

The landing page will have a large image as a background.

### Log In

![Login](./resources/wireframes/mobile/Login.png)

### Sign Up

![Sign Up](./resources/wireframes/mobile/CreateAccount.png)

### Update Account

![Update Account](./resources/wireframes/mobile/UpdateAccount.png)

### User DashBoard

![Account](./resources/wireframes/mobile/Account.png)

Clicking the edit button will allow a user to change their password, name and email.

### Restaurant Creation

![Create Restaurant](./resources/wireframes/mobile/CreateRestaurant.png)

Clicking add for opening hours and contact details will add a form below each section respectively to allow for a user to fill in and add a new entry.

Clicking the colours in the colour scheme will open a colour selector in which a user could select a colour.

Filling in the text input labelled "Enter Menu Name" and pressing Add a Menu will add a new Menu.

### Menu Theme Selection

![Pick Menu Theme](./resources/wireframes/mobile/PickMenuTheme.png)

Clicking the colours in the colour scheme will open a colour selector in which a user could select a colour.

### Item Theme Selection

![Pick Item Theme](./resources/wireframes/mobile/PickItemTheme.png)

Clicking the colours in the colour scheme will open a colour selector in which a user could select a colour.

### Menu Item

![Add Item](./resources/wireframes/mobile/AddItem.png)

Pressing the grey image box below will allow you to upload an image.

### Menu View

This wire frame shows how the menu might look like on a final page restaurant page.

![Menu View](./resources/wireframes/mobile/MenuView.png)

### Tag Filter Selection

The following wire frames shows how filtering of tags might work on a final page.

![Filter Options Menu](./resources/wireframes/mobile/FilterOptionsMenu.png)

![Filter Options Menu 2](./resources/wireframes/mobile/FilterOptionsMenu-1.png)

## Desktop

### Landing Page

![Landing Page](./resources/wireframes/desktop/Landing.png)

The landing page will have a large image as a background.

### Log In

![Login](./resources/wireframes/desktop/LogIn.png)

### Sign Up

![Create Account](./resources/wireframes/desktop/CreateAccount.png)

### User DashBoard

![User Dashboard](resources/wireframes/desktop/UserDashboard.png)

Clicking the edit button will allow a user to change their password, name and email.

The grey image box will show a preview of the website.

Clicking add for opening hours and contact details will add a form below each section respectively to allow for a user to fill in and add a new entry.

### Restaurant Creation

![Create a restaurant](./resources/wireframes/desktop/CreateARestaurant.png)

Clicking add for opening hours and contact details will add a form below each section respectively to allow for a user to fill in and add a new entry.

Clicking the colours in the colour scheme will open a colour selector in which a user could select a colour.

Filling in the text input labelled "Enter Menu Name" and pressing Add a Menu will add a new Menu.

### Item Page

![Item Page](./resources/wireframes/desktop/ItemPage.png)

Pressing the grey image box below will allow you to upload an image.

## Theme Selection

![Theme Selection](resources/wireframes/desktop/StylePage.png)

Clicking the colours in the colour scheme will open a colour selector in which a user could select a colour.

The images will give you a preview of the themes chosen.

### Restaurant Edit View

![Restaurant Edit View](./resources/wireframes/desktop/RestaurantEditView.png)

In this view you should be able to press an item/menu/the restaurant to get a colour selector to choose some of the colours. Clicking any of the edit icon will bring you to the appropriate pages for editing.

### Restaurant View

![Restaurant View](./resources/wireframes/desktop/RestaurantView.png)

This is what a final page restaurant may look like on desktop.

## Custom Templates

Restaurant owners will be given three templates for their menus and menu items below are the wire frames that outline how these would look like both on mobile and desktop.

### Menu Templates

#### Menu Template 1

![Menu Template 1](resources/wireframes/desktop/MenuTemplate1.png)

![Menu Template 1](resources/wireframes/mobile/MenuTemplate1.png)

#### Menu Template 2

![Menu Template 2](resources/wireframes/desktop/MenuTemplate2.png)

![Menu Template 2](resources/wireframes/mobile/MenuTemplate2.png)

#### Menu Template 3

![Menu Template 3](resources/wireframes/desktop/MenuTemplate3.png)

![Menu Template 3](resources/wireframes/mobile/MenuTemplate3.png)

### Item Templates

Items template will look the same on both desktop and mobile

#### Item Template 1

![Item Template 1](./resources/wireframes/desktop/ItemTemplate1.png)

#### Item Template 2

![Item Template 2](./resources/wireframes/desktop/ItemTemplate2.png)

#### Item Template 3

![Item Template 3](./resources/wireframes/desktop/ItemTemplate3.png)

### Final Template

This is what a web page may look like both on mobile and desktop after these templates has been applied.

![Restaurant Mobile Template](resources/wireframes/mobile/RestaurantTemplate.png)

![Restaurant Desktop Template](resources/wireframes/mobile/Desktop-1.png)

# Task Management

[TRELLO LINK](https://trello.com/b/ltlnpgUl/t3a2-final-project)

To organise and manage task we will be using Trello. Trello will allow us to track the task which each team members are working on as well as track the task status. The way our task workflow would work is, a new task will first be created in the to do list at which point it will be labelled by the different labels explained here:

- Code - This specify a task required coding
- Structure - This task involved adding or structuring the code or project, often involving command lines.
- Design - This task involves anything to do with aesthetics of the project
- Project Management - A PM task often involves documentation or the management of the project
- Bug - This specifies a task that involved fixing a problem or error
- Testing - This task involves creating tests.

We will also assign a due date and any other relevant information to each card. When we start working on a task we will assign ourselves to the task and move it to the doing list. Once a task is completed if it is a code task we move it to the testing list to go through testing. After the task has been tested or if its a non-code task a task will be moved to review where the task will be reviewed by another team member before being moved to Done. Review is also where any code refactoring will be done. Tasks can be moved back and forth between the list depending on if more work needs to be done on them or if tests fails. The following screenshots are screenshots of the Trello board for each day since the project start.

### Tuesday 14-07-2020

![Day 1 Trello](./resources/trello/Screenshot_2020-07-14%20T3A2%20-%20Final%20Project%20Trello.jpg)

### Wednesday 15-07-2020

![Day 2 Trello](./resources/trello/Screenshot_2020-07-15%20T3A2%20-%20Final%20Project%20Trello.jpg)

### Thursday 16-07-2020

![Day 3 Trello](./resources/trello/Screenshot_2020-07-16%20T3A2%20-%20Final%20Project%20Trello.jpg)

### Friday 17-07-2020

![Day 4 Trello](./resources/trello/Screenshot_2020-07-17%20T3A2%20-%20Final%20Project%20Trello.jpg)

### Saturday 18-07-2020

![Day 5 Trello](./resources/trello/Screenshot_2020-07-18%20T3A2%20-%20Final%20Project%20Trello.jpg)

### Sunday 19-07-2020

![Day 6 Trello](./resources/trello/Screenshot_2020-07-19%20T3A2%20-%20Final%20Project%20Trello.jpg)

## Phase B - Development Journal

We used the same task management style and system for our trello outlined above with some new labels:

- Ruby on Rails Back End - This label is assigned to any task that involves the Ruby on Rails Back End code
- React Front End - This label is assigned to any task that involves the React Front End code
- View - This label is assigned to anything that involves the view of the project

Our development process was very similar to what was outlined above with us discussing briefly what we were currently working on and assigning ourselves to those tasks. Any task could still be moved back and forth between list depending if more work had to be done. Any task in review that did not involve both team members would be moved to done by other team member once reviewed. Similarly any pull request made during the project would only be merged by the other team member after inspection. Below is a trello screenshot of every day of development with a short statement stating what was done by each team member.

### Monday 20-07-2020

![Day 7 Trello](./resources/trello/Screenshot_2020-07-20%20T3A2%20-%20Final%20Project%20Trello.jpg)

Daniel Ask: Spent the day setting up the rails back end and practising TDD pair programming making unit tests and setting up our models.

Danny Lowater: Pair programmed, following ERDs and set up React front end

### Tuesday 21-07-2020

![Day 8 Trello](./resources/trello/Screenshot_2020-07-21%20T3A2%20-%20Final%20Project%20Trello.jpg)

Daniel Ask: Continued doing some pair programming and setting up the back end models. Also set up active storage and AWS for potential future use. Started on setting up back end authentication.

Danny Lowater: Continued pair programming, creating models and associated tests.

### Wednesday 22-07-2020

![Day 9 Trello](./resources/trello/Screenshot_2020-07-22%20T3A2%20-%20Final%20Project%20Trello.jpg)

Daniel Ask: Finished user authentication in the back end and set up basic authentication on the front end. Installed and initialised cypress end to end testing creating one cypress test. Finished unit testing and models creation.

Danny Lowater: Researched subdomains, front end frame css frameworks, continued model creation. Created seeds file

### Thursday 23-07-2020

![Day 10 Trello](./resources/trello/Screenshot_2020-07-23%20T3A2%20-%20Final%20Project%20Trello.jpg)

Daniel Ask: Finished validation testing for the back end. Started on controller testing and controller creation.

Danny Lowater: Begun work on the react app, created, menu and item styled components

### Friday 24-07-2020

![Day 11 Trello](./resources/trello/Screenshot_2020-07-24%20T3A2%20-%20Final%20Project%20Trello.jpg)

Daniel Ask: Finished controller request testing and controller creation. Initialised context. Moved to front end and started setting up fetch requests for the user dashboard

Danny Lowater: Continued work on Front end, researching and designing best path forward for custom styles

### Saturday 25-07-2020

![Day 12 Trello](./resources/trello/Screenshot_2020-07-25%20T3A2%20-%20Final%20Project%20Trello.jpg)

Daniel Ask: Added jbuilder to make better formatted json responses. Continued implementing the dashboard starting with adding adding contact info. Finished implementing context.

Danny Lowater: Tweaked seeds to suit actual front end behaviour, continued working on styled components and front end

### Sunday 26-07-2020

![Day 13 Trello](./resources/trello/Screenshot_2020-07-26%20T3A2%20-%20Final%20Project%20Trello.jpg)

Daniel Ask: Finished showing restaurants in the dashboards and contact info create read update and delete. Started implementing opening hours create read update delete from the front end. Changed the back end to get user information and display and edit in the dashboard. Experimented in creating dynamic editable fields.

Danny Lowater: refactored and styled menus and menu items

### Monday 27-07-2020

![Day 14 Trello](./resources/trello/Screenshot_2020-07-27%20T3A2%20-%20Final%20Project%20Trello.jpg)

Daniel Ask: Started adding new restaurant view and forms. Finished opening hours. Started menu read update and delete for dashboard and new restaurant. Added styling to the home page, log in and sign up pages.

Danny Lowater: Began work on restaurant styles, created protected routes

### Tuesday 28-07-2020

![Day 15 Trello](./resources/trello/Screenshot_2020-07-28%20T3A2%20-%20Final%20Project%20Trello.jpg)

Daniel Ask: Finished menus create update and delete and added Items create update and delete including sizes and ingredients for Items.

Danny Lowater: worked through props and auth logic for protected routes. continued styling

### Wednesday 29-07-2020

![Day 16 Trello](./resources/trello/Screenshot_2020-07-29%20T3A2%20-%20Final%20Project%20Trello.jpg)

Daniel Ask: Finished the new restaurant implementation. Deployed to heroku and netlify. Started adding custom colour styles for restaurants.

Danny Lowater: began code refactoring and styling dashboard

### Thursday 30-07-2020

![Day 17 Trello](./resources/trello/Screenshot_2020-07-30%20T3A2%20-%20Final%20Project%20Trello.jpg)

Daniel Ask: Finished off restaurant style manipulation and finished off manual testing. Fixed some bugs. Set up the read me adding links, task management, trello shots, libraries and the set up guide.

Danny Lowater: Finished off styling for restaurant, new restaurant and dashboard
