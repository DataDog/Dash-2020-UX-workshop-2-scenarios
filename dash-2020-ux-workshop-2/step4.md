At some point, the team responsible for the discounts service refactored.

They tested heavily from their side to make sure everything was consistent and working. However, a slight change introduced a bug in the UI, preventing the discount from being displayed.

For the purpose of this workshop, we will keep things extremely simple, and introduce a change only to break the discount service.
The discount team decided to rename `code` into `coupon`.

The change is ready as a patch we can immediatly apply without editing files.
`git apply 0001-fire-break-stuffs.patch`{{ execute }}

We can see the changes introduced.
`git diff`{{ execute }}

And then commit and deploy these changes.
`git commit -m ":globe_with_meridians: improve naming with coupon instead of code"`{{ execute }}
`git push deploy`{{ execute }}

Once the change is deployed, we can see it is live, and indeed, diverging from what is expected.
The test should soon fail, and alert us.
We can trigger it manually to get the result faster.

# Revert!

The site is publicly broken - there's no time to waste, let's revert the change we just made and redeploy!
`git revert HEAD --no-edit`{{ execute }}
`git push deploy` {{ execute }}

# Summary

What did we learn here?
If we had used the canary deployment strategy, we could have limited the impact of this breaking change on a subset of users.

Thanks to the Synthetics test, we managed to detect this breaking change and revert in a timely fashion. Without it, it might have take enough frustration for a user to send us a mail about this breaking change.
