# voosky
this is test project !

配置：
1、在server.xml中配置两个目录，一个是项目工程目录，一个是图片存储虚拟路径 ，如：
      <Host>
      	... ...
      	
		<Context path="/vooskycms" docBase="E:\EGit\gitvoosky\voosky\WebRoot" reloadable="true" />
		
		 <!-- 设置图片虚拟路径[访问时路径为/static_img] -->  
     	<Context path="/static_img" docBase="D:\vooskyimage" reloadable="false" />
      </Host>

2、在config.properties中设置服务器上的磁盘路径，此路径要对应server.xml中设置的图片虚拟路径

upload.service.disk=d://vooskyimage

3、解决中文乱码，即上传图片有中文
<Connector  port="8080" protocol="HTTP/1.1"
			connectionTimeout="20000" 
			redirectPort="8443" 
			URIEncoding="UTF-8"/>
    