package com.cgi;

import org.openqa.selenium.By;
import org.junit.Test;

import junit.framework.TestCase;
import junit.framework.TestSuite;
import jxl.Workbook;
//import jxl.Workbook.
import jxl.Workbook.*;
import jxl.read.biff.BiffException;
import jxl.write.*;
import jxl.write.biff.RowsExceededException;
import jxl.read.biff.BiffException;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.concurrent.TimeUnit;
import java.io.File;
import java.io.IOException;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.htmlunit.HtmlUnitDriver;

/**
 * Unit test for simple App.
 */
public class FirstTest
{
	String user = System.getProperty("user");
	String pass = System.getProperty("pass");
	String olruser = System.getProperty("olruser");
	String olrpass = System.getProperty("olrpass");
	String xls = System.getProperty("xls");
	
	
	//System.out.println("user: " + user + " password: " + password);
	
	
	//String user = "vinay.thakur@contractor.cengage.com";
	//String pass = "Techizen_123";

	//System.out.println("user: " + user + " password: " + password);
	
	//Firefox Driver
	//WebDriver driver = new FirefoxDriver();
	
	// Declaring and initialising the HtmlUnitWebDriver
	HtmlUnitDriver driver = new HtmlUnitDriver();
	
	
	
	@Test
	public void DriverTest() throws InterruptedException, RowsExceededException, BiffException, WriteException, IOException{
      
		System.out.println("user: " + user + " olruser: " + olruser);
		
	// 1. Login to CB and capture CourseKey to feed OLR (it will call method #B.)
		String CourseKey = cbLoginMethod(user,pass );
		//String CourseKey = cbLoginMethod("vinay.thakur@contractor.cengage.com", "password");
		//String CourseKey = "4LPPRHVPNZV7";
		System.out.println("CourseKey: " + CourseKey);
		

	// 2. Login to OLR and pass CourseKey to Capture Course CGI (it will call method #C. & #D.)
			String CourseCGI = null;		
			int count = 1;
			
			CourseCGI = olrLoginMethod(olruser,olrpass, CourseKey);
			//CourseCGI = olrLoginMethod("vinay.thakur@contractor.cengage.com", "password", CourseKey);
			
			System.out.println("1st time search Course CGI: " + CourseCGI);
			
			while(CourseCGI == null || CourseCGI.length() < 2){	
				System.out.println("before lookup method");
				Thread.sleep(2000);
				CourseCGI = olrLookCGIMethod(CourseKey);
				//CourseCGI = olrLoginMethod("vinay.thakur@contractor.cengage.com", "password", CourseKey);
				System.out.println("after lookup method");
				 Thread.sleep(3000);
				 System.out.println(count + " time(s) code run to capture " + "Course CGI: " + CourseCGI + " & current time: " + currentDateTimeMethod());
				 ++count;
				 if(count > 10){
					 System.out.println("ERROR Message!!!: Bad SOA Performance as CGI generation took more than 10 mins. Please re-run program.");
					 break;
				 }
			}
			
			System.out.println("Final Course CGI: " + CourseCGI);
			
	// Close Browser		
						driver.close();
			
	// 3. Write to .XLS file which require for SoapUI tests
			if (CourseCGI.length() > 1){
				writeCGItoXLSMethod(CourseCGI);
				System.out.println("Use Static CGI - OLR is slow");
			}else{
				System.out.println("ERROR Message!!!: Writing to XLS file is unsucessful, please re-run the programm!");
				writeCGItoXLSMethod(CourseCGI);
			}
			
	}

	// A. get current date time with Calendar()
 		public String currentDateTimeMethod(){
 				DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
 			    Calendar cal = Calendar.getInstance();
 			    String curDateTime = dateFormat.format(cal.getTime());
 			    return curDateTime;
 		}
    
 	// B. Method for Login to CB portal (it will also call method #A.)
 		public String cbLoginMethod(String user, String pass) throws InterruptedException{
				String curDateTime = currentDateTimeMethod();
				System.out.println(curDateTime);
				
				String cname = "4LTR_Course_" + curDateTime;
				//String cname = "PSYCH4_4LTR_" + curDateTime;
				
				String cburl1 = System.getProperty("cburl");
				System.out.println("*****Value of CB url: " + cburl1);
				driver.get(cburl1);
				//driver.get("https://kt-login.cengage.com/cb/login.htm");
				driver.findElement(By.id("emailId")).clear();
				driver.findElement(By.id("emailId")).sendKeys(user);
				driver.findElement(By.id("password")).clear();
				driver.findElement(By.id("password")).sendKeys(pass);
				driver.findElement(By.cssSelector("input[type=\"submit\"]")).click();
				driver.setJavascriptEnabled(true);
				Thread.sleep(2000);
				driver.findElement(By.linkText("Create Course")).click();
				Thread.sleep(2000);
				//driver.findElement(By.id("createNewCourse")).click();
				driver.findElement(By.xpath("//*[@id='createNewCourse']")).click();
				Thread.sleep(2000);
				driver.findElement(By.linkText("Continue")).click();
				Thread.sleep(2000);
				System.out.println("***** Failing here ****");
				driver.setJavascriptEnabled(true);
				Thread.sleep(2000);
				//driver.findElement(By.xpath("//*[@id='courseName']")).sendKeys(cname);
				Thread.sleep(1000);
				driver.findElement(By.id("courseName")).clear();
				driver.findElement(By.id("courseName")).sendKeys(cname);
				driver.findElement(By.id("beginDate")).clear();
				driver.findElement(By.id("beginDate")).sendKeys("4/22/2015");
				driver.findElement(By.id("endDate")).clear();
				driver.findElement(By.id("endDate")).sendKeys("12/16/2016");
				driver.findElement(By.id("meetingTimes")).clear();
				driver.findElement(By.id("meetingTimes")).sendKeys("9:00am to 11:00 am");
				driver.findElement(By.id("section")).clear();
				driver.findElement(By.id("section")).sendKeys("Testing VT");
				driver.findElement(By.linkText("Create Course")).click();
				
				Thread.sleep(1000);
				String CourseKeyLink = driver.findElement(By.xpath("//*[@id='courseConfirm']/div[2]/div[2]/p[2]/a[1]")).getText();		
				driver.findElement(By.linkText("Sign Out")).click();
				
				System.out.println("CourseKey Link generated : " + CourseKeyLink);
				int left = CourseKeyLink.indexOf("e/");
				String CourseKey1 = CourseKeyLink.substring(left);
				String CourseKey = CourseKey1.substring(2);
				System.out.println("Coursekey:   " + CourseKey);
				
				//String CourseKey = CourseKeyLink.substring(40);
				return CourseKey;
				}
 		
 	// C. Method for Login to OLR portal
 		public String olrLoginMethod(String user, String pass, String CourseKey) throws InterruptedException{
 		
 			String olrurl1 = System.getProperty("olrurl");
 			System.out.println("*****Value of OLR url: " + olrurl1);
 			driver.get(olrurl1);
 			
 			//driver.get("http://kt-olradmin.cengage.com/olr/admin/index.jsp");
 			Thread.sleep(3000);
 			
 			driver.switchTo().defaultContent();
 			driver.switchTo().frame("bottom");
 			Thread.sleep(1000);
 			driver.findElement(By.name("userName")).clear();
 			Thread.sleep(1000);
 			driver.findElement(By.name("userName")).sendKeys(user);
 			driver.findElement(By.name("password")).clear();
 			driver.findElement(By.name("password")).sendKeys(pass);
 			
 			driver.findElement(By.name("B1")).click();
 			
 			System.out.println("***** Failing here ****");
			driver.setJavascriptEnabled(true);
			Thread.sleep(2000);

 			driver.switchTo().defaultContent();
 			Thread.sleep(1000);
 			driver.switchTo().frame("bottom");
 			Thread.sleep(1000);
 			driver.switchTo().frame("Left");
 			driver.findElement(By.linkText("Course")).click();
 			
 			Thread.sleep(4000);
 			driver.switchTo().defaultContent();
 			Thread.sleep(1000);
 			driver.switchTo().frame("bottom");
 			Thread.sleep(1000);
 			driver.switchTo().frame("Main");
 			driver.findElement(By.name("courseKey")).clear();
 			Thread.sleep(2000);
 			driver.findElement(By.name("courseKey")).sendKeys(CourseKey);		

 			Thread.sleep(2000);
 			
 			driver.findElement(By.cssSelector("input.button_style2")).click();
 			System.out.println("Before Failure...");
 			
 			Thread.sleep(2000);
 			String CourseCGI = driver.findElement(By.name("cgi")).getAttribute("value");
 			System.out.println("Inside olrLoginMethod Course CGI:" + CourseCGI);
 			return CourseCGI;
 		
 			}
 		
 		// D. Method written to search CGI from OLR - loop runs until CGI returns.
 		public String olrLookCGIMethod(String CourseKey) throws InterruptedException{
 				
 				Thread.sleep(30000);
 				driver.switchTo().defaultContent();
 				Thread.sleep(1000);
 	 			driver.switchTo().frame("bottom");
 	 			Thread.sleep(1000);
 	 			driver.switchTo().frame("Main");
 	 			Thread.sleep(10000);
 	 			driver.findElement(By.name("courseKey")).clear();
 	 			Thread.sleep(1000);
 	 			driver.findElement(By.name("courseKey")).sendKeys(CourseKey);
 	 			
 	 			Thread.sleep(3000);
 				driver.findElement(By.cssSelector("input.button_style2")).click();
 				Thread.sleep(2000);
 				String CourseCGI = driver.findElement(By.name("cgi")).getAttribute("value");
 				System.out.println("olrLookCGIMethod Inside method Course CGI:" + CourseCGI);
 				
 				return CourseCGI;
 			}
 		
 		// E. Method is for write into .XLS file, will work once jxl.jar will be added in library 
 		
 		public void writeCGItoXLSMethod(String CGI) throws BiffException, IOException, RowsExceededException, WriteException, InterruptedException{
 			
 			//String XLPath = "/Users/mindtap/SOAPUI/ccs-soapui-tests/Data/SoapUI_INT_e2e_4LTR_MTKG9_Variant.xls";
 			String XLPath = xls;
 			Thread.sleep(1000);
 			//String XLPath = "/Users/mindtap/source/SOAPUI/Data/Test.xls";
 			//String XLPath = "/Users/mindtap/Documents/workspace/Data/Test.xls";
 			System.out.println("Writing to file has STARTED; path: " + XLPath); 
 			Thread.sleep(1000);
 			Workbook workbook1 = Workbook.getWorkbook(new File(XLPath));
 			Thread.sleep(1000);
 		    WritableWorkbook wworkbook = Workbook.createWorkbook(new File(XLPath),workbook1);
 		    Thread.sleep(1000);
 		    WritableSheet wsheet = wworkbook.getSheet(0); 
 		    Label label = new Label(2, 2, CGI);
 		    Thread.sleep(1000);
 		    wsheet.addCell(label);
 		    Label label1 = new Label(2, 4, CGI);
 		    Thread.sleep(1000);
 		    wsheet.addCell(label1);
 		    wworkbook.write();
 		    wworkbook.close();
 		    
 		    System.out.println("Writing to file has COMPLETED!!! " + CGI);
 				
 		}	
}
