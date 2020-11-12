
require('dotenv').config()

const {Builder, By, Key, until} = require('selenium-webdriver');

(async function example() {
    let driver = await new Builder().forBrowser('chrome').usingServer(`http://${process.env.SELENIUM_HOST}:${process.env.SELENIUM_PORT}/wd/hub`).build();
    try {
        await driver.get('https://www.google.com');

        await driver.findElement(By.name('q')).sendKeys('QArentena', Key.ENTER);

        let firstResult = await driver.wait(until.elementLocated(By.css('h3>span')), 10000);

        console.log(await firstResult.getAttribute('textContent'));
    }
    finally{
        driver.quit();
    }
})();