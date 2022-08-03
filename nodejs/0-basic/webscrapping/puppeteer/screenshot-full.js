const puppeteer = require("puppeteer")
const fs = require("fs/promises")

async function start() {
  const browser = await puppeteer.launch()
  const page = await browser.newPage()
  await page.goto("https://www.youtube.com/")

  await page.screenshot({path:'imgfull.png', fullPage: true})
  await browser.close()
}

start()