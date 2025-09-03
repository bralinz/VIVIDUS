Meta:
    @group Training
    @requirementId MyTask-0007


Scenario: Navigate to the website homepage
Given I am on main application page
Then `${current-page-url}` is equal to `https://www.saucedemo.com/`

Scenario: Log In
When I fill ${swagGoodUserName} and ${swagPassword} in login form

Scenario: Add item to the shopping cart
When I select `<sortingValue>` in dropdown located by `className(product_sort_container)`
When I click on element located by `xpath(/html/body/div/div/div/div[2]/div/div/div/div[1]/div[2]/div[2]/button)`
When I go to relative URL `cart.html`
When I wait until element located by `cssSelector(.inventory_item_name)` appears
Then number of elements found by `cssSelector(.cart_item)` is equal to `<cartBadgeCount>`
When I navigate back
Examples:
| sortingValue         | cartBadgeCount |
| Price (low to high)  | 1              |
| Price (high to low)  | 2              |

Scenario: Populate checkout data

Scenario: Complete checkout process
