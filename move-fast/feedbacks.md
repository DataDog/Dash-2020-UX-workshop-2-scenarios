Move fast without breaking things - Dry Run - July 30 @ 10am EST

# Text changes

Sum up of the discussion afterward:
APM - Synthetics integration to see the APM traces from the Synthetics test
Have attendees setup Synthetics CI if GA (or public beta)
Otherwise, just demo it
Maybe have attendees setup a Private Location in their katacoda machine (might be challenging, though) if GA or public beta
Otherwise, just demo it
If we workshop or demo Synthetics CI, move the Canary deployment part to after the regression test “If we had a canary deployment, then this regression wouldn’t be live for all the users”

We should do our best to at least demo CI since that’s at the heart of the workshop topic. If we run out of time, we could probably create all steps in one go.

## Change presentation to be only first and last part of the presentation, and avoid switching

You may not need the google slides presentation. All the info there was also in the lab and it may reduce context switching for attendees if they stick in one place

## Improve content

- Spend a bit more time on the third slide « failures are unavoidable » for users to really understand what is going to be covered in the session and why.
- Better transitions (to introduce canary, but that could apply elsewhere as well)

- When starting the browser test creation, state from the start « this browser test is going to allow us to proactively monitor that the discounts codes are always appearing on the website ». To reset the context + clarify from the beginning what we’re going to do.
- Let’s clearly state at the beginning of UX monitoring: we will focus on what the user directly experience using Synthetics, explain what Synthetics is, and that in this case we’re looking at a browser test, which is the part of the product that allows users to monitor key journeys.
- Let’s regularly reset the context to remind everybody where we’re standing: typically at the beginning of the post break session « we deployed an application and created a test to monitor a key features of the app is working as expected, now we’re going to deploy a breaking change »


# During the presentation

- Increase size of text, and reduce size of terminal, to better show content
- Leave more time for people to create tests
- Explain more what controls are for in test creation
- Explain what are the common use cases of each step during creation
- Use simple terms (avoid synthetics worker/runner)
- Regularly restate the context to anchor audience in the flow
- Phrase positively 


# TODO

- Test APM integration in http request in browser test
- Create a new storedog-front image with the port modified for canary
- Write some script to integrate the CI in the pipeline
- Define clearly what is a failure and what is a regression, and maybe use only one of the two.
- change the katacoca layout to allow for an editor to edit the discount.synthetics.json file