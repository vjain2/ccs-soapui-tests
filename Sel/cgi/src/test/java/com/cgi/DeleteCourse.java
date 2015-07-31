package com.cgi;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import jxl.read.biff.BiffException;
import jxl.write.WriteException;
import jxl.write.biff.RowsExceededException;

import org.junit.Test;
import org.openqa.selenium.Alert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.htmlunit.HtmlUnitDriver;

public class DeleteCourse {
	
	String user = System.getProperty("user");
	String pass = System.getProperty("pass");
	String cburl1 = System.getProperty("cburl");
	//String title = "Instructor SSO - Instructor Resource Center";
	
	//String user = "vinay.thakur@contractor.cengage.com";
	//String pass = "Techizen_123";

	
	//WebDriver driver = new FirefoxDriver();
	
	// Declaring and initialising the HtmlUnitWebDriver
	HtmlUnitDriver driver = new HtmlUnitDriver();
	
	@Test
	public void DriverTest() throws InterruptedException, RowsExceededException, BiffException, WriteException, IOException{
      
		System.out.println("user: " + user + " password: " + pass);
		
	// 1. Login to CB and capture CourseKey to feed OLR (it will call method #B.) 
		cbLoginMethod(user,pass);
		
			
	}

	// A. get current date time with Calendar()
 		public String currentDateTimeMethod(){
 				DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
 			    Calendar cal = Calendar.getInstance();
 			    String curDateTime = dateFormat.format(cal.getTime());
 			    return curDateTime;
 		}
    
 	// B. Method for Login to CB portal (it will also call method #A.)
 		public void cbLoginMethod(String user, String pass) throws InterruptedException{
				String curDateTime = currentDateTimeMethod();
				System.out.println(curDateTime);
				
				String cname = "4LTR_Course_" + curDateTime;
				//String cname = "PSYCH4_4LTR_" + curDateTime;
				
				
				System.out.println("*****Value of CB url: " + cburl1);
				driver.get(cburl1);
				//driver.get("https://kt-login.cengage.com/cb/login.htm");
				driver.findElement(By.id("emailId")).clear();
				driver.findElement(By.id("emailId")).sendKeys(user);
				driver.findElement(By.id("password")).clear();
				driver.findElement(By.id("password")).sendKeys(pass);
				driver.findElement(By.cssSelector("input[type=\"submit\"]")).click();
				//Assert.assertTrue(driver.getTitle().contains(title));
				System.out.println("**** Login Successful ****");
				driver.setJavascriptEnabled(true);
				Thread.sleep(2000);
				
				// Manage Course
				
				//Thread.sleep(2000);
				driver.findElement(By.linkText("Manage Courses")).click();
				Thread.sleep(1000);
				System.out.println("**** Manage Courses Page ****");
				
				for (int count=2; count<=14; count++){
				Thread.sleep(9000);
				//driver.findElement(By.xpath("//*[@id='manageCourseForm']/table/tbody/tr[7]/td[8]/a/i")).click();
				//System.out.println("*****Running Loop: " + count);
				//driver.setJavascriptEnabled(true);
				
				if(count<4){
				driver.findElement(By.xpath("//*[@id='manageCourseForm']/table/tbody/tr[4]/td[8]/a/i")).click();
				System.out.println("*****Running Loop: " + count);	
				}else if(count<8){
				driver.findElement(By.xpath("//*[@id='manageCourseForm']/table/tbody/tr[5]/td[8]/a/i")).click();
				System.out.println("*****Running Loop: " + count);
				}else if(count<12){
				driver.findElement(By.xpath("//*[@id='manageCourseForm']/table/tbody/tr[6]/td[8]/a/i")).click();
				System.out.println("*****Running Loop: " + count);
				}else{
				driver.findElement(By.xpath("//*[@id='manageCourseForm']/table/tbody/tr[7]/td[8]/a/i")).click();
				System.out.println("*****Running Loop: " + count);
				}
				
				driver.setJavascriptEnabled(true);
				//Alert all = driver.switchTo().alert();
				//System.out.println(count + ". "+all.getText());
				//Thread.sleep(2000);
				//all.accept();
				Thread.sleep(1000);
				}
				driver.findElement(By.xpath("//*[@id='manageCourseForm']/div[1]/a")).click();
				
				Thread.sleep(1000);		
				driver.findElement(By.linkText("Sign Out")).click();
				
				}
 		

}
