# Trendyol API Case-2
##
Developed with Java and Karate framework.

## To run All Tests

```bash
mvn test
```
## to run Specific Test Class


```bash
mvn test -Dtest=TestRunner
```
## to run for Different Environments
```bash
mvn test -DargLine="-Dkarate.env=dev"
mvn test -DargLine="-Dkarate.env=qa"
mvn test -DargLine="-Dkarate.env=e2e"
```
## to Manual Run
bookApiTest.feature or TestRunner.java -> Right Click -> Run
## Environment and Global Variable Config

in <b>karate-config.js</b> you can set your variables(baseUrl,Token etc.) for different env.



## HTML Reports

You can see your test summary report in <b>target/surefire-reports</b> 

## Dependencies
```bash
    <dependencies>
        <dependency>
            <groupId>com.intuit.karate</groupId>
            <artifactId>karate-apache</artifactId>
            <version>${karate.version}</version>
            <scope>test</scope>
        </dependency>            
        <dependency>
            <groupId>com.intuit.karate</groupId>
            <artifactId>karate-junit5</artifactId>
            <version>${karate.version}</version>
            <scope>test</scope>
        </dependency>		
    </dependencies>
```
