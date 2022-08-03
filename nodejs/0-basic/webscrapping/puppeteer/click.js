const puppeteer = require("puppeteer")
const fs = require("fs/promises")

async function start() {
  const browser = await puppeteer.launch()
  const page = await browser.newPage()
  await page.goto("https://learnwebcode.github.io/practice-requests/")

  await page.click("#clickme")
  const clickedData = await page.$eval("#data", el => el.textContent)
  console.log(clickedData)

  await browser.close()
}

start()