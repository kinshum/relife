package com.bzkj.facade.token;

import com.bzkj.dto.LoginUser;
import com.bzkj.dto.Token;

/**
 * Token管理器
 */
public interface TokenService {

    Token saveToken(LoginUser loginUser);

    void updateLoginUser(LoginUser loginUser);

    LoginUser getLoginUser(String token);

    boolean deleteToken(String token);

    String getTokenByUserId(Long userId);

}
