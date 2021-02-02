![GitHub release (latest by date)](https://img.shields.io/github/v/release/hmrc/$serviceNameHyphen$) ![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/hmrc/$serviceNameHyphen$) ![GitHub last commit](https://img.shields.io/github/last-commit/hmrc/$serviceNameHyphen$)

# $serviceNameHyphen$

$serviceTitle$

## Running the tests

Ensure you have service-manager python environment setup:

	source ../servicemanager/bin/activate
    sbt test it:test

## Running the tests with coverage

    sbt clean coverageOn test it:test coverageReport


If your build fails due to poor testing coverage, *DO NOT* lower the test coverage, instead inspect the generated report located here on your local repo: `/target/scala-2.12/scoverage-report/index.html`

If your build fails due to wartremover errors, please report it to your team if you're unable to resolve the issue yourself in a timely manner.


## Running the app locally

	source ../servicemanager/bin/activate
    sm --start DC_ALL
    sm --stop $serviceNameSnake$ 
    sbt run "$serviceTargetPort$ -Dplay.http.router=testOnlyDoNotUseInAppConf.Routes"

It should then be listening on port $serviceTargetPort$

    browse http://localhost:$serviceTargetPort$/serviceUrlPrefix

Swagger endpoint should be located here:

	http://localhost:$serviceTargetPort$/serviceUrlPrefix/api/schema.json

### License


This code is open source software licensed under the [Apache 2.0 License]("http://www.apache.org/licenses/LICENSE-2.0.html")