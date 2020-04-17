import ballerina/http;
import ballerina/io;
 
public function validateRequest (http:Caller outboundEp, http:Request req) {
    // Backend requires X-API-KEY header. No point in passing the request to the backend 
    // if the header is not present in the request.
    boolean hasApiKey = req.hasHeader("X-API-KEY");
    if (!hasApiKey) {
        http:Response res = new;
        res.statusCode = 400;
        json message = {"error": "Missing required header"};
        res.setPayload(message);
        var status = outboundEp->respond(res);
    }
}
 
public function validateResponse (http:Caller outboundEp, http:Response res) {
    // Client only supports json. Therefore we need to make sure only json responses are returned
    var payload = res.getTextPayload();
    if (payload is json) {
        if(payload.toString() == "{}") {
            res.statusCode = 500;
            json message = {"error": "Product Not Found"};
            io:println("Product Not Found");
            res.setPayload(message);
        }
    }
} 