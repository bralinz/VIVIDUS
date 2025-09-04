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
When I go to relative URL `/cart.html`
When I click on element located by `id(checkout)`
When I COMPARE_AGAINST baseline with name `checkout-step-one`
When I enter `#{generate(Name.firstName)}` in field located by `id(first-name)`
When I enter `#{generate(Name.lastName)}` in field located by `id(last-name)`
When I enter `#{generate(Address.postcode)}` in field located by `id(postal-code)`

Scenario: Complete checkout process
When I go to relative URL `/checkout-step-two.html`
When I COMPARE_AGAINST baseline with name `checkout-step-two`

!-- Extract price 1 and trim $ sign -->
When I save text of element located by `xpath(/html/body/div/div/div/div[2]/div/div[1]/div[3]/div[2]/div[2]/div)` to story variable `price_1_raw`
Given I initialize story variable `price_1` with value `#{replaceFirstByRegExp(\$(\d+), $1, ${price_1_raw})}`

!-- Extract price 2 and trim $ sign -->
When I save text of element located by `xpath(/html/body/div/div/div/div[2]/div/div[1]/div[4]/div[2]/div[2]/div)` to story variable `price_2_raw`
Given I initialize story variable `price_2` with value `#{replaceFirstByRegExp(\$(\d+), $1, ${price_2_raw})}`

!-- Extract total from checkout page and trim letters -->
When I save text of element located by `xpath(/html/body/div/div/div/div[2]/div/div[2]/div[6])` to story variable `summaryTotal_raw`
Given I initialize story variable `summaryTotal` with value `#{replaceFirstByRegExp(\$(\d+), $1, ${summaryTotal_raw})}`

!-- Calculate total and verify the total is correct -->
Given I initialize SCENARIO variable `totalCalculated` with value `#{eval(price_1 + price_2)}`
Then `${totalCalculated}` is equal to `${summaryTotal}`

When I click on element located by `id(finish)`
