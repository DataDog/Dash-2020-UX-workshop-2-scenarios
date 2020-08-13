Our synthetics test runs every hour, and we can schedule it, at most, for every five minutes, which means a breaking change would be live during these five minutes before being caught by a test.

We set up a canary to reduce the impact of any regression, but to push things further, we could catch regressions even before they are shipped.
To do so, we would like to trigger the synthetics test during our CI/CD pipeline.
The Synthetics CI feature does just that - it allows us to trigger a Synthetics test during our CI/CD pipeline.

Then we would like to have our CI/CD pipeline set up the canary, and before even redirecting users to it, have the Synthetics test make sure the functionality is behaving as expected.
Our load balancer is imaginary anyway, so that's just a matter of triggering the Synthetics tests once the canary is deployed.

# Synthetics-ci

## Setup

For the Synthetics CI to know which test to trigger, it reads all the `*.synthetics.json` file.
Here is an example of such a file containing two tests, `abc-def-ghi` and `jkl-mno-pqr`:

```json
{
  "tests": [
    {
      "id": "abc-def-ghi",
    }
    {
      "id": "jkl-mno-pqr",
    }
  ]
}
```

The id of your synthetics test has the form `abc-def-ghi`.
You can find it either as the last part in the URL while browsing the test, or in the summary page of the test, in the properties section.

Let's create this file and fill in this info in the editor:

`touch /root/ecommerce-observability/discounts.synthetics.json`{{ execute }}

Let's open this newly created file in `ecommerce-observability/discounts.synthetics.json`:

<pre class="hljs file json" data-filename="/root/ecommerce-observability/discounts.synthetics.json" data-target="replace">
{
  "tests": [
    {
      "id": "the id of your synthetics test",
      "config": {
        "startUrl": "your canary storedog URL",
        "variables": {
          "DISCOUNTS_URL": "your canary discounts service URL"
        }
      }
    }
  ]
}
</pre>

The `config.startUrl` tells the `datadog-ci` to override the start URL with the one given here.
This is especially useful as we can use the exact same synthetics test for our production and canary.
And the `config.variables` object contains local variables we would like to override during the test.
We use it to override the discounts service URL we used in the HTTP test step.
But the HTTP test URL is currently hardcoded into the step, right?
Let's change that then!

## Update test

In our current test, we send an HTTP test request to an URL that we hardcoded to be the one from the store.
With our new Canary setup, this hardcoded URL always points to the production `storedog` instead of the canary one.

Fortunately, HTTP tests accept variables in their URL.
Let's create a variable containing the expected URL for the canary discount service.

We create a new _Variables_ step again, select _Pattern_ in the dropdown.
We can name this new variable `DISCOUNTS_URL`, like the one in our `discounts.synthetics.json` config file.
And the value of this variable should be the URL of your productin discounts service, **not the canary**, so that this test remains functional for our production environment.
You can find this URL by clicking on `discounts` in the tabs, or directly from the URL with which we filled the HTTP step.
Alternatively, it is the same as storedog, **except we replace 3000 or 3001 with 5001 (the url-coded port), and it ends with `/discount`**
![](assets/synthetics-ci-1.png)

We have a variable containing the discount service URL, let's use it in the HTTP test step.
We click on the `Run HTTP test` step to modify it, and then we click on the `Edit HTTP Request` button to access the details of the HTTP test.
From there, we can change the URL and put our variable `DISCOUNTS_URL`.

![](assets/synthetics-ci-2.png)

We created a variable containing the exact URL that we previously used for our HTTP test step.
For our test, the change will have no effect.
However, it allows us to override this variable with the canary URL when we trigger the Synthetic CI test.

## Trigger a successful run

Once this config file is ready and valid, we can test our CI and see it succeed.
(If it doesn't succeed, it might be a transient bug, don't hesitate to trigger the CI again with a `git push deploy`{{ execute }})

`git push deploy`{{ execute }}

![](assets/synthetics-ci-ok.png)

If we were to use synthetics tests in a real CI, we could configure that to either warn us and prevent a manual deployment, or abort an automatic deployment.

## Break things!

Again, we apply the breaking patch, commit, and push to deploy our regression.
Be sure to be on the `canary` branch, or you will deploy to production!

`git apply 0001-fire-break-stuffs.patch`{{ execute }}

`git commit -a -m ":globe_with_meridians: improve naming with coupon instead of code"`{{ execute }}

`git push deploy`{{ execute }}

We should see the synthetics test fail during the CI, this time, and display an error message regarding the failure.

![](assets/synthetics-ci-fail.png)

# Private Location

To go even further, we might want to test our staging environment and test for regressions as safely as possible.
However, our staging environment might not be publicly available.

We can still run the Synthetics test on our own private infrastructure by using the Synthetics Private Location feature.
You can set up a private location within your infrastructure to run synthetics tests on private sites like your staging environment.
