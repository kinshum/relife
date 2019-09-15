package com.bzkj.controller.user;import com.bzkj.annotation.Login;import com.bzkj.req.LoginReq;import com.bzkj.req.QueryReq;import com.bzkj.rsp.Result;import io.swagger.annotations.Api;import io.swagger.annotations.ApiImplicitParam;import io.swagger.annotations.ApiImplicitParams;import io.swagger.annotations.ApiOperation;import org.springframework.web.bind.annotation.GetMapping;import javax.servlet.http.HttpServletRequest;import javax.servlet.http.HttpServletResponse;/** * @description: * @author: jensen * @date: created by 2019/9/13 2:28 */@Api(tags = "User")public interface UserController {    /**     * 登录     */    @ApiOperation("登录")    @GetMapping("/api/v1/login")    @ApiImplicitParams({            @ApiImplicitParam(paramType = "query", required = true, name = "username", value = "用户名"),            @ApiImplicitParam(paramType = "query", required = false, name = "password", value = "密码")    })    Result login(LoginReq loginReq);    /**     * 列表     */    @ApiOperation("列表")    @GetMapping("/api/v1/list")    @ApiImplicitParams({            @ApiImplicitParam(paramType = "query", required = false, name = "username", value = "用户名"),            @ApiImplicitParam(paramType = "query", required = true, name = "page", value = "页码"),            @ApiImplicitParam(paramType = "query", required = true, name = "numPerPage", value = "每页条数")    })    Result list(QueryReq queryReq, LoginReq loginReq);    /**     * 登出     */    @GetMapping("/api/v1/logout")    @Login    public Result logout(HttpServletRequest httpReq);}