# Setup

In this step, we will deploy a first environment and see it running.

## Build

The images were built already during the setup of this VM, but you can do it again to have a complete flow.

```
./scripts/build.sh
```

## Deploy

Then, let's deploy!
We setup a fake CI/CD environment. So to deploy, you just need to `git push deploy`.

```
git push deploy
```

Once everything is running, you should be able to visit the store by clicking on `storedog` in the tabs.

In case you are curious, the `deploy` remote is just a bare local repo, and allows to use a `pre-push` hook to launch the `deploy` script.

## Retrieve API and APP keys

> TODO steps to retrieve the keys and export them as environment variable for later

## See traffic in Datadog

> TODO

## Install the Synthetics chrome extension

While we are at it, let's install everything we will need for later.

While recording a synthetics test, we catch all the interaction the user recording have with the page. To do so correctly, we need to install an extension to the browser.
This extension is only available for Chrome for now (Firefox users, let us know if you are interested to have it ported, to weight in on its prioritization).

https://chrome.google.com/webstore/detail/datadog-test-recorder/kkbncfpddhdmkfmalecgnphegacgejoa

> TODO steps to install the extension and verify it's working
Move this part to just before recording a test?.