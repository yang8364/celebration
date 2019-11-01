package com.consume;

import com.consume.feignInterface.SchedualServiceHi;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.cloud.openfeign.EnableFeignClients;

/**
 * 消费者
 * @author lenovo
 */
@SpringBootApplication
@EnableEurekaClient
@EnableFeignClients(clients = SchedualServiceHi.class)
@MapperScan("com.consume.dao.mapper")

public class ConsumeApplication {

    public static void main(String[] args) {
        SpringApplication.run(ConsumeApplication.class, args);
    }

}
