package ApiTest;

import com.intuit.karate.junit5.Karate;

class TestRunner {
    
    // this will run all bookApiTest.feature file.
    @Karate.Test
    Karate testBookApi(){
        return new Karate().feature("book/bookApiTest").relativeTo(getClass());
    }
    
}
