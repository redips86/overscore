package kr.co.overscore.util.api.impl;

import org.springframework.social.oauth2.AbstractOAuth2ApiBinding;
import org.springframework.social.oauth2.TokenStrategy;

import kr.co.overscore.util.api.AccountOperations;
import kr.co.overscore.util.api.Battlenet;

/**
 * @author sala
 */
public class BattlenetTemplate extends AbstractOAuth2ApiBinding implements Battlenet {
    private AccountOperations accountOperations;

    public BattlenetTemplate(String accessToken) {
        super(accessToken, TokenStrategy.ACCESS_TOKEN_PARAMETER);
        initSubApi();
    }

    private void initSubApi() {
        accountOperations = new AccountTemplate(super.getRestTemplate());
    }

    @Override
    public AccountOperations accountOperations() {
        return accountOperations;
    }
}
