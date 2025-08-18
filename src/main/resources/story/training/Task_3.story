Scenario: Navigate to the website homepage
When I navigate to the homepage

Scenario: Log in as a Good User
Given I am on main application page
When I login with username 'standard_user' and password 'secret_sauce'
Then `${current-page-url}` is equal to `https://www.saucedemo.com/inventory.html`
When I take screenshot
