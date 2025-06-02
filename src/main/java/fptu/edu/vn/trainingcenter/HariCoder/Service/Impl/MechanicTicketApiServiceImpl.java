package fptu.edu.vn.trainingcenter.HariCoder.Service.Impl;

import com.fasterxml.jackson.databind.ObjectMapper;
import fptu.edu.vn.trainingcenter.HariCoder.Service.IMechanicTicketApiService;
import fptu.edu.vn.trainingcenter.Model.ServiceMechanic;

import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;

public class MechanicTicketApiServiceImpl implements IMechanicTicketApiService {
    private final HttpClient client;
    private final ObjectMapper mapper;

    public MechanicTicketApiServiceImpl() {
        this.client = HttpClient.newHttpClient();
        this.mapper = new ObjectMapper();
    }
    @Override
    public ServiceMechanic getServiceTicket(String serviceTicketID, String serviceID, String mechanicID) {
        // URL API được hardcode trực tiếp
        String apiUrl = "http://localhost:6969/api/mechanic/serviceticket/edit?serviceTicketID="
                + serviceTicketID + "&serviceID=" + serviceID + "&mechanicID=" + mechanicID;
        HttpRequest request = HttpRequest.newBuilder()
                .uri(URI.create(apiUrl))
                .GET()
                .header("Accept-Charset", "UTF-8")
                .build();
        try {
            HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());
            if (response.statusCode() == 200) {
                return mapper.readValue(response.body(), ServiceMechanic.class);
            }
        } catch (IOException | InterruptedException e) {
            e.printStackTrace();
        }
        return null;
    }
}
