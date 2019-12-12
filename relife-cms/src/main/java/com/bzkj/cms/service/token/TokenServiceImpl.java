package com.bzkj.cms.service.token;


import com.alibaba.dubbo.config.annotation.Reference;
import com.alibaba.dubbo.config.annotation.Service;
import com.bzkj.dto.LoginUser;
import com.bzkj.dto.Token;
import com.bzkj.facade.redis.RedisService;
import com.bzkj.facade.syslog.SysLogService;
import com.bzkj.facade.token.TokenService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.util.StringUtils;

import java.util.UUID;
import java.util.concurrent.TimeUnit;

@Service(interfaceClass = TokenService.class, version = "1.0.0")
@org.springframework.stereotype.Service
public class TokenServiceImpl implements TokenService {

    /**
     * token过期秒数
     */
    @Value("${token.expire.seconds}")
    private Integer expireSeconds;

    @Reference(version = "1.0.0")
    private RedisService redisService;

    @Autowired
    private SysLogService logService;

    @Override
    public Token saveToken(LoginUser loginUser) {
        String token = getTokenByUserId(loginUser.getId());
        if (StringUtils.isEmpty(token)) {
            token = UUID.randomUUID().toString();
        }

        loginUser.setToken(token);
        updateLoginUser(loginUser);
        logService.save(loginUser.getId(), "登陆", true, null);

        return new Token(token);
    }

    /**
     * 更新缓存的用户信息
     */
    @Override
    public void updateLoginUser(LoginUser loginUser) {
        redisService.put(getTokenKey(loginUser.getToken()), loginUser, expireSeconds, TimeUnit.SECONDS);
        redisService.put(getUserIdKey(loginUser.getId()), loginUser.getToken(), expireSeconds,
                TimeUnit.SECONDS);
    }

    @Override
    public LoginUser getLoginUser(String token) {
        return (LoginUser) redisService.get(getTokenKey(token));
    }

    /**
     * 根据userId获取token
     */
    @Override
    public String getTokenByUserId(Long userId) {
        return (String) redisService.get(getUserIdKey(userId));
    }


    @Override
    public boolean deleteToken(String token) {
        String key = getTokenKey(token);
        LoginUser loginUser = (LoginUser) redisService.get(key);
        if (loginUser != null) {
            redisService.delete(key);
            redisService.delete(getUserIdKey(loginUser.getId()));
            logService.save(loginUser.getId(), "退出", true, null);

            return true;
        }
        return false;
    }


    private String getTokenKey(String token) {
        return "tokens:" + token;
    }

    private String getUserIdKey(Long userId) {
        return "users:id:" + userId;
    }


}
