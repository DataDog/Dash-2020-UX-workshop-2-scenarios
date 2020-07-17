# Canary deployments

So we have a production environment running.
And we would like to add some more features, or change the style or ...
But these changes might bring some regressions, bugs, failures.

At scale, even a tiny probability of failing can take huge proportion and be almost certain to happen.
If your application has 0.1% chance of crashing, and you have 1000 concurrent instances, then at all times, at least one is failing.
At scale, "this will never happen anyway" is next tuesday norning.

To contain the risk of a failure impacting users, we can't act on the probability, but we can act on the scale.

The canary deployment strategy is deploying changes at a reduced scale to contain the overall risk of failure to a subset of users.
We deploy the cahnge to only a subset of our infrastructure, or for a subset of users, and see that everything goes as planned.

The goal of a Canary deployment is two-folds:
- limit the blast radius of any uncertain change, and
- allow to very quickly revert it if things goes sideways.

Let's deploy a new environment for the canary!

TODO I am not sure how best to "simulate" or provide two concurrently running environment.

Fun fact (which is not so fun) the canary term comes from the canaries that miners were using in Coal mines to alert of a potential inodor but toxic gas leaks. The canary would die first from ashpyxie, alerting the miners of the gas leak.

## Dive more

Going further than Canary deployments, there are some more strategies we can adopt. They all adopt the same pattern as Canary development

- [Feature flags](https://featureflags.io/) are a way to activate and show some features of an application only for a subset of users.
It's a very lightweight and fast to implement in your own code base.
But it comes with some limitations though, as it's only available from within the application, it cannot protect from bugs in 
it cannot prevent a bug from crashing it, potentially for users who don't have the feature flags activaited.

- Blue-green deployment is like canary deployment, but switching the whole traffic from one version to the other. Canary deployment is obviously preferable as it is more risk averse.

- Rolling deployments is like canary deployment, but switching traffic progressively from one version to the next.
This practice is tangential to the idea of keeping several versions of the same software system available.