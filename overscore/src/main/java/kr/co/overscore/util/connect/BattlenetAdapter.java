package kr.co.overscore.util.connect;

import org.springframework.social.ApiException;
import org.springframework.social.connect.ApiAdapter;
import org.springframework.social.connect.ConnectionValues;
import org.springframework.social.connect.UserProfile;
import org.springframework.social.connect.UserProfileBuilder;

import kr.co.overscore.util.api.Battlenet;

/**
 * @author sala
 */
public class BattlenetAdapter implements ApiAdapter<Battlenet> {
    @Override
    public boolean test(Battlenet api) {
        try {
            api.accountOperations().getAccountId();
            return true;
        } catch (ApiException apiException) {
            return false;
        }
    }

    @Override
    public void setConnectionValues(Battlenet api, ConnectionValues values) {
        final long accountId = api.accountOperations().getAccountId();
        final String battleTag = api.accountOperations().getBattleTag();
        values.setProviderUserId(String.valueOf(accountId));
        values.setDisplayName(battleTag);
    }

    @Override
    public UserProfile fetchUserProfile(Battlenet api) {
        final String battleTag = api.accountOperations().getBattleTag();
        return new UserProfileBuilder().setUsername(battleTag).build();
    }

    @Override
    public void updateStatus(Battlenet api, String message) {
        // Intentionally left blank
    }
}
