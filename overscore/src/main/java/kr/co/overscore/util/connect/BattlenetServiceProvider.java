package kr.co.overscore.util.connect;

import org.springframework.social.oauth2.AbstractOAuth2ServiceProvider;
import org.springframework.social.oauth2.OAuth2Template;

import kr.co.overscore.util.api.Battlenet;
import kr.co.overscore.util.api.impl.BattlenetTemplate;

/**
 * @author sala
 */
public class BattlenetServiceProvider extends AbstractOAuth2ServiceProvider<Battlenet> {
    public BattlenetServiceProvider(String clientId, String clientSecret) {
        super(new OAuth2Template(clientId, clientSecret,
                // TODO eu -> settings
                "https://kr.battle.net/oauth/authorize",
                "https://kr.battle.net/oauth/token"));
    }

    @Override
    public Battlenet getApi(String accessToken) {
        return new BattlenetTemplate(accessToken);
    }
}
