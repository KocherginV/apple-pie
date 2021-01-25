<h1>Apple Pie</h1>
The main goal of this project is to demonstrate Page Object approach, commonly used in UI tests, applied to Swift/XCUITest project. 
Application used for testing is learning project from book "Develop in Swift. Fundamentals" issued by Apple. 
Project done in the form of game: one needs to guess words. If word is guessed, he gets points increased. Otherwise, there are 7 attempts before failure. After each attempt single apple gets picked from the tree.
The list of words is hardcoded and includes following: "buccaneer", "glorious", "swift", "incadescent", "program".

<h2>Running</h2>

As the porecondition one needs to have following:

  * XCode IDE (lowest version supported is 12.2)
  * XCode developer tools

In order to run from IDE you just need to press button run and then enter words using keyboard.
If you want to run tests, you need to go either to _ApplePieUITests.swift_ and click on Run button, or to go testing diamond in IDE, that lists all available tests and run them from there. 

<h2>Test folder structure</h2>
The Page object model implies separation between screens (they contain special elements and methods) and tests. In this project, folder ApplePieUITests contains two other folders:
**Screens** & **Tests**. **Screens** has files _BaseScreen.swift_, including all base functionality that could be inherited to different other screens and so used there and
_GameScreen.swift_ that includes all selectors and function that allows to enter word. 
There are two files in folder **Tests**: _BaseTest.swift_ (contains all base test functionality that could be inherited to other tests) and _ApplePieUITests.swift_ that contains all test.
