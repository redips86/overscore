package kr.co.overscore.controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.social.connect.Connection;
import org.springframework.social.oauth2.AccessGrant;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.overscore.util.api.Battlenet;
import kr.co.overscore.util.connect.BattlenetConnectionFactory;

@Controller
public class AuthController {
	
	// for real
	String clientId = "7xp3fc2tm3gtz76sjk7qmjh85f28d49z";
	String clientSecret = "daKCnrqTRm8Z74f7B8YjNBbUmEWHKTaa";
	String rootUrl = "https://overscore.kr";
	
	/*
	// for test
	String clientId = "w95cb2px8rv2u7qvsva97ab5cqnb3hqb";
	String clientSecret = "n7SmnVdMrqWhtQyNVaGVMeHGS7TjGSQe";
	String rootUrl = "https://localhost:8443";
		*/
	
	BattlenetConnectionFactory factory =
			new BattlenetConnectionFactory(clientId, clientSecret);
	
	@RequestMapping(value = "/auth/step1", method = RequestMethod.POST)
	public @ResponseBody void getAuthStep1(HttpServletResponse response) {
		OAuth2Parameters oAuthParams = new OAuth2Parameters(); 
		oAuthParams.setRedirectUri(rootUrl + "/auth/step2");
		
		String url = factory.getOAuthOperations().buildAuthenticateUrl(GrantType.AUTHORIZATION_CODE, oAuthParams);
		
		try {
			response.sendRedirect(url);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "/auth/step2", method = RequestMethod.GET)
	public @ResponseBody void getAuthStep2(HttpServletResponse response, 
			@RequestParam(value="code", required=false) String code) {
		if(code != null){
			OAuth2Parameters oAuthParams = new OAuth2Parameters(); 
			oAuthParams.setRedirectUri(rootUrl + "/auth/step2");
			
			AccessGrant accessGrant = factory.getOAuthOperations().exchangeForAccess(code, oAuthParams.getRedirectUri(), null);
			
			Connection<Battlenet> url = factory.createConnection(accessGrant);
			String battleTag = url.getDisplayName();
			try {
				battleTag = URLEncoder.encode(battleTag, "UTF-8");
				
				//battleTag = new String(battleTag.getBytes("ISO-8859-1"),"UTF-8");
				response.sendRedirect("/search?name=" + battleTag);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else{
			try {
				response.sendRedirect("/search?name=");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	
	}
}
