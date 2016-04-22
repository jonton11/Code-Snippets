# Code Snippet Application

1. Build a tool in Rails that helps you store code snippets.

2. You must have test coverage (doesn't have to be a 100%) for creating and updating the snippet kinds and the snippets.

3. The box must accept markdown. Make sure to have the code highlighted properly depending on the language.

Note: avoid using `type` as a column name in models. More on that will come later. This is why the wireframe uses `Kind`, you can pick another word if you'd like just don't use `type`.  

[Stretch] Make snippets owned by users so a user can create their own snippets. Also add `private` checkbox to the snippet code. If the code snippet is private only the user can see it. If the snippet is not private it means it's public and it will show on the home page listing where it will list all the snippets for all the users.

## Gameplan

- Use gems `redcarpet` and `coderay`
  - syntax highlighting for several languages


- Snippet model contains title, work:text
  - title, work:text
  - index page lists kinds with the associated counts
  - Show page lists a single entry with syntax highlighting
  - New page contains the form in which to submit a new code snippet


- Kind will be a separate model with a One-To-Many association with Snippet
  - One Kind can have Many Snippets
  - Kind model will only contain one field: title
