The synthetics tests run at most every 5 minutes, which means a breaking change would be live during these 5 minutes before being caught by a test.
To catch regressions even before they are live, we would like to trigger the synthetics test during the CI/CD pipeline.

The Synthetics CI feature does just that, it allows to trigger Synthetics test during our CI/CD pipeline.

Unfortunately, it's still in private beta, so you will need to ask the support to activate it, but I can show a brief demo of it.

# Private Location

To go even further, we might want to test our staging environment as well, to test for regression as safely as possible.
Howver, our staging environment might not be publicly available.

We can still run Synthetics test on our own private infrastructure with the Synthetics Private Location fetaure.
It allows to setup a private location within your infrastructure from which to run synthetics tests on private sites, e.g. your staging environment.
