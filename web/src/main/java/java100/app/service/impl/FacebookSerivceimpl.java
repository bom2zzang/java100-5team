package java100.app.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java100.app.service.FacebookService;
@Service
public class FacebookSerivceimpl implements FacebookService {
    @Override
    public <T> T me(String accessToken, Class<T> type) {
        
        RestTemplate restTemplate = new RestTemplate();
        
        try {
            return restTemplate.getForObject(
                    "https://graph.facebook.com/v2.12/me?access_token={v1}&fields={v2}",
                    type,
                    accessToken, "id,name,email");
            
        } catch (Exception e) {
            throw new RuntimeException (
                    "페이스 북 Graph API 실행오류!",
                    e);
        }
    }
}
