Meta:
    @group Training
    @requirementId MyTask-0006

Lifecycle:
Examples:
|userName                 | password      |
|standard_user            | secret_sauce  |
|performance_glitch_user  | secret_sauce  |

Scenario: Navigate to the website homepage
Given I am on main application page
When I wait until element located by `caseSensitiveText(Swag Labs)` appears
Then `${current-page-url}` is equal to `https://www.saucedemo.com/`

Scenario: Log In
When I enter `<userName>` in field located by `id(user-name)`
When I enter `<password>` in field located by `id(password)`
When I click on element located by `id(login-button)`
Then `${current-page-url}` is equal to `https://www.saucedemo.com/inventory.html`

Scenario: Add item to the shopping cart
Given I am on page with URL `https://www.saucedemo.com/inventory.html`
Then text `<itemName>` exists
When I click on element located by `id(<itemPageID>)`
When I click on element located by `id(<addToCartButtonId>)`
Examples:
    | itemName                | itemPageID | addToCartButtonId   |
    | Sauce Labs Backpack     | item_4_title_link          | add-to-cart         |
    | Sauce Labs Bike Light   | item_0_title_link          | add-to-cart         |
    | Sauce Labs Bolt T-Shirt | item_1_title_link          | add-to-cart         |

Scenario: Validate the num of items in the shopping cart
Given I am on page with URL `https://www.saucedemo.com/inventory.html`
When I click on element located by `id(shopping_cart_container)`
Then number of elements found by `cssSelector(.cart_item)` is equal to `3`

Scenario: Log Out
When I click on element located by `id(react-burger-menu-btn)`
And I click on element located by `id(reset_sidebar_link)`
And I click on element located by `id(logout_sidebar_link)`
Then `${current-page-url}` is equal to `https://www.saucedemo.com/`
