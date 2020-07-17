# Catching regressions

With the increasing scale of software systems, testing after each change to catch regressions will become longer and more tedious.
At some point, it won't realistically be done manually.
Let's see how to automate these tests with end-to-end testing and monitoring.

## Synthetics test

We have a running application available publicly. We don't need anything more to start testing.

The marketing team published a report discolsing the discounts insert is driving 83% of the revenue of the site. It's definitely something we don't want to miss. Let's record a test to make sure it doesn't break.

TODO steps to record the synthetics test.
We might explain:
- element is present
- element content is / contains
- getting the discount as a variable and testing the discount is valid with an HTTP test.

The test will run at a fixed interval to make sure the site behave as expected.
It is behaving as expected for now, and the test should pass.

## Break things!

At some point, one team responsible for the discounts made some refactoring, and they tested heavily from their side to make sure everything was consistent and working. However, a slight change introduced a breaking change in the UI preventing from displaying the discount.

TODO let the attendee apply the patch to break things, build and redeploy the discount service image.

Once the change is deployed, we can see it is live, and indeed, diverging from what is expected.
The test should soon fail, and alert us.
We can trigger it manually to get the result faster.

## Revert!

The site is publicly broken, no time to waste, let's revert the change we just made!

TODO deploy the last known good image built.