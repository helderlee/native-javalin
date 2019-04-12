/*
 * This Java source file was generated by the Gradle 'init' task.
 */
package javalin.helloworld;

import io.javalin.Javalin;
import javalin.helloworld.bean.Response;

public class App {

    public static void main(String[] args) {
        Response response = new Response();
        response.setMessage("Hello World, Lee!");
        Javalin app = Javalin.create().start(7000);
        app.get("/", ctx -> ctx.json(response));
    }

}
