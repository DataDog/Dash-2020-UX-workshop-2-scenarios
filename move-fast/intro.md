# Move Fast Without Breaking Things
_Dash 2020 - UX Monitoring Workshops #2_

With scale, any software system will eventually suffer from failures and regressions.
In this Workshop, we will see some strategies to ensure the quality of service despite this bitter reality.

1. To catch regressions, we will introduce end-to-end tests (Synthetics tests).
2. To contain regressions, we introduce canary deployments as part of a continuous delivery (CD) pipeline.  
3. And finally, to catch these regressions as early as possible, we will learn how to trigger these tests as part of our continuous integration (CI) pipeline.

---

The story goes like this.
We are developing an eCommerce website to sell various dog-related gear.
Our team is growing steadily, and despite our legacy infrastructure, we start to extract some microservices from our monolithic application.
With time, the various services and their teams grow.
And from time to time, deployments don't go as planned because some changes impact the other services in unexpected ways.
In this scenario, we will keep things simple, but I imagine this is something you should relate to your current position.

This scenario contains six steps:
1. Setup and launch the `storedog` application.
2. Create Synthetics tests to catch regressions.
3. Create advanced Synthetics tests.
4. Introduce a regression to see the tests failing, alert you, and then you revert the regression.
5. Setup a Canary deployment to reduce the regressions impact.
6. Setup Synthetics-CI to trigger the Synthetics tests during the CI pipeline.