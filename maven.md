# 1. settings.xml


```
<?xml version="1.0" encoding="UTF-8"?>
<settings xmlns="http://maven.apache.org/SETTINGS/1.0.0"
          xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
          xsi:schemaLocation="http://maven.apache.org/SETTINGS/1.0.0 http://maven.apache.org/xsd/settings-1.0.0.xsd">

	<pluginGroups>
		<pluginGroup>org.sonatype.plugins</pluginGroup>
	</pluginGroups>

	<proxies>
	</proxies>

	<servers>
		<server>
			<id>pro-snapshot</id>
			<username>deployment</username>
			<password>quheng123456</password>
		</server>

		<server>
			<id>pro-release</id>
			<username>deployment</username>
			<password>quheng123456</password>
		</server>
		<server>
			<id>nexus</id>
			<username>admin</username>
			<password>choosefine</password>
		</server>
	</servers>
	
	<mirrors>
	    <mirror>
	        <id>nexus</id>
	        <mirrorOf>*</mirrorOf>
	        <url>http://192.168.59.240:8081/repository/maven-public/</url>
	    </mirror>
	</mirrors>

</settings>
```


# 2. sample.xml

```
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>

    <groupId>com.qh.attendance</groupId>
    <artifactId>web-sample</artifactId>
    <version>1.0.0</version>
    <packaging>jar</packaging>

    <name>web-sample</name>

    <properties>
        <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
        <project.reporting.outputEncoding>UTF-8</project.reporting.outputEncoding>
        <java.version>1.8</java.version>
    </properties>

    <parent>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-parent</artifactId>
        <version>1.5.6.RELEASE</version>
    </parent>

    <repositories>
        <repository>
            <id>nexus</id>
            <name>nexus</name>
            <url>http://192.168.59.3:8081/nexus/content/groups/public/</url>
            <releases>
                <enabled>true</enabled>
            </releases>
            <snapshots>
                <enabled>true</enabled>
            </snapshots>
        </repository>
    </repositories>
    <pluginRepositories>
        <pluginRepository>
            <id>nexus</id>
            <url>http://192.168.59.3:8081/nexus/content/groups/public/</url>
        </pluginRepository>
    </pluginRepositories>

    <build>
        <plugins>
            <plugin>
                <groupId>org.springframework.boot</groupId>
                <artifactId>spring-boot-maven-plugin</artifactId>
                <dependencies>
                    <dependency>
                        <groupId>org.springframework</groupId>
                        <artifactId>springloaded</artifactId>
                        <version>1.2.5.RELEASE</version>
                    </dependency>
                </dependencies>
            </plugin>
        </plugins>
        <finalName>web-sample</finalName>
    </build>

    <distributionManagement>
        <repository>
            <id>releases</id>
            <name>Releases</name>
            <url>http://192.168.59.3:8081/nexus/content/repositories/releases</url>
        </repository>
        <snapshotRepository>
            <id>snapshot</id>
            <name>Snapshot</name>
            <url>http://192.168.59.3:8081/nexus/content/repositories/snapshots</url>
        </snapshotRepository>
    </distributionManagement>

</project>
```