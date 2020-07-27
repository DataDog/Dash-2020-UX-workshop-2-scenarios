# Setup

In this step, we will deploy the first environment and see it running.

## Build

The images were pre-built during the setup of this lab, but you can do it again to see the complete flow.

```
docker build -t discounts-service discounts-service
```

## Deploy

Now let's deploy!
We setup a fake CI/CD environment, so to deploy, you'll only need to run `git push deploy`{{execute}}.

```
git push deploy
```

Once everything is running, you should be able to visit the store by clicking on `storedog` in the tabs.

In case you are curious, the `deploy` remote is just a bare local repository, and allows to use a `pre-push` hook to launch the `deploy` script.

## Retrieve API and APP keys

> TODO steps to retrieve the keys and export them as environment variable for later

## See Traffic in Datadog

> TODO

## Install the Synthetics Chrome Extension

While we're at it, let's install everything we will need for later.

While recording a synthetics test, we catch all interactions with the page in the recorded tab. To do so correctly, we need to install an extension in the browser.
This extension is only available for Chrome for now.

>Firefox users: let us know if you are interested in having it ported, in order to help with its prioritization.

[Datadog Synthetics Chrome Extension](https://chrome.google.com/webstore/detail/datadog-test-recorder/kkbncfpddhdmkfmalecgnphegacgejoa)

> TODO steps to install the extension and verify it's working
Move this part to just before recording a test?.