Our synthetics test runs every hours, and at most every 5 minutes, which means a breaking change would be live during these 5 minutes before being caught by a test.

We setup a canary to reduce the impact of any regression, but to push things further, we could catch regressions even before they are live.
To do so, we would like to trigger the synthetics test during our CI/CD pipeline.
The Synthetics CI feature does just that, it allows to trigger Synthetics test during our CI/CD pipeline.

Then we would like to have our CI/CD pipeline setup the canary, and before even redirecting users to it, have the synthetics test make sure it's behaving as expected.
Our load balancer is imaginary anyway, so that's just a matter of triggering the Synthetics tests once the canary is deployed.

For the Synthetics CI to know which test to trigger, it reads all the `*.synthetics.json` file.
Here is an example of such a file:

<pre class="hljs file json" data-filename="/root/ecommerce-observability/discount.synthetics.json" data-target="replace">
{
  "tests": [
    {
      "id": "the id of your synthetics test",
      "startUrl": "your canary storedog url"
    }
  ]
}
</pre>

The id of your synthetics test has the form `abc-def-ghi`.
You can find it either as the last part in the url while browsing the test, or in the summary page of the test, in the properties section.

Let's create this file and fill in these info in the editor.

Once this config file is ready and valid, we can redeploy our regression to see synthetics test fail.
If we were to use synthetics tests in a real CI, we could configure that to either warn us and prevent a manual deployment, or abort an automatic deployment.

Again, we apply the breaking patch, commit and push to deploy.

`git apply 0001-fire-break-stuffs.patch`{{ execute }}
`git commit -a -m ":globe_with_meridians: improve naming with coupon instead of code"`{{ execute }}
`git push deploy`{{ execute }}


# Private Location

To go even further, we might want to test our staging environment as well, to test for regression as safely as possible.
However, our staging environment might not be publicly available.

We can still run Synthetics test on our own private infrastructure with the Synthetics Private Location fetaure.
It allows to setup a private location within your infrastructure from which to run synthetics tests on private sites, e.g. your staging environment.
