# Unit Test
1. You have to test the WordProvider class
2. Write a unit test to confirm a new word in generated when the provider is first created
3. Write a unit test to verify a word is added to the favorite list
4. Write a unit test to verify a word is removed from the favorite list
# Widget Test
1. You have to test WordPairHome widget
2. Create a group to hold several testWidgets functions
3. Write a widget test to verify that the START button shows up when the app is launched first
4. Write a widget test to verify that START button disappears after tapping it and back button <- is disabled
5. Write a widget test to verify that Snackbar Text shows up when pressing the favorite button next to next button ->
# Widget Test
1. You have to test FavoriteWordListPage widget
2. Write a widget test to verify that a Text widget shows up when favWordList is empty
3. Write a widget test to verify that a ListView shows up when favWordList is not empty
# Integration Test
1. Add necessary dependency for integration test
2. Write group tests for the following cases:
3. Find exactly one widget with the text 'START'
4. Tap the START button
5. Find exactly one widget with the icon Icons.arrow_forward
6. Run a for loop for 3 times and in each iteration - A. tap the forward button, B. tap the favorite button next to the forward / next button, C. find exactly one widget that shows a snacbar text
7. Tap the Favorites button at the AppBar (which takes you to the FavoriteWordListPage)
8. Run a for loop for 3 times and in each iteration - A. find and tap the delete button, B. find exaclty one widget with the text 'Removed from favorites'
