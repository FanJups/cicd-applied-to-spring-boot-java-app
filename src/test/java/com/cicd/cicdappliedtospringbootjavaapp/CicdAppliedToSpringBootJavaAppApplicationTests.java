package com.cicd.cicdappliedtospringbootjavaapp;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import org.springframework.test.context.junit4.SpringRunner;

import com.cicd.cicdappliedtospringbootjavaapp.controller.HelloController;

@RunWith(SpringRunner.class)
@SpringBootTest

public class CicdAppliedToSpringBootJavaAppApplicationTests {
	
	@Autowired
	private HelloController helloController;

	@Test
	public void contextLoads() {
		
		Assert.assertEquals("Welcome To Nucleus",helloController.home() );
	}
	
	

}
