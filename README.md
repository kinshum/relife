                                                 微服务模块划分示意图
                  
                                 ————————————————————————————————————————————————
                                |                                                |
                                |                relife-controller               |
                                |________________________________________________|                          
                                       /\          /\          /\         /\
                                       ||          ||          ||         ||  
                                       ||          ||          ||         ||  —————————————RPC调用  
                                       ||          ||          ||         ||  
                                       \/          \/          \/         \/
                                    _________   _________   ________   ________
                                   |         | |         | |        | |        |
                                   | runtime | |   cms   | |activity| | .....  |
                                   |_________| |_________| |________| |________|
                                       /\          /\          /\         /\               
                                       ||          ||          ||         ||
                                       ||          ||          ||         ||  ——————————————本地调用
                                       ||          ||          ||         ||
                                       \/          \/          \/         \/
                                _________________________________________________
                                |                                                |
                                |               relife-facade                    |
                                |________________________________________________|


1.项目模块说明：

relife-controller: 系统的控制层，和以往三层结构中的Controller层的作用一样，都是用作请求调度，这里可以扩展权限，网关

relife-cms: 管理服务

relife-activity: 活动服务

relife-runtime: 将Redis，kafka 一系列软件封装成一个单独的服务，运行在独立的容器中，当哪一个模块需要使用Redis的时候，仅需要引入该服务即可，就免去了各种繁琐的、重复的配置。这些配置均在relife-runtime系统中完成了。

relife-facade: 它处于本系统的最底层，被所有模块依赖，一些公用的类库都放在这里。





层次关系说明：
relife-cms、relife-activty这些模块提供系统的业务逻辑，Service层的各个模块都被抽象成一个个单独的子系统，它们提供RPC接口供上面的relife-controller调用。它们之间的调用由Dubbo来完成，所以它们的pom文件中并不需要作任何配置。这些模块和relife-facade之间是本地调用，需要将relife-facade打成jar包，并让这些模块依赖这个jar，因此就需要在所有模块的pom中配置和relife-facade的依赖关系。









2.Maven的profile功能

<profiles>
	<profile>
		<id>dev</id>
		<properties>
			<profileActive>dev</profileActive>
		</properties>
		<activation>
			<activeByDefault>true</activeByDefault>
		</activation>
	</profile>
	<profile>
		<id>test</id>
		<properties>
			<profileActive>test</profileActive>
		</properties>
	</profile>
	<profile>
		<id>prod</id>
		<properties>
			<profileActive>prod</profileActive>
		</properties>
	</profile>
</profiles>

在子项目中创建配置
分别为dev环境、test环境、prod环境创建三套配置，application.proerpties中存放公用的配置。









3.开发流程 


开发登录服务 
首先需要在relife-Facade模块的facade包中创建UserService接口，并在其中声明登录的抽象函数。

public interface UserService extends IService<SysUser>{

    SysUser getUser(LoginReq loginReq);
}


然后在relife-cms模块的service包中创建UserService的实现——UserServiceImpl。 UserServiceImpl上必须要加上Dubbo的@Service注解，从而告诉Dubbo，在本项目初始化的时候需要将这个类发布成一项服务，供其他系统调用。

@Service(interfaceClass = UserService.class,version = "1.0.0")
@org.springframework.stereotype.Service
public class UserServiceImpl extends ServiceImpl<SysUserMapper, SysUser> implements UserService{

    @Autowired
    SysUserMapper sysUserDAO;


    @Override
    public SysUser getUser(LoginReq loginReq) {
        this.checkParam(loginReq);
        SysUser reqUser = new SysUser();
        reqUser.setLoginName(loginReq.getUsername());
        reqUser.setPassword(PasswordUtil.getPassword(loginReq.getPassword()));
        SysUser sysUser = sysUserDAO.selectOne(reqUser);
        if (null == sysUser) {
            throw new CommonBizException(ExpCodeEnum.USER_NULL);
        }
        else if (sysUser.getLocked() == 1) {
            throw new CommonBizException(ExpCodeEnum.USER_LOCK);
        }
        return sysUser;
    }
}

当UserService开发完毕后，接下来在relife-controller模块的controller包中分别创建UserController接口和UserControllerImpl实现类,若要使用userService中的函数，仅需要在userService上添加@Reference注解，然后就像调用本地函数一样使用userService即可。


@Api(tags = "User")
public interface UserController {

    /**
     * 登录
     */
    @ApiOperation("登录")
    @GetMapping("/api/v1/login")
    @ApiImplicitParams({
            @ApiImplicitParam(paramType = "query", required = true, name = "username", value = "用户名"),
            @ApiImplicitParam(paramType = "query", required = false, name = "password", value = "密码")
    })
    public Result login(LoginReq loginReq);

}


@RestController
public class UserControllerImpl extends BaseController implements UserController {

    @Reference(version = "1.0.0")
    private RedisService redisService;

    @Reference(version = "1.0.0")
    private UserService userService;


    @Override
    public Result login(LoginReq loginReq) {
        SysUser user = userService.getUser(loginReq);
        String token = KeyGenerator.getKey();
        String userKey = RedisPrefixUtil.USER_Prefix + token;
        redisService.put(userKey,user,24,TimeUnit.HOURS);
        return Result.newSuccessResult(token);
    }
}







4.启动整个工程
修改cms,  runtime,  activity,  controller模块dev配置文件redis.kafka,zk地址，
然后依次启动项目。。


