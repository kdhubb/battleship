![its_working_star_wars](https://user-images.githubusercontent.com/118634754/231820290-a1aa78b5-840a-49aa-9424-4929a96a8323.gif)

# Talking Points

- Formatting on board
  - Added spaces so that board was more clearly readable from side of terminal
  - Limitations without frontend?
    - Took liberties on formatting which impacted test readability and maybe convention in code? but made for better readibility during gameplay
- Line breaks and spacing for readability
- Scaling - methods in computer randomization will more easily scale to larger boards
  - Expand on all methods where we randomize
- Gets tests
- Buggy computer fire method (submarine placement bug).
- Turn class, can methods go in other classes?

# Iteration 3

*Iteration 3 did not provide an interaction pattern. How did you approach designing this iteration? If you did not get to Iteration 3, reflect on how you think you would’ve approached the design and problem solving process.*

Iteration 3 indeed proved to be the most challenging for us. We approached designing this iteration in a couple of ways:

- The first was to draw from the work we had already completed in war and peace and to try to look at those interaction patterns and the way that game functioned to get a better idea for how a `Game`, a `Turn`, and a `Player` and `Computer` would all work together. That being said, one of the things that we quickly noticed was that the turn types in battleship seemed to be much more simple than in War.
- After having reviewed the work we did on War, we began [jamboarding](https://jamboard.google.com/d/1n8iq7p1YUkV99liw0reJ1_Y7MeE0XHuFWprTd6CJ3Go/edit?usp=sharing) to get a better idea for how our classes might interact with one another and what functionality was going to be required of each of our classes.

  <img width="1377" alt="Screenshot 2023-04-13 at 9 29 00 AM" src="https://user-images.githubusercontent.com/118634754/231810208-b9f54196-dc3d-47cd-8f7e-7d6c6160da32.png">

- We ultimately settled on creating four additional different classes:
  1. `Turn`
  1. `Computer`
  1. `Player`
  1. `Game`
- After deciding on those classes, we started with the things we knew that we needed, which were the player and the computer, as we were still a little unsure exactly what belonged in the `Turn` versus what belonged in the `Game`. Getting some encouragement from Erin that we were on the right path helped nudge us along and continue making progress.
- Additionally, we reached out to our support network for help: rocks, mentors, `#code-help`, google - we tried many numerous different ways of problem solving, even though at times some of the questions we posed seemed to be too complicated (eg, asking a rock for help but him not quite knowing how to sift through what we had created with different classes versus the way he had designed iteration 3).

# More time

<img width="745" alt="Screenshot 2023-04-13 at 9 36 38 AM" src="https://user-images.githubusercontent.com/118634754/231811437-bcfaa5ec-597c-4950-948f-1a9af05fe147.png">

*If you had one more day to work on this project, what would you work on?*

Given one more, there are a few things that we'd go back to:

## `gets` and `puts` Tests

- `gets` proved to be quite challenging when it came to using `rspec`, especially as we were beginning to `puts` things to the terminal. With `puts` giving out a `nil` value and `gets` requiring inputs, we felt as though some of our test in our `game_spec` especially failed short of really proving that we had tested through things, though we had - just that we had done so in the only we we really understood how - to run the `runner` each time and see how the game was working.
- This method of testing proved to be time consuming and tedious, and if we had more time we would like to continue researching how to tests when requiring user input and make our tests for the `Turn` and `Game` more in line with TDD about what we were seeing when using `puts`

## Ghosts

- Somewhere inside of our `Computer` we have noticed a small bug that pops up about once every hundred times, maybe less... We can run our `rspec` and pass all tests nearly every time, but every once in a while the computer seems to have difficulty randomly placing its submarine. While we have pinpointed it down to that, we don't know exactly why it's happening and given more time, would like to try to drill down into exactly what is going on.

# Teamwork

*Describe the pairing techniques you used while working on this project.*

![Principles-of-Effective-Teamwork-in-Childcare-You-Must-Know](https://user-images.githubusercontent.com/118634754/231815317-0aa66295-27a1-4e17-95cb-6aa73135532c.jpg)

The pairing techniques we used the most were driver/navigator. We made time for one another to accomplish everything we needed by working simultaneously together on the project. At times, we made minor adjustments to the codebase asynchronously, but by and large everything was done together, which proved to be incredibly helpful for working through the complexities of how to organize iteration 3 especially.

# Feedback

*Describe how feedback was shared over the course of this project.*

Feedback was something that we shared nearly everyday with one another. We celebrated each others successes at the end of each coding sessions and did a great job helping each other to work through frustration. As we got more comfortable with the way one another worked, it was easy to give feedback in the moment (eg, telling the driver to delete a line of code, going to the whiteboard to discuss, critiquing whether a certain though process would work for how our classes would interact, etc.).

## Daily Standups

In addition to in the moment feedback, we also made it a point to do daily (or nearly every day) standups to check in with one another about how we were feeling, what we were going to try ot work on that day and also carved out some time at the beginning of each to try to get to know one another.
