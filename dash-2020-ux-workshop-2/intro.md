# Move Fast Without Breaking Things
_Dash 2020 - UX Monitoring Workshops #2_

With scale, any software system will eventually suffer from failures and regressions.
In this Workshop, we will see some strategies to ensure the quality of service despite this bitter reality.

1. For these regressions to be contained, we will introduce both canary and blue-green deployments as part of a continous delivery (CD) pipeline.  
2. To catch regressions, we will introduce end-to-end tests (Synthetics tests) and monitoring (RUM).  
3. And finally, to catch these regressions as early as possible, we will learn how to trigger these tests as part of our continuous integration (CI) pipeline.

---

The story goes like this.
We are developing a ecommerce website to sell various dog-related gears.
Our team is growing steadily, and despite our legacy infrastructure, we start to extract some microservices out of our monolithic application.
With time, the various applications and their teams grows.
And from times to times, deployments don't go as planned because some changes impact the other services in some unexpected ways.
In this scenario, we will keep things simple, but I imagine this is something you should be able to relate to from your current position.

This scenario contains 5 steps:
1. Setup the storedog application and your datadog account to start monitoring it.
2. See the Canary deployment strategy to reduce regressions impact.
3. Setup some Synthetics tests to catch any regression that could happen.
4. Introduce a regression, see the tests failling and alerting us and revert.
5. Setup the Synthetics tests to trigger for every deployment.
