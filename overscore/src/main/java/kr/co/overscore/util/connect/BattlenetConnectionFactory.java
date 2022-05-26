package kr.co.overscore.util.connect;

import org.springframework.social.connect.support.OAuth2ConnectionFactory;

import kr.co.overscore.util.api.Battlenet;

/**
 * @author sala
 */
public class BattlenetConnectionFactory extends OAuth2ConnectionFactory<Battlenet> {

    public BattlenetConnectionFactory(String clientId, String clientSecret) {
        super("battlenet", new BattlenetServiceProvider(clientId, clientSecret), new BattlenetAdapter());
    }
}
