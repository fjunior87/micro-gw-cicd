package com.xicojunior.mgw.interceptors;
import org.json.JSONObject;
import org.wso2.micro.gateway.interceptor.Caller;
import org.wso2.micro.gateway.interceptor.Entity;
import org.wso2.micro.gateway.interceptor.Interceptor;
import org.wso2.micro.gateway.interceptor.InterceptorException;
import org.wso2.micro.gateway.interceptor.Request;
import org.wso2.micro.gateway.interceptor.Response;
 
public class LoggerInterceptor implements Interceptor {
    public static String value="json";
    public boolean interceptRequest(Caller caller, Request request) {
        boolean hasApiKey = request.hasHeader("X-API-KEY");
        if (!hasApiKey) {
            Response response = new Response();
            JSONObject responsePayload = new JSONObject().put("error", "Missing required header");
            response.setResponseCode(400);
            response.setJsonPayload(responsePayload);
            caller.respond(response);
            // If we respond from the interceptor it is necessary to set the return value as false.
            // Otherwise the usual request flow will continue.
            return false;
        }
        return true;
    }
  
    public boolean interceptResponse(Caller caller, Response response) {
        // Send a custom json message if the response contains the key "error"
        try {
            JSONObject responseObject = response.getJsonPayload();
            if(responseObject.has("error")){
                JSONObject customErrorMessage = new JSONObject().put("error", "Invalid json payload returned");
                response.setJsonPayload(customErrorMessage);
            }
        } catch (InterceptorException e) {
            System.out.println("Error while getting the response payload");
        }
        return true;
    }
}