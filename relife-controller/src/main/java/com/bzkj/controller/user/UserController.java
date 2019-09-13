package com.bzkj.controller.user;import com.bzkj.annotation.Login;import com.bzkj.req.LoginReq;import com.bzkj.rsp.Result;import io.swagger.annotations.Api;import io.swagger.annotations.ApiImplicitParam;import io.swagger.annotations.ApiImplicitParams;import io.swagger.annotations.ApiOperation;import org.springframework.web.bind.annotation.GetMapping;import javax.servlet.http.HttpServletRequest;import javax.servlet.http.HttpServletResponse;/** * @description: * @author: jensen * @date: created by 2019/9/13 2:28 */@Api(tags = "User")public interface UserController {    /**     * 登录     */    @ApiOperation("登录")    @GetMapping("/api/v1/login")    @ApiImplicitParams({            @ApiImplicitParam(paramType = "query", required = true, name = "username", value = "用户名"),            @ApiImplicitParam(paramType = "query", required = false, name = "password", value = "密码")    })    public Result login(LoginReq loginReq);    /**     * 登出     */    @GetMapping("/api/v1/logout")    @Login    public Result logout(HttpServletRequest httpReq);}