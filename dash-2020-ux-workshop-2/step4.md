At some point, the team responsible for the discounts service refactored.

They tested heavily from their side to make sure everything was consistent and working. However, a slight change introduced a bug in the UI, preventing the discount from being displayed.

TODO let the attendee apply the patch to break things, build and redeploy the discount service image.

Once the change is deployed, we can see it is live, and indeed, diverging from what is expected.
The test should soon fail, and alert us.
We can trigger it manually to get the result faster.

# Revert!

The site is publicly broken - there's no time to waste, let's revert the change we just made!

TODO deploy the last known good image built.

# Summary

What did we learn here?
If we had used the canary deployment strategy, we could have limited the impact of this breaking change on user.
Thanks to the Synthetics test, we managed to detect this breaking change and revert in a timely fashion. Without it, it might have take enough frustration for a user to send us a mail about this breaking change.