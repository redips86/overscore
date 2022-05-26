package kr.co.overscore.util.api.impl;

import org.springframework.web.client.RestTemplate;

import kr.co.overscore.util.api.AccountId;
import kr.co.overscore.util.api.AccountOperations;
import kr.co.overscore.util.api.BattleTag;

/**
 * @author sala
 */
public class AccountTemplate implements AccountOperations {
    private String API_URL_BASE = "https://kr.api.battle.net";

    private final RestTemplate restTemplate;

    public AccountTemplate(RestTemplate restTemplate) {
        this.restTemplate = restTemplate;
    }

    @Override
    public long getAccountId() {
        return restTemplate.getForObject(API_URL_BASE + "/account/user/id", AccountId.class).getId();
    }

    @Override
    public String getBattleTag() {
        return restTemplate.getForObject(API_URL_BASE + "/account/user/battletag", BattleTag.class).getBattletag();
    }
}
