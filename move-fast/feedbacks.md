Move fast without breaking things - Dry Run - July 30 @ 10am EST

# Text changes

Sum up of the discussion afterward:
APM - Synthetics integration to see the APM traces from the Synthetics test


## Improve content

- Spend a bit more time on the third slide « failures are unavoidable » for users to really understand what is going to be covered in the session and why.
- Better transitions (to introduce canary, but that could apply elsewhere as well)


# During the presentation

- Increase size of text, and reduce size of terminal, to better show content
- Leave more time for people to create tests
- Explain more what controls are for in test creation
- Explain what are the common use cases of each step during creation
- Use simple terms (avoid synthetics worker/runner)
- Regularly restate the context to anchor audience in the flow
- Phrase positively 

- When starting the browser test creation, state from the start « this browser test is going to allow us to proactively monitor that the discounts codes are always appearing on the website ». To reset the context + clarify from the beginning what we’re going to do.
- Let’s clearly state at the beginning of UX monitoring: we will focus on what the user directly experience using Synthetics, explain what Synthetics is, and that in this case we’re looking at a browser test, which is the part of the product that allows users to monitor key journeys.
- If you decide to talk about the MML (which, I think, is definitely a good idea), I would add a bit more context around it to explain how end-to-end tests usually locate elements, then introduce why it does not work (flaky tests that need a lot of maintenance), and finally explain that that’s why we made it differently (and explain how we do it). 
- When creating the JS step, you can go a bit more in details to explain that you first select the element, and that you will then use it in your js snippet (you can even explain what the three lines of code are doing, it should be quick and clarify both the feature and the workshop step a lot). If you talked about the MML, you can even explain that the targeted element will leverage the same algorithm, and that the step will be « self maintained » 
- Explain a bit more in detail why we’re using the same start url as the one we used for canary deployment. -> We use the canary environment with a load balancer in front. In the first use, we let the load balancer redirect a small portion of users to the canary. In the second use, with the CI< we imagine the load balancer only let the Synthetics CI runner go to the canary, not users. So we reuse the same to keep things simple in the workshop, but in a real env, we might have two separate env. Or rather, a lot of instances, with some of them being prod, some being canary, and some being CI canary.
- When you introduce the CI, let’s not do it by saying that it’s useful because our tests can run every 5 minutes which leaves room for uncertainties. Let’s insist more on how we saw:
1. that synthetic tests allow you to be alerted in case there’s an issue in production;
2. that canary deployment allows you to act on the scale of users impacted;
 3. that integrating tests in your CI/CD takes testing even further as it allows you to detect issues even before you deploy your changes to production.
- In the CI section, I think it would be nice to add a few more details on how we make the link between Datadog and the repo, ie. Have a look at the global configuration file for instance, explain where the list of tests to run is located inside of the repo, etc.
- Let’s regularly reset the context to remind everybody where we’re standing: typically at the beginning of the post break session « we deployed an application and created a test to monitor a key features of the app is working as expected, now we’re going to deploy a breaking change »

# TODO

- Test APM integration in http request in browser test
- Define clearly what is a failure and what is a regression, and maybe use only one of the two.