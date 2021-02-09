A [Giter8](http://www.foundweekends.org/giter8/) template for creating a HMRC Digital Scala Play 2.7 Frontend Microservice
==

How to create a new project based on the template?
--

* Before generating the project, make sure to use the blank repo creation template when using the jenkins job to create a new repository
* Install g8 commandline tool (http://www.foundweekends.org/giter8/setup.html)
* Go to the directory where you want to create the template
* Agree on a service name
* Run the following command replacing the relevant elements to match your service name

	`g8 hmrc/dc-template-frontend --serviceName="Some Service Frontend" --serviceTargetPort="9999" -o some-service-frontend`

	*NOTE* If for some reason you're having difficulty running giter8 against github (key errors and the likes), try the following after cloning the repo locally:

	`g8 file://../dc-template-frontend.g8 --serviceName="Some Service Frontend" --serviceTargetPort="9999" -o target/sandbox/some-service-frontend`

	After which your project will be generated here: `target/sandbox/some-service-frontend`
    
and then
    
	cd some-service-frontend
	git init
	git add .
	git commit -m start
  
* Test generated project using command 

    `sbt test it:test`
    

How to test the template and generate an example project?
--

* Run `./test.sh` 

An example project will be then created and tested in `target/sandbox/some-service-frontend`

How to modify the template?
--

 * review template sources in `/src/main/g8`
 * modify files as you need, but be careful about placeholders, paths and so on
 * run `./test.sh` in template root to validate your changes
 
or (safer) ...

* run `./test.sh` first
* open `target/sandbox/some-service-frontend` in your preferred IDE, 
* modify the generated example project as you wish, 
* build and test it as usual, you can run `sbt test it:test`,
* when you are done switch back to the template root
* run `./update-g8.sh` in order to port your changes back to the template.
* run `./test.sh` again to validate your changes

What is in the template?
--

Assuming the command above 
the template will supply the following values for the placeholders:

	$serviceNameCamel$ -> SomeServiceFrontend
	$serviceNamecamel$ -> someServiceFrontend
	$serviceNameNoSpaceLowercase$ -> someservicefrontend
	$serviceNameNoSpaceUppercase$ -> SOMESERVICEFRONTEND
	$serviceNamesnake$ -> some_service_frontend
	$serviceNameSnake$ -> SOME_SERVICE_FRONTEND
	$serviceNameHyphen$ -> some-service-frontend
	$serviceNameLowercase$ -> some service frontend
	$serviceNameUppercase$ -> SOME SERVICE FRONTEND
	$serviceTargetPort$ -> 9999

and produce the folders and files as shown below:
