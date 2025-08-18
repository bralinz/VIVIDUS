GivenStories: story/demo/Homepage_Demo.story

Scenario: Log in as a Good Users
When I click on element located by `id(user-name)`
When I enter `standard_user` in field located by `id(user-name)`
When I click on element located by `id(password)`
When I enter `secret_sauce` in field located by `id(password)`
When I click on element located by `id(login-button)`
Then `${current-page-url}` is equal to `https://www.saucedemo.com/inventory.html`
Then number of elements found by `cssSelector(.inventory_item)` is equal to `6`
When I take screenshot
