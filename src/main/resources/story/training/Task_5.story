Scenario: Navigate to the website homepage
When I navigate to the homepage

Scenario: Log in as Locked User
Given I am on main application page
When I login with username 'locked_user' and password 'secret_sauce'
Then `${current-page-url}` is equal to `https://www.saucedemo.com/inventory.html`
Then number of elements located by `class(inventory_item)` is equal to `6`
