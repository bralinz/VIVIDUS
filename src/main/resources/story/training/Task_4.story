Scenario: Navigate to the website homepage
When I navigate to the homepage
When I COMPARE_AGAINST baseline with name `loginPageNew2` ignoring:
|ACCEPTABLE_DIFF_PERCENTAGE |
|5                          |

Scenario: Log in as a User
Given I am on main application page
When I login with username 'problem_user' and password 'secret_sauce'
Then `${current-page-url}` is equal to `https://www.saucedemo.com/inventory.html`
When I COMPARE_AGAINST baseline with name `homepageNew2` ignoring:
|ELEMENT                            |ACCEPTABLE_DIFF_PERCENTAGE |
|By.cssSelector(.inventory_item_img)|9                          |
When I take screenshot
