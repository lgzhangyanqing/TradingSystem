package com.mercury.config;



import java.util.concurrent.Executor;
import java.util.concurrent.Executors;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.SchedulingConfigurer;
import org.springframework.scheduling.config.ScheduledTaskRegistrar;

import com.mercury.quartz.MyTask;

/*@Configuration
@EnableScheduling
@ComponentScan(basePackages="com.mercury.quartz")*/
public class AppConfig implements SchedulingConfigurer {
    @Override
    public void configureTasks(ScheduledTaskRegistrar taskRegistrar) {
        taskRegistrar.setScheduler(taskScheduler());
        taskRegistrar.addTriggerTask(new Runnable(){
        	public void run(){
        		myTask().printCurrentTime();
        	}
        }, null);
    }

    @Bean(destroyMethod="shutdown")
    public Executor taskScheduler() {
        return Executors.newScheduledThreadPool(42);
    }
    
	@Bean
	public MyTask myTask(){
		return new MyTask();
	}
}
