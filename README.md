# enterpriseblog
培训二期项目：企业博客

test文件夹不是项目文件，存放数据库文件，要放在D盘根目录下

再server.xml中的Host标签中添加两个Context，项目使用到了虚拟路径
'''
<Context docBase="D:\test\blog" path="/blog"/>
<Context docBase="D:\test\user" path="/user"/>
'''
