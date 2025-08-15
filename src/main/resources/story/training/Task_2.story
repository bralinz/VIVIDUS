GivenStories: story/demo/Homepage_Demo.story

Scenario: Log in as a Good User
When I log in with username `standard_user` and password `secret_sauce`
Then `${current-page-url}` is equal to `https://www.saucedemo.com/`
Then number of elements located by 'inventory-item' is 6
When I take screenshot