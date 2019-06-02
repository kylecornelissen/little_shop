# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# Little Shop Extensions

These "extension" stories are for the final week solo project for Backend Module 2 students. It assumes your team has already completed 100% of the Little Shop project. In the case that your team has not finished the project, instructors will provide an alternate code base.

You will be completing 2 of the features described below: **Users Have Multiple Addresses** and **A second feature of your choice**.

Below, you'll see Completion Criteria and Implementation Guidelines. The Completion Criteria are the points that instructors will be assessing to ensure you've completed the work. The Implementation Guidelines will direct you in how to implement the work or offer advice or restrictions.

You get to choose how to implement the story, presentation, routing, etc, as long as your work satisfies the Completion Criteria.

---

## Users have multiple addresses

#### General Goal

Users will have more than one address associated with their profile. Each address will have a nickname like "home" or "work". Users will choose an address when checking out.

#### Completion Criteria

1. When a user registers they will still provide an address, this will become their first address entry in the database and nicknamed "home".
1. Users need full CRUD ability for addresses from their Profile page.
1. An address cannot be deleted or changed if it's been used in a "completed" order.
1. When a user checks out on the cart show page, they will have the ability to choose one of their addresses where they'd like the order shipped.
1. If a user deletes all of their addresses, they cannot check out and see an error telling them they need to add an address first. This should link to a page where they add an address.
1. If an order is still pending, the user can change to which address they want their items shipped.

#### Implementation Guidelines

1. Every order show page should display the chosen shipping address.
1. Statistics related to city/state should still work as before.

#### Mod 2 Learning Goals reflected:

- Database relationships
- ActiveRecord
- Software Testing

---

## Merchant To-Do List

#### General Goals

Merchant dashboards will display a to-do list of tasks that need their attention.

#### Completion Criteria

1. Merchants should be shown a list of items which are using a placeholder image and encouraged to find an appropriate image instead; each item is a link to that item's edit form.
1. Merchants should see a statistic about unfulfilled items and the revenue impact. eg, "You have 5 unfulfilled orders worth $752.86"
1. Next to each order on their dashboard, Merchants should see a warning if an item quantity on that order exceeds their current inventory count.
1. If several orders exist for an item, and their summed quantity exceeds the Merchant's inventory for that item, a warning message is shown.

#### Implementation Guidelines

1. Make sure you are testing for all happy path and sad path scenarios.

#### Mod 2 Learning Goals reflected:

- MVC and Rails development
- Database relationships and migrations
- ActiveRecord
- Software Testing
