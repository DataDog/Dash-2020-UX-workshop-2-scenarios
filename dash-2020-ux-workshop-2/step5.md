# CI/CD

The synthetics test run at most every 5 minutes.
Which mean a breaking change would be live during these 5 minutes before being caught by a test.
To catch regressions even before they are live, we can trigger the synthetics test during the CI/CD pipeline.

> TODO write a script to trigger the previously recorded synthetics test as CI, with an overriden start url pointing to a staging env, or a temporary env: https://docs.datadoghq.com/synthetics/ci/?tab=npm
Then setup this hook as part of the Fake CI/CD pipeline on the pre-push.
Finally, redeploy a regression to see it fail, and skipping the deploy.

# Dive more: private location
If you want to run synthetics tests during the CI/CD of your staging environment, which might not be publicly available, it's possible to setup a private location within your infrastructure from which to run synthetics tests on private sites, e.g. your staging environment.