In this step, we will deploy the first environment and see it running.

# Build

The images were pre-built and pulled during the setup of this VM, so there is no need to build them as it takes quite some time.
Running `docker images` we should be able to see all the images we need.

Though, there is one image we will rebuild later with the following command: the discount service.

```
docker build -t discounts-service discounts-service
```

# API keys

In order to authenticate and send data, the datadog agent will need the API key from the datadog account receiving the data.

We can find this API key in the Integration menu, within the APIs entry.
![The Integration menu is the jiggsaw puzzle piece icon on the left, then we can find the APIs menu entry](assets/integrations.png)

Once in APIs tab of the Integration screen, the API Key is in the first revealing section.
The API key is masked at first, but will reveal when hovering the mouse.
It's possible to double-click to select and copy it to paste it later in the terminal.
![](assets/api-key-masked.png)
![](assets/api-key-revealed.png)

The datadog agent will expect this API key to be available under the `DD_API_KEY` environment variable.
So we can simply export this variable to be available throughout our session.

```
export DD_API_KEY=<your api key>
```

# Deploy

Now let's deploy!
We setup a fake CI/CD environment, so to deploy, you'll only need to run `git push deploy`{{execute}}.

```
git push deploy
```

Once everything is running, you should be able to visit the store by clicking on `storedog` in the tabs.


> In case you are curious, the `deploy` remote is just a bare local repository which allow us to use a `pre-push` hook to launch a deployment script.
> TODO screenshot of the store

# Retrieve API and APP keys

# See Traffic in Datadog

> TODO

# Install the Synthetics Chrome Extension

While we're at it, let's install everything we will need for later.

While recording a synthetics test, we catch all interactions with the page in the recorded tab. To do so correctly, we need to install an extension in the browser.
This extension is only available for Chrome for now.

>Firefox users: let us know if you are interested in having it ported, in order to help with its prioritization.

[Datadog Synthetics Chrome Extension](https://chrome.google.com/webstore/detail/datadog-test-recorder/kkbncfpddhdmkfmalecgnphegacgejoa)

> TODO steps to install the extension and verify it's working
Move this part to just before recording a test?.