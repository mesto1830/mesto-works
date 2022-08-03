const puppeteer = require("puppeteer")
const fs = require("fs/promises")

async function start() {
  const browser = await puppeteer.launch({headless: false, defaultViewport:false})
  const page = await browser.newPage()
  await page.goto("https://www.youtube.com/")

  await browser.close()
}

start()