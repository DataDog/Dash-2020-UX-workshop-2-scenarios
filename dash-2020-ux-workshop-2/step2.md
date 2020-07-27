So we have a production environment running, and we would like to add some more features, change the style or ...
But these changes might bring some regressions, bugs, failures!

At scale, even the smallest chance of failing can take on huge proportion and be almost certain to happen.
If your application has 0.1% chance of crashing, and you have 1000 concurrent instances, then most of the time at least one is failing.
At scale, "this will never happen anyway" is next tuesday norning.

To contain the risk of a failure impacting users, we can't act on the probability, but we can act on the scale.

The canary deployment strategy is deploying changes at a reduced scale to contain the overall risk of failure to a subset of users.
We deploy the cahnge to only a subset of our infrastructure, or for a subset of users, and see that everything goes as planned.

The goal of a canary deployment is two-folds:
- limit the blast radius of any uncertain change, and
- allow to very quickly revert it if things goes sideways.

Let's deploy a new environment for the canary!

> TODO I am not sure how best to "simulate" or provide two concurrently running environment.
I was thinking of modifying the docker-compose to have several replicas all pointing to the same database, and reloading only one of the replica with the new image.
We will have the attendee imagine a load balancer, pointing to these 2 replicas, one of which is the canary.
As we will operate on the discount services, it would mean spinning a canary front-end as well, though.

> TODO It might make more sense to move this step to after we have synthetics test running, as a part of deploying a change, maybe? But it might get confusin in the story: having the canary deployment in the middle of the end-to-end testing.

---

Fun fact (which is not so fun) the canary term comes from the canaries that miners were using in Coal mines to alert of a potential inodor but toxic gas leaks. The canary would die first from ashpyxie, alerting the miners of the gas leak.

# Digging In

Going further than canary deployments, there are some more strategies we can adopt - they all adopt the same pattern as canary development.

- [Feature flags](https://featureflags.io) are a way to activate and show some features of an application only for a subset of users.
They are lightweight and fast to implement in your own code base.
This comes with some limitations, however, as they are only available from within the application, it cannot protect from bugs in (TODO: missing a word, or not needed?)
it cannot prevent a bug from crashing it, potentially for users who don't have the feature flags activaited.

- Blue-green deployments are like canary deployments, but switching the whole traffic from one version to the other. A canary deployment is usually preferable as are less risky.

- Rolling deployments are like canary deployments, but are performed by switching traffic progressively from one version to the next.
This practice is tangential to the idea of keeping several versions of the same software system available.