// This build is for this giter8 template.
// To test the template run the script `./test.sh`
// See http://www.foundweekends.org/giter8/testing.html#Using+the+Giter8Plugin for more details.
lazy val root = (project in file(".")).settings(
  name := "dc-template-frontend.g8",
  description := "A Giter8 template for creating HMRC Digital Contact Scala Play 2.7 Frontend Microservices",
  resolvers += Resolver.url("typesafe", url("http://repo.typesafe.com/typesafe/ivy-releases/"))(
    Resolver.ivyStylePatterns)
)
