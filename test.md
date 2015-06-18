# 小票打印客户端使用说明 #

## 简介 ##

本文档将说明如何在程序中调用小票打印客户端接口，将打印数据传递给打印服务器。

## 开发环境 ##

Microsoft.Net Framework 4.0
Visual Studio 2011 及以上版本
MySql 5.6.25 或者 Oracle 11g 及以上版本

## 客户端文件列表 ##

客户端要在宿主程序中运行，包含了如下的文件：

1.	Platform.HB56.Web.PrintMessenger.Client.dll
2.	Platform.HB56.Web.PrintMessenger.Common.dll
3.	Platform.HB56.Web.DAL.dll
4.	Platform.HB56.Web.Common.Models.dll
5.	Oracle.ManagedDataAccess.dll
6.	MySql.Data.dll
7.	Newtonsoft.Json.dll
8.	Microsoft.AspNet.SignalR.Client.dll
9.	log4net.dll
10.	syslog4net.dll
11.	printerclient.config
12.	log.config

## 使用客户端开发 ##

### 配置文件准备 ###

#### 增加appSettings内容 ####

在宿主程序的配置文件中（Web项目对应的是Web.config，WinForm或者控制台程序对应的是 App.config)增加如下的配置：

```xml

<appSettings>
	<add key="PrintServer" value="172.168.154:11290" />
	<add key="hb56.database.config" value="printerclient.config" />
</appSettings>

```

#### 增加数据库Provider描述 ####
由于客户端默认支持的是MySql，因此还需要在宿主程序的配置文件中加上数据库的配置。如果要支持Oracle，请参考【小票打印服务端使用说明】中的【Oracle数据库支持】。

```XML

<system.data>
	<DbProviderFactories>
		<remove invariant="MySql.Data.MySqlClient" />
		<add name="MySQL Data Provider" 
			invariant="MySql.Data.MySqlClient" 
			description=".Net Framework Data Provider for MySQL"
			type="MySql.Data.MySqlClient.MySqlClientFactory, MySql.Data,
				Version=6.9.6.0, 
				Culture=neutral, 
				PublicKeyToken=c5687fc88969c44d" />
	</DbProviderFactories>
</system.data>

```

#### 添加数据库链接 ####

```Xml

<connectionStrings>
	<add name="default" 
		providerName="MySql.Data.MySqlClient"
		connectionString="Database=printmessenger;Data Source=172.16.1.154;
			User Id=root;Password=job#admin@hb56;CharSet=utf8;port=3306" />
</connectionStrings>

```

> **注意:** 数据库连接中的name的值是可以更改的，可以更改成适应宿主程序的名称。该名称与printclient.config中的DefaultConnection配置节的default的值相对应。

#### 修改printclient.config ####

如果第三步中的数据库连接名称不是default，那么需要修改printclient.config文件中的DefaultConnection节点的default的值为对应的名称。

#### 修改或新增log4net配置 ####

> **注意：** 小票打印客户端使用的Log4net版本是1.2.13，如果宿主环境使用了Log4net，并且版本不一致，请先参考 [Log4net版本冲突](#log4netconflict)

##### 宿主程序已经使用Log4net #####

如果在宿主应用中使用了log4net，那么只需要将程序包中的log.config文件中的如下的内容复制到宿主的Log4net配置节点中即可：

```XML
<appender name="DALAppender" type="log4net.Appender.RollingFileAppender">
	<file value=".\\Logs\\dal\\logs.txt" />
	<appendToFile value="true" />
	<rollingStyle value="Size" />
	<maxSizeRollBackups value="5" />
	<maximumFileSize value="10MB" />
	<staticLogFileName value="true" />
	<filter type="syslog4net.Filter.LogExceptionToFileFilter, syslog4net">
		<exceptionLogFolder value=".\\Logs\\dal\\exceptions"/>
	</filter>
	<layout type="syslog4net.Layout.SyslogLayout, syslog4net">
		<structuredDataPrefix value="PrintMessengerClient@HB56"/>
	</layout>
</appender>

<logger name="DALLogger" additivity="False">
	<level value="DEBUG" />
    <appender-ref ref="DALAppender" />
</logger>

```

##### 宿主程序未使用Log4net #####

如果在宿主应用中未用log4net，那么 只需要增加appSettings描述，如下：

```XML

<appSettings>
	<add key="log4net.Config" value="log.config" />
	<add key="log4net.Config.Watch" value="True" />
</appSettings>

```

### 开发引用 ###

开发引用时，只需要引用以下两个文件

1.	Platform.HB56.Web.PrintMessenger.Client.dll
2.	Platform.HB56.Web.PrintMessenger.Common.dll

> 其它的dll文件复制到宿主程序运行目录下（Web项目是bin目录，WinForm或者控制台程序是运行根目录或者指定的bin目录）
> 其它的config文件复制到宿主程序运行根目录下

### 客户端类 ###

客户端类是 PrintMessengerClient，位于 Platform.HB56.Web.PrintMessenger.Client.dll 中。

#### 接口说明 ####

PrintMessengerClient提供如下的接口：

>**PrintMessengerClient(string uri)**: 构造函数，传入参数是服务器的Uri地址。例如：
>192.168.1.154：11290,Uri 地址不包括协议，仅包含地址和端口。

>**bool Connect**： 连接到服务器，默认超时30秒；如果失败，返回false，反之返回true；发生异常时会抛出异常。达到超时时间依然为连接到服务器，返回false。

>**bool Connect(int timeout)**：连接到服务器，达到超时时间后依然未连上，返回false，反之返回true；发生异常时会抛出异常。其中timeout表示超时时间，单位是秒。达到超时时间依然为连接到服务器，返回false。

>**bool SendPrint(string macAddress, string message)**： 发送一条消息到打印服务器，其中macAddress是接收消息并打印的目标机器的MAC地址，如果失败,返回false，反之返回true，默认超时时间30秒。如果发生异常，会抛出异常。

>**bool SendPrint(string macAddress, List<string> messages, int timeout)**：发送一个消息列表到打印服务器，其中macAddress是接收消息并打印的目标机器的MAC地址，如果失败，如果失败,返回false，反之返回true，如果发生异常，会抛出异常。其中timeout表示超时时间，单位是秒。达到超时时间依然未发送出去，返回false。

>**Disconnect()**：断开与服务器的连接。

#### 示例代码 ####

```csharp

PrintMessengerClient client = 
	new PrintMessengerClient(ConfigurationManager.AppSettings["PrintServer"]);

try
{
	if(client.Connect())
	{
		if(!client.SendPrint("001CC423FCF0", "test message"))
		{
			//发送超时
		}
	}
	else
	{
		//连接超时
	}
}
catch(Exception eX)
{
	//处理异常
}

```

## 常见问题 ##

<h3 id="log4netconflict">Log4net版本冲突</h3>

小票打印客户端使用的log4net的版本是1.2.13，如果宿主环境使用的log4net版本与该版本冲突，那么请按照如下的内容修改宿主配置文件（Web项目是web.config，WinForm或者控制台程序是app.config）：

```xml

<runtime>
	<assemblyBinding xmlns="urn:schemas-microsoft-com:asm.v1">
      	<dependentAssembly>
        	<assemblyIdentity name="log4net" 
				publicKeyToken="669e0ddf0bb1aa2a" />
        	<codeBase version="1.2.13.0" 
				href="log4net1_2_13\log4net.dll" />
      	</dependentAssembly>
    </assemblyBinding>
</runtime>

```

然后在运行目录下（Web项目是bin目录，Winform或者控制台程序是运行根目录）新建一个log4net1_2_13目录，并把对应的log4net.dll复制到该目录中。
