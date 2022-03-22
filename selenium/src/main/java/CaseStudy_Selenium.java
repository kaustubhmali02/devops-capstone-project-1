import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

import org.openqa.selenium.chrome.ChromeOptions;
import org.testng.TestListenerAdapter;
import org.testng.TestNG;
import org.testng.annotations.AfterClass;
import org.testng.annotations.BeforeMethod;
import org.testng.annotations.BeforeTest;
import org.testng.annotations.Test;

public class CaseStudy_Selenium {
    WebDriver driver;
    WebElement element;

    public static void main(String[] args) {
        TestListenerAdapter tla = new TestListenerAdapter();
        TestNG testNG = new TestNG();
        testNG.setTestClasses(new Class[]{CaseStudy_Selenium.class});
        testNG.addListener(tla);
        testNG.run();
    }

    @BeforeTest
    private void initChromeDriver() {
        System.setProperty("webdriver.chrome.driver", "/home/kaustubh/jenkins/chromedriver");
        ChromeOptions options = new ChromeOptions();
        options.setHeadless(true);
        driver = new ChromeDriver(options);
    }

    @BeforeMethod
    private void openBrowser() {
        String url = "https://www.bing.com/";
        driver.get(url);
        driver.manage().window().maximize();
    }

    @Test(priority = 1)
    private void searchOnBing() {
        String search = "Intellipaat";
        element = driver.findElement(By.xpath("//input[@id='sb_form_q']"));
        element.sendKeys(search);
        element = driver.findElement(By.xpath("//input[@id='sb_form_go']"));
        element.submit();
    }

    @Test(priority = 2)
    private void getTitle() {
        String getText = driver.getTitle();
        System.out.println(getText);
    }

    @AfterClass
    public void closeBrowser() {
        driver.close();
    }


}