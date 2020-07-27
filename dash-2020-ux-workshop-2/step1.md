In this step, we will deploy a first environment and see it running.

# Build

The images were built already and pulled during the setup of this VM, so there is no need to build them as it takes quite some time.
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
![The api key is masked behind the purple band](assets/api-key-masked.png)
![And reveals itself on a mouse hover](assets/api-key-revealed.png)

The datadog agent will expect this API key to be available under the `DD_API_KEY` environment variable.
So we can simply export this variable to be available throughout our session.

```
export DD_API_KEY=<your api key>
```

# Deploy

Then, let's deploy!
We setup a fake CI/CD environment. So to deploy, you just need to push to a special repository.

```
git push deploy
```

Once everything is running, you should be able to visit the store by clicking on `storedog` in the tabs.

![The ecommerce app should be available](assets/storedog.png)

> For the curious among us, the `deploy` remote is just a bare local repo which allow us to use a `pre-push` hook which then launch a deployment script.

# See traffic in Datadog

The application is running and instrumented, we should now be able to see some traffic in datadog.
The 

We should be able to see some logs and traces.

Some logs are sent to datadog each time a user is browsing the ecommerce app.
[Logs: https://app.datadoghq.com/logs](https://app.datadoghq.com/logs)
![](assets/logs.png)

The different services are instrumented and available individually in APM.
[Service list: https://app.datadoghq.com/apm/services](https://app.datadoghq.com/apm/services)
![](assets/logs.png)

Datadog even builds a map of the different services to understand their interactions.
[Service map: https://app.datadoghq.com/apm/map](https://app.datadoghq.com/apm/map)
![](assets/logs.png)

# Setup RUM app

> TODO RUM app

# Install the Synthetics chrome extension

While we are at it, let's install everything we will need for later.

While recording a synthetics test, we catch all the interaction the user recording have with the page. To do so correctly, we need to install an extension to the browser.
This extension is only available for Chrome for now (Firefox users, let us know if you are interested to have it ported, to weight in on its prioritization).

https://chrome.google.com/webstore/detail/datadog-test-recorder/kkbncfpddhdmkfmalecgnphegacgejoa

> TODO steps to install the extension and verify it's working
Move this part to just before recording a test?.