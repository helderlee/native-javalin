package javalin.helloworld;

import org.junit.Assert;
import org.junit.Test;

public class AppTest {

    @Test
    public void helloWorldToken() {
        String token = "HELLOWORLD";
        Assert.assertEquals("HELLOWORLD", token);
    }
}
